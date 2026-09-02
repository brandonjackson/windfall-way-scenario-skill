# scripts

Utility scripts for maintaining and distributing this skill.

## make-zip.sh

Packages the skill directory into a distributable `.zip` archive, excluding
the `.git` directory and OS/build cruft (`.DS_Store`, `__pycache__`, `.pyc`).

```sh
# Write to ./<skill-directory-name>.zip
scripts/make-zip.sh

# Write to a specific path
scripts/make-zip.sh /path/to/output.zip
```

The archive contains a single top-level folder named after the skill
directory, so it unzips cleanly.
