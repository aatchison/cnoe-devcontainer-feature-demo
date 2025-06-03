#!/usr/bin/env bash
set -e

echo "Starting idpbuilder example..."
echo "Checking if idpbuilder is installed..."
which idpbuilder || { echo "idpbuilder not found in PATH"; exit 1; }

echo "Checking if Docker is running..."
docker version || { echo "Docker is not running"; exit 1; }

echo "Checking if kind is installed..."
which kind || { echo "kind not found in PATH"; exit 1; }

echo "Running idpbuilder create command..."
idpbuilder create \
  -p https://github.com/cnoe-io/stacks/basic/package1 \
  -p https://github.com/cnoe-io/stacks/basic/package2

echo "idpbuilder example completed successfully"