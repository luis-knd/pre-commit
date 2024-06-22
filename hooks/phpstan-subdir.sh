#!/usr/bin/env bash

# Bash PHP Unit Task Runner
#
# Exit 0 if no errors found
# Exit 1 if errors were found
#
# Requires
# - php
#
# Arguments
# - None
echo "$@"
SUBDIR="$1"
./"${SUBDIR}"/vendor/bin/phpstan analyze --configuration "$SUBDIR/phpstan.neon" "${@:2}"

