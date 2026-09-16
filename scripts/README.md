# scripts

Utility scripts for maintaining and distributing this skill.

## make-zip.sh

Packages the plugin directory into a distributable `.zip` archive — the
four skills under `skills/`, the shared `references/`, `templates/` and
`scenarios/`, and the `.claude-plugin/` manifest. Version-control and OS
cruft (`.git`, `.github`, `.gitignore`, `.DS_Store`) and build leftovers
(`__pycache__`, `.pyc`, other zips) are excluded.

```sh
# Write to <skill-root>/<skill-directory-name>.zip
scripts/make-zip.sh

# Write to a specific path
scripts/make-zip.sh /path/to/output.zip
```

The archive contains a single top-level folder named after the skill
directory, so it unzips cleanly.
