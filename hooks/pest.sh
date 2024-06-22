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

# Plugin title
title="Pest Unit Task Runner"
echo "$title"
./vendor/bin/pest

