#!/usr/bin/env bash

# get bash colors and styles here:
# http://misc.flogisoft.com/bash/tip_colors_and_formatting

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function __pre_review() {
    project_path=$(git rev-parse --show-toplevel)
    branch_name=$(git rev-parse --abbrev-ref HEAD)
    # shellcheck disable=SC2001
    branch_name_without_prefix=$(echo "$branch_name" | sed 's#.*/##')
    pattern="([A-Z0-9]+-[0-9]+)"

    if [[ $branch_name_without_prefix =~ $pattern ]]; then
        jira_key="${BASH_REMATCH[1]}"
    else
        # Use a default Jira Key or an error message
        jira_key=""
        echo "Warning: Branch name doesn't match the expected pattern. Using default name: $jira_key"
        exit 1
    fi
    output_dir="/tmp/prSuggestions/src/data/input/$jira_key"
    output_file="$output_dir/$jira_key.txt"

    # Create the output directory if it doesn't exist
    mkdir -p "$output_dir"

    # git diff --diff-filter=AM --unified=0 "$branch_name" -- '*.php' '*.js' '*.java' '*.cs' '*.py' '*.vue' >> "$output_file"
    git diff --diff-filter=AM -U5 "$branch_name" -- '*.php' '*.js' '*.java' '*.cs' '*.py' '*.vue' >> "$output_file"

    # Call Python script with parameters
    python "$SCRIPT_DIR/prSuggestions/main.py" "$jira_key" "$output_file" "$project_path"
}

__pre_review "Pre review using IA"

