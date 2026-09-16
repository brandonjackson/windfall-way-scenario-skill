#!/usr/bin/env bash
#
# make-zip.sh — package this skill into a distributable zip archive,
# excluding the .git directory and other version-control / OS cruft.
#
# Usage:
#   scripts/make-zip.sh [output.zip]
#
# If no output path is given, the archive is written to the skill root as
# <skill-directory-name>.zip. A relative path argument is resolved against
# the current working directory.

set -euo pipefail

# Resolve the skill root as the parent of this script's directory,
# so the script works regardless of where it's invoked from.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"
skill_name="$(basename "$root_dir")"

# Determine output path (absolute), defaulting to the skill root:
# <root_dir>/<skill_name>.zip. A relative argument is resolved against CWD.
output="${1:-$root_dir/$skill_name.zip}"
case "$output" in
  /*) : ;;                    # already absolute
  *)  output="$PWD/$output" ;;
esac

if ! command -v zip >/dev/null 2>&1; then
  echo "error: 'zip' command not found; please install zip" >&2
  exit 1
fi

# Remove any stale archive so we don't append to it.
rm -f "$output"

# Build from the parent of the skill root so archive entries are
# prefixed with the skill directory name (a clean top-level folder).
parent_dir="$(dirname "$root_dir")"
cd "$parent_dir"

# Exclude version-control and OS cruft, plus build leftovers. The
# .claude-plugin directory is deliberately kept: the archive is a plugin
# bundle (four skills under skills/ plus the shared references, templates
# and scenarios), so it needs its manifest to be installable.
zip -r -q "$output" "$skill_name" \
  -x "*/.git/*" \
  -x "*/.github/*" \
  -x "*/.gitignore" \
  -x "*/.DS_Store" \
  -x "*/__pycache__/*" \
  -x "*.pyc" \
  -x "*.zip"

echo "Created $output"
