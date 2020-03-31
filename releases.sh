#!/usr/bin/env bash

set -o pipefail

get_contents() {
  tags=$(curl -s "https://gitlab.com/api/v4/projects/6094330/repository/tags" | jq '.[] | .name' -r)
  first=true

  declare -A seen_minor_versions
  for tag in $tags; do
    minor_version=$(echo "$tag" | cut -d . -f 2)
    if [[ -v seen_minor_version[$minor_version] ]]; then
      continue
    fi
    seen_minor_version[$minor_version]=true

    rel_exists=false
    rel="https://dl.commento.io/release/commento-$tag-linux-glibc-amd64.tar.gz"
    sig="https://dl.commento.io/release/commento-$tag-linux-glibc-amd64.tar.gz.asc"
    rel_sha=$(curl --fail -s "$rel" -o - | sha256sum - | cut -f 1 -d ' ')
    exit_code=$?
    if [[ "$exit_code" == "0" ]]; then
      rel_exists=true
    fi

    src="https://dl.commento.io/release/commento-$tag-src.tar.gz"
    src_sha=$(curl -s "$src" -o - | sha256sum - | cut -f 1 -d ' ')

    if [[ "$first" == "true" ]]; then
      printf "#### Latest Release &ndash;&nbsp; \`%s\`\n\n" "$tag"

      if [[ "$rel_exists" == "true" ]]; then
        printf " - \`[commento-%s-linux-glibc-amd64.tar.gz](%s)\`  \n" "$tag" "$rel"
        printf "   <p class=\"sha\">%s</p> [(Signature)](%s)\n\n" "$rel_sha" "$sig"
      else
        printf " - No release binaries available for \`%s\`.\n\n" "$tag"
      fi

      printf " - \`[commento-%s-src.tar.gz](%s)\`  \n" "$tag" "$src"
      printf "   <p class=\"sha\">%s</p>\n\n" "$src_sha"

      printf "#### Previous Releases\n\n"
      first=false
      continue
    fi

    printf "##### \`%s\`\n\n" "$tag"

    if [[ "$rel_exists" == "true" ]]; then
      printf " - \`[commento-%s-linux-glibc-amd64.tar.gz](%s)\`  \n" "$tag" "$rel"
      printf "   <p class=\"sha\">%s</p> [(Signature)](%s)\n\n" "$rel_sha" "$sig"
    else
      printf " - No release binaries available for this release.\n\n"
    fi

    printf " - \`[commento-%s-src.tar.gz](%s)\`  \n" "$tag" "$src"
    printf "   <p class=\"sha\">%s</p>\n\n" "$src_sha"
  done
}

get_contents | tee releases.md
