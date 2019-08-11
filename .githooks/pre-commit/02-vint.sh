#!/bin/sh
# Run vint on changed .vim files

set -Ceu

if ! command -v vint >/dev/null ; then
	echo 'Warning: vint not installed.  Skipping pre-commit check.' >&2
	exit
fi

# Run vint on added/modified .vim files
# Use -z to \0-separate and prevent quoting of special chars in filenames
# Use tr+grep+tr to filter newline separated (could use --null-data for GNU)
git diff -z --cached --name-only --diff-filter=AM |
	tr '\n\0' '\0\n' |
	grep -a '\.vim$' |
	tr '\0\n' '\n\0' |
	xargs -0r vint -s --
