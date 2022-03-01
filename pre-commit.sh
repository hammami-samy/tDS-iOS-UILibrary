#!/bin/bash
set -euxo pipefail

mkdir -p .git/hooks
touch .git/hooks/pre-commit
echo "./build-script.sh" > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "Pre-commit hook successfully configured! (see .git/hooks/pre-commit)"
