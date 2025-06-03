#!/usr/bin/env bash
set -e

echo "Starting cnoe-cli example..."

echo "Checking if cnoe is installed..."
which cnoe || { echo "cnoe not found in PATH"; exit 1; }

echo "Checking if kubectl is installed..."
which kubectl || { echo "kubectl not found in PATH"; exit 1; }

# generate crd from templates
echo "Creating generated directory..."
mkdir -p ./generated
pushd generated

echo "Running cnoe template command..."
cnoe template crd -i ../examples/cnoe-cli/spark/ -t ../examples/cnoe-cli/k8s-apply-template.yaml

echo "Applying generated files with kubectl..."
kubectl apply -f .

sleep 5
# clean up
echo "Cleaning up..."
popd
rm -Rfv ./generated

echo "cnoe-cli example completed successfully"
