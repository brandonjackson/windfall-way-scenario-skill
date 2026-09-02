# scripts

Utility scripts for maintaining and distributing this skill.

## make-zip.sh

Packages the skill directory into a distributable `.zip` archive, excluding
anything whose name starts with a period (`.git`, `.github`, `.gitignore`,
`.DS_Store`, …) plus other build cruft (`__pycache__`, `.pyc`).

```sh
# Write to <skill-root>/<skill-directory-name>.zip
scripts/make-zip.sh

# Write to a specific path
scripts/make-zip.sh /path/to/output.zip
```

The archive contains a single top-level folder named after the skill
directory, so it unzips cleanly.
