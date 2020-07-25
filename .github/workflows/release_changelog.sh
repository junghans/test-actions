#!/bin/bash -le

shopt -s extglob

die () {
  [[ -z $1 ]] || echo "$*" >&2
  exit 1
}

[[ -f CMakeLists.txt ]] || die "No CMakeLists.txt found"
version="$(sed -n 's/set(PROJECT_VERSION *"\([^"]*\)").*/\1/p' CMakeLists.txt)"
[[ ${version} ]] || die "No version found"

if [[ -f CHANGELOG.rst ]]; then
  CHANGELOG=CHANGELOG.rst
  version="${version//_/\\\\\\\\_}" # backslash underscores
  version_section="$(awk -v r="^Version ${version}( |$)" '($0 ~ "^Version"){go=0} ($0 ~ r){go=1}{if(go==1){print $0}}' "${CHANGELOG}" | sed -e '1,2d' -e '/^$/d')"
elif [[ -f CHANGELOG.md ]]; then
  CHANGELOG=CHANGELOG.md
  version_section="$(awk "/^## Version ${version}( |$)/,/^$/{print \$0}" "${CHANGELOG}" | sed -e '1d' -e '/^$/d')"
else
  die "No supported CHANGELOG found"
fi

[[ $version_section ]] || die "Could not find section to $version"
echo "$version_section"
echo "::set-output name=changelog::$version_section"
