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
    rel_sig="https://dl.commento.io/release/commento-$tag-linux-glibc-amd64.tar.gz.asc"
    rel_sha=$(curl --fail -s "$rel" -o - | sha256sum - | cut -f 1 -d ' ')
    exit_code=$?
    if [[ "$exit_code" == "0" ]]; then
      rel_exists=true
    else
      rel_exists=false
    fi

    src="https://dl.commento.io/release/commento-$tag-src.tar.gz"
    src_sha=$(curl --fail -s "$src" -o - | sha256sum - | cut -f 1 -d ' ')
    src_sig="https://dl.commento.io/release/commento-$tag-src.tar.gz.asc"
    curl --fail -s "$src_sig" -o /dev/null
    exit_code=$?
    if [[ "$exit_code" == "0" ]]; then
      src_sig_exists=true
    else
      src_sig_exists=false
    fi

    if [[ "$first" == "true" ]]; then
      printf "#### Latest Release &ndash; %s\n\n" "$tag"

      if [[ "$rel_exists" == "true" ]]; then
        printf " - [commento-%s-linux-glibc-amd64.tar.gz](%s) ([signature](%s))  \n" "$tag" "$rel" "$rel_sig"
        printf "   <p class=\"sha\">%s</p>\n\n" "$rel_sha"
      else
        printf " - No release binaries available for \`%s\`.\n\n" "$tag"
      fi

      if [[ "$src_sig_exists" == "true" ]]; then
        printf " - [commento-%s-src.tar.gz](%s) ([signature](%s))  \n" "$tag" "$src" "$src_sig"
      else
        printf " - [commento-%s-src.tar.gz](%s)%s  \n" "$tag" "$src"
      fi
      printf "   <p class=\"sha\">%s</p>\n\n" "$src_sha"

      printf "#### Previous Releases\n\n"
      first=false
      continue
    fi

    printf "<details>\n"
    printf "<summary><b>%s</b></summary>\n" "$tag"
    printf "<ul>\n"
    if [[ "$rel_exists" == "true" ]]; then
        printf "<li><p><a href='%s'>commento-%s-linux-glibc-amd64.tar.gz</a> (<a href='%s'>signature</a>)</p>\n" "$rel" "$tag" "$rel_sig"
        printf "<p class=\"sha\">%s</p></li>\n\n" "$rel_sha"
    else
      printf "<li><p>No release binaries available for this release.</p></li>\n"
    fi

    if [[ "$src_sig_exists" == "true" ]]; then
      printf "<li><p><a href='%s'>commento-%s-src.tar.gz</a> (<a href='%s'>signature</a>)</p>\n" "$src" "$tag" "$src_sig"
    else
      printf "<li><p><a href='%s'>commento-%s-src.tar.gz</a></p>\n" "$src" "$tag"
    fi
    printf "<p class=\"sha\">%s</p></li>\n\n" "$src_sha"
    printf "</ul></details>\n"
  done
}

get_contents | tee releases.md
