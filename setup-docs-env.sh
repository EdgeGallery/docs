#!/bin/bash

# Env setup for local build

# Common function for exit function
exit_if_error() {
  local exit_code=$1
  shift
  [[ $exit_code ]] &&
    ((exit_code != 0)) && {
    	printf 'ERROR: %s\n' "$@" >&2
    }
}

# Common clean up function
cleanup() {
  rm -rf ~/docs_jjb
}

# Cleanup signal on every exit
trap cleanup EXIT

# Initial cleanup
cleanup

unfilteredver="(python3 -V)"
# Getting the environment's running python3 version
currentver="$(sed 's/[[:alpha:][:space:]]//g' <<< "$unfilteredver")"
requiredver="3.7.9"

# Condition to exit script on lower versions, and continue on equal or higher versions of python3.7.9
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then
  echo "Existing python version is greater than or equal to ${requiredver}"
else
  echo "Existing python version is less than ${requiredver}"
  exit 1
fi

# Getting the environment's running virtualenv version
curvirtualenvver="$(virtualenv --version)"
novirtualenvver="0.0.0"

# Condition to check if virtualenv is installed, if not, to install latest version of it
if [ "$(printf '%s\n' "$novirtualenvver" "$curvirtualenvver" | sort -V | head -n1)" = "$novirtualenvver" ]; then
  echo "python-virtualenv is installed"
else
  echo "python-virtualenv installation begins"
  sudo apt-get update
  sudo apt-get install python-virtualenv -y
  exit_if_error $? "Unable to install python-virtualenv."
fi

lighttpd -v

if [ $? -eq 0 ]; then
   echo "lighttpd INSTALLED"
else
   echo "lighttpd IS NOT INSTALLED, IT WILL BE INSTALLED NOW"
   sudo apt install lighttpd -y
   sudo systemctl start lighttpd
   sudo systemctl enable lighttpd
   sudo systemctl status lighttpd
   #verify lighttpd
   cm=$(lighttpd -v)

   echo -e "$cm"
fi

#command to configure 'server.dir-listing' in conf file
sed -i '/^server.document-root/a server.dir-listing          = "enable"' /etc/lighttpd/lighttpd.conf
