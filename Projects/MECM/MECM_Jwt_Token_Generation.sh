
#!/usr/bin/env bash

set -o pipefail

header_template='{
    "typ": "JWT",
    "kid": "0001"
}'

create_headers() {
        jq -c \
                --arg iat_str "$(date +%s)" \
                --arg alg "${1:-HS256}" \
        '
        ($iat_str | tonumber) as $iat
        | .alg = $alg
        | .iat = $iat
        | .exp = ($iat + 1)
        ' <<<"$header_template" | tr -d '\n'
}

base64enc() { openssl enc -base64 -A | tr '+/' '-_' | tr -d '='; }
build_json() { jq -c . | LC_CTYPE=C tr -d '\n'; }
hsa_sign() { openssl dgst -binary -sha"${1}" -hmac "$2"; }
rsa_sign() { openssl dgst -binary -sha"${1}" -sign <(printf '%s\n' "$2"); }

sign() {
        local algo payload header sig secret=$3
        algo=${1:-RS256}; algo=${algo^^}
        header=$(create_headers "$algo") || return
        payload=${2:-$test_payload}
        signed_content="$(build_json <<<"$header" | base64enc).$(build_json <<<"$payload" | base64enc)"
        case $algo in
                HS*) sig=$(printf %s "$signed_content" | hsa_sign "${algo#HS}" "$secret" | base64enc) ;;
                RS*) sig=$(printf %s "$signed_content" | rsa_sign "${algo#RS}" "$secret" | base64enc) ;;
                *) echo "Unknown algorithm" >&2; return 1 ;;
        esac
        printf '%s.%s\n' "${signed_content}" "${sig}"
}

(( $# )) && sign "$@"

rsa_file="/path/to/filename" #the file where you keep your rsa_private key

payload_file="/path/to/filename" #the file where you keep your payload_file

rsa_secret=$(cat "$rsa_file")

payload_data=$(cat "$payload_file")

sign rs256 "$payload_data" "$rsa_secret"