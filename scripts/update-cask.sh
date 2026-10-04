#!/usr/bin/env bash
# Points Casks/revoke.rb at the latest Revoke release, or at the tag given as
# the first argument.
set -euo pipefail
cd "$(dirname "$0")/.."

tag=${1:-$(gh release view --repo benjweaver/revoke --json tagName --jq .tagName)}
version=${tag#v}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
gh release download "$tag" --repo benjweaver/revoke --pattern "Revoke-$version.zip" --dir "$tmp"
sha=$(shasum -a 256 "$tmp/Revoke-$version.zip" | cut -d' ' -f1)
sed -i.bak -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" Casks/revoke.rb
rm Casks/revoke.rb.bak
echo "revoke $version $sha"
