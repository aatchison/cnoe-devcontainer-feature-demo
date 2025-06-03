#!/usr/bin/env bash
set -e

echo "Starting idpbuilder example..."
echo "Checking if idpbuilder is installed..."
which idpbuilder || { echo "idpbuilder not found in PATH"; exit 1; }

echo "Checking if Docker is running..."
docker version || { echo "Docker is not running"; exit 1; }

echo "Checking if kind is installed..."
which kind || { echo "kind not found in PATH"; exit 1; }

echo "Cloning stacks repository..."
git clone https://github.com/cnoe-io/stacks.git /tmp/stacks || true

echo "Running idpbuilder create command..."
# Try with local paths first
if [ -d "/tmp/stacks/basic/package1" ] && [ -d "/tmp/stacks/basic/package2" ]; then
  echo "Using local paths from cloned repository..."
  idpbuilder create \
    -p "/tmp/stacks/basic/package1" \
    -p "/tmp/stacks/basic/package2"
else
  echo "Trying with URLs..."
  idpbuilder create \
    -p "https://github.com/cnoe-io/stacks/basic/package1" \
    -p "https://github.com/cnoe-io/stacks/basic/package2"
fi

echo "idpbuilder example completed successfully"