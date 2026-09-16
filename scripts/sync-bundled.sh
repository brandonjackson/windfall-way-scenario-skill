#!/usr/bin/env bash
#
# Copy the shared library at the repo root into each skill directory.
#
# Skills only travel reliably with the files inside their own directory:
# when a skill is synced or packaged on its own, anything sitting beside
# skills/ is left behind. So each skill carries its own copy of exactly
# what it reads, and this script keeps those copies honest.
#
# The root copies under references/, templates/ and scenarios/ are the
# single source of truth. Edit those, then run this script.
#
#   scripts/sync-bundled.sh          copy root -> skills, reporting changes
#   scripts/sync-bundled.sh --check  fail if any copy is stale (used by CI)

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Which shared files each skill actually reads. Keep in step with the
# "Bundled resources" section of each SKILL.md.
MANIFEST="
scenario-generation|references/workshop-types.md
scenario-concepting|references/scenario-frameworks.md references/workshop-types.md templates/BRIEF.md templates/CONCEPT.md
scenario-drafting|references/house-style.md templates/SCENARIO.md scenarios/
scenario-stress-testing|references/stress-tests.md
"

CHECK=0
[[ "${1:-}" == "--check" ]] && CHECK=1

stale=0
copied=0

sync_one() {
  local src="$1" dest="$2"
  if [[ -f "$dest" ]] && cmp -s "$src" "$dest"; then
    return
  fi
  if (( CHECK )); then
    echo "stale: $dest" >&2
    stale=1
  else
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "synced: $dest"
    copied=1
  fi
}

while IFS='|' read -r skill entries; do
  [[ -z "${skill// }" ]] && continue
  skill_dir="skills/$skill"
  if [[ ! -d "$skill_dir" ]]; then
    echo "error: no such skill directory: $skill_dir" >&2
    exit 1
  fi

  # Record what this skill is entitled to, so stale extras can be spotted.
  expected=()

  for entry in $entries; do
    if [[ "$entry" == */ ]]; then
      dir="${entry%/}"
      [[ -d "$dir" ]] || { echo "error: missing source directory: $dir" >&2; exit 1; }
      while IFS= read -r src; do
        sync_one "$src" "$skill_dir/$src"
        expected+=("$skill_dir/$src")
      done < <(find "$dir" -type f -name '*.md' | sort)
    else
      [[ -f "$entry" ]] || { echo "error: missing source file: $entry" >&2; exit 1; }
      sync_one "$entry" "$skill_dir/$entry"
      expected+=("$skill_dir/$entry")
    fi
  done

  # Anything bundled under this skill that the manifest no longer lists is
  # a leftover from an earlier layout: drop it rather than let it rot.
  while IFS= read -r found; do
    keep=0
    for want in "${expected[@]}"; do
      [[ "$found" == "$want" ]] && { keep=1; break; }
    done
    (( keep )) && continue
    if (( CHECK )); then
      echo "orphan: $found" >&2
      stale=1
    else
      rm "$found"
      echo "removed: $found"
      copied=1
    fi
  done < <(find "$skill_dir" \( -path "$skill_dir/references/*" -o -path "$skill_dir/templates/*" -o -path "$skill_dir/scenarios/*" \) -type f | sort)
done <<< "$MANIFEST"

if (( CHECK )); then
  if (( stale )); then
    echo >&2
    echo "Bundled skill resources are out of date. Run scripts/sync-bundled.sh and commit the result." >&2
    exit 1
  fi
  echo "Bundled skill resources are up to date."
elif (( ! copied )); then
  echo "Bundled skill resources are already up to date."
fi
