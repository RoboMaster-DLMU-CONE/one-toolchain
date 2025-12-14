#!/bin/bash
set -e
cd "$(dirname "$0")"
echo "Installing dependencies from offline wheels..."
./python/python -m pip install --no-index --find-links wheels -r requirements.txt
echo "Installation successful."
