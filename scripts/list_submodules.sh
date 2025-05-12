#!/bin/sh

# Check if .gitmodules exists
if [ ! -f .gitmodules ]; then
  echo "No .gitmodules file found. No submodules to check."
  exit 0
fi

# Parse submodule paths from .gitmodules
grep -E 'path = ' .gitmodules | awk '{print $3}' | while read -r submodule_path; do
  if [ -d "$submodule_path" ] && [ -f "$submodule_path/Taskfile.yml" ]; then
    echo "$submodule_path"
  fi
done