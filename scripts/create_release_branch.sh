#!/bin/sh

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Load the VERSION from the env file in the root directory
. "$SCRIPT_DIR/../VERSION.env"

# Ensure VERSION is set
if [ -z "$VERSION" ]; then
  echo "Error: VERSION is not set in the env file."
  exit 1
fi

# Define the branch name
BRANCH_NAME="release/v$VERSION"

# Navigate to the root directory of the repository
cd "$SCRIPT_DIR/.." || exit 1

# Check if the branch already exists
if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
  echo "Branch '$BRANCH_NAME' already exists. Checking it out..."
else
  echo "Branch '$BRANCH_NAME' does not exist. Creating it..."
  git checkout -b "$BRANCH_NAME"
fi

# Check out the branch
git checkout "$BRANCH_NAME"
echo "Switched to branch '$BRANCH_NAME'."