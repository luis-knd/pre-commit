#!/usr/bin/env bash

INSTALLED=$(cat ~/.cache/pre-commit/LCANDESIGN)


if [ -z "$INSTALLED"  ]
then
  echo "installing dependencies"


  SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

  cd "$SCRIPT_DIR/prSuggestions" || exit 1
  pip install -r requirements.txt


fi
echo "INSTALLED" > ~/.cache/pre-commit/LCANDESIGN
