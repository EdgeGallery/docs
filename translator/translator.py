#!/usr/bin/env python3

from googletrans import Translator as GoogleTranslator
import json
from pathlib import Path
import os
import re
import shutil
import sys

def search(pattern="*.*"):
  print("Searching for ", pattern )
  try:
    result = list(Path(".").rglob(pattern))
    _paths = []
    for _path in result:
        _paths.append(str(_path))
    return _paths
  except:
    print("[search] Unexpected error:", sys.exc_info()[0])
    raise

def find(patterns=[]):
    for ext in patterns:
        for file in search(ext):
            print('[{0}] Finding entries ... '.format(file))
            try:
                _line_no = 0
                _result = {
                    'file_path': file,
                    'records' : []
                }
                pos = 0
                with open(file, encoding='utf-8', mode='r+') as file_obj:
                    lines = file_obj.readlines()
                    for line in lines:
                        _line_no += 1

                        _entries = []
                        _exist = False

                        #Handle only comments
                        line = line.strip()
                        try:
                            #pos += len(line)
                            #pos = file_obj.tell()
                            #_next_line = str(next(file_obj))
                            _next_line = lines[_line_no]
                            #file_obj.seek(pos)
                        except:
                            _next_line = ""
                        if line.startswith("msgid") and -1 != _next_line.find("msgstr \"\""):
                            for n in re.findall(r'[\u4e00-\u9fff]+', line):
                                _entries.append(n)
                                _exist = True

                            if _exist:
                                _record = {}
                                _record['line_no'] = _line_no
                                _entries.sort(key=len, reverse=True)
                                _record['entries'] = _entries

                                _result['records'].append(_record)

                if len(_result['records']) > 0:
                    json_file = "{0}._audit__.json".format(file)
                    open(json_file, "w").write(json.dumps(_result))
            except:
              print("[find] Unexpected error:", sys.exc_info()[0])
              raise

def _translate_google(file_entries, src, dest):
    if src == "zh":
        src = "auto"
    translator = GoogleTranslator()
    _translations = []

    for translation in translator.translate(file_entries, src=src, dest=dest):
        _translations.append(translation.text)
    return _translations

def translate(optimize=False):
    files = search("*._audit__.json")
    src="zh"
    dest="en"

    if len(files) == 0:
        return

    if not optimize: #File vise
        for file in files:
            with open(file, encoding='utf-8') as fh:
                find_results = json.load(fh)

            print('[{0}] Translating entries ... '.format(
            find_results['file_path']))

            _file_entries = []

            for line_records in find_results['records']:
                _file_entries.extend(line_records['entries'])

            translations = _translate_google(_file_entries, src, dest)

            translated_entries_map = {}
            for idx in range(len(translations)):
                translated_entries_map[_file_entries[idx]] = translations[idx]

            for line_records in find_results['records']:
                _entries_translated = []
                for entry in line_records['entries']:
                    _entries_translated.append(translated_entries_map[entry])
                line_records['entries_translated'] = _entries_translated

            open(file, encoding='utf-8', mode="w").write(
            json.dumps(find_results))
    else: # whole proect
        _project_entries = []

        for file in files:
            with open(file, encoding='utf-8') as fh:
                find_results = json.load(fh)

            for line_records in find_results['records']:
                _project_entries.extend(line_records['entries'])

        _is_manual = input("Would you like to perform manual translation " +
                    "(y/n?)")
        if _is_manual == 'y':
            with open('entries.list', encoding='utf-8', mode="w") as \
                entry_list_file:
                for entry in _project_entries:
                    entry_list_file.write(entry + os.linesep)

            while True:
                _is_done = input('please translate ./entries.list manually ' +
            'into entries.list.translated and press (y)')
                if _is_done == 'y':
                    if os.path.exists('entries.list.translated'):
                        break;
                    else:
                        print('entries.list.translated does not exist')

            translations = []
            with open('entries.list.translated', encoding='utf-8', mode="r") as \
                entry_list_trans_file:
                for line in entry_list_trans_file:
                    if line.strip():
                        translations.append(line.rstrip())
        else:
            translations = _translate_google(_project_entries, src, dest)

        translated_entries_map = {}
        for idx in range(len(translations)):
            translated_entries_map[_project_entries[idx]] = translations[idx]

        for file in files:
            with open(file, encoding='utf-8') as fh:
                find_results = json.load(fh)

            for line_records in find_results['records']:
                _entries_translated = []
                for entry in line_records['entries']:
                    _entries_translated.append(translated_entries_map[entry])
                line_records['entries_translated'] = _entries_translated

            open(file, encoding='utf-8', mode="w").write(
            json.dumps(find_results))

def replace():
    files = search("*._audit__.json")
    for audit_file in files:
        with open(audit_file, encoding='utf-8') as fh:
            find_results = json.load(fh)

        file = find_results['file_path']
        print('[{0}] Replacing entries ... '.format(file))
        _line_record_map = {}
        _line_record_tranx_map = {}
        for record in find_results['records']:
            _line_record_map[record['line_no']] = record['entries']
            _line_record_tranx_map[record['line_no']] = \
            record['entries_translated']

        _translated_file = "{0}.translated".format(file)
        with open(file, encoding='utf-8', mode='r') as file_obj:
            with open(_translated_file, encoding='utf-8', mode='w') as \
             _translated_file_obj:
                _translated_lines = []
                _line_no = 0
                _skip_next_line = 0
                for line in file_obj:
                    _line_no += 1
                    if _skip_next_line == 1:
                        _skip_next_line = 0
                        continue
                    if _line_no in _line_record_map:
                        _next_line = line
                        for idx in range(len(_line_record_map[_line_no])):
                            _from = _line_record_map[_line_no][idx]
                            _to = _line_record_tranx_map[_line_no][idx]
                            _next_line = re.sub(_from, _to, _next_line)
                            print("[{0}] {1} -> {2}".format(_line_no, _from, _to))
                        _translated_lines.append(line)
                        _next_line = re.sub("msgid", "msgstr", _next_line)
                        _translated_lines.append(_next_line)
                        _skip_next_line = 1
                    else:
                        _translated_lines.append(line)

                _translated_file_obj.writelines(_translated_lines)
        shutil.move(_translated_file, file)

def usage():
    print('usage: -f <*.java *.xml ...> | -t -O | -r  | -s')

if __name__ == "__main__":
    if len(sys.argv) == 1:
        usage();
        exit()

    command = sys.argv[1]
    if command == '-f': # Make it ready
        if len(sys.argv) > 2:
            patterns = sys.argv[2:]
        else:
            patterns = ["*.java", "*.go", "*.c", "*.js", "*.xml", "*.yaml" , \
             "*.html"]

        find(patterns)
    elif command ==  '-t':
        if len(sys.argv) > 2:
            if sys.argv[2] == '-O':
                optimize = True
        else:
            optimize = False

        translate(optimize)
    elif command == '-r':
        replace()
    else:
        usage()
