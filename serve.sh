#!/usr/bin/env bash
# Jekyll hits GitHub (e.g. jekyll-github-metadata). Point OpenSSL at the system CA bundle.
set -e
cd "$(dirname "$0")"

if [[ -z "${SSL_CERT_FILE:-}" ]]; then
  if [[ -f /etc/ssl/cert.pem ]]; then
    export SSL_CERT_FILE=/etc/ssl/cert.pem
  elif [[ -f "$(brew --prefix 2>/dev/null)/etc/ca-certificates/cert.pem" ]]; then
    export SSL_CERT_FILE="$(brew --prefix)/etc/ca-certificates/cert.pem"
  fi
fi

exec bundle exec jekyll serve "$@"
