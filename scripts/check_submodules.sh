#!/bin/sh

# Check if .gitmodules exists
if [ ! -f .gitmodules ]; then
  echo "No .gitmodules file found. No submodules to check."
  exit 0
fi

# Parse submodule paths from .gitmodules
echo "Checking submodules..."
grep -E 'path = ' .gitmodules | awk '{print $3}' | while read -r submodule_path; do
  if [ -d "$submodule_path" ]; then
    echo "Submodule '$submodule_path' is available."
    # Check if Taskfile.yml exists in the submodule directory
    if [ -f "$submodule_path/Taskfile.yml" ]; then
      echo "  Taskfile.yml found in '$submodule_path'."
    else
      echo "  Taskfile.yml is missing in '$submodule_path'!"
    fi
  else
    echo "Submodule '$submodule_path' is missing!"
  fi
done