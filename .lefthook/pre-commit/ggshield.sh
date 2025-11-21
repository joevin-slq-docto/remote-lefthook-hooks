#!/usr/bin/env bash

eval "$(mise -C $(dirname "${BASH_SOURCE}")/../.. env)"

if command -v ggshield >/dev/null; then
	set +e
	ggshield secret scan pre-commit >/dev/null 2>&1
	ggshield_exit_code=$?
	set -e

	case "$ggshield_exit_code" in
	0)
		# No secrets found
		;;
	1)
		echo "ggshield detected potential secrets. Commit aborted." >&2
		echo "Set SKIP_GGSHIELD=1 to bypass only if you're certain it's a false positive." >&2
		exit 1
		;;
	*)
		echo "ggshield was skipped due to an error (exit code $ggshield_exit_code)." >&2
		echo "Please double-check for secrets before committing." >&2
		;;
	esac
else
	echo "ggshield (GitGuardian) is missing from your installation."
	echo "Please run 'mise use ggshield'."
	exit 1
fi
