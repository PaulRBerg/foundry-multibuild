#!/usr/bin/env bash

# https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# Function to display usage
usage() {
    echo "Usage: $0 --min <min_version> --max <max_version> [--skip-test <true|false>]"
    exit 1
}

# Initialize the parameters
min_version=""
max_version=""
skip_test=true

# Parse the command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
    --min) min_version="$2"; shift ;;   # Shift after capturing to skip the value
    --max) max_version="$2"; shift ;;
    --skip-test) skip_test="$2"; shift ;;
    *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift   # Skip the current key which is already processed
done

# Check if the minimum Solidity version has been provided
if [[ -z "$min_version" ]]; then
    echo "No minimum Solidity version provided"
    usage
fi

# Check if the maximum Solidity version has been provided
if [[ -z "$max_version" ]]; then
    echo "No maximum Solidity version provided"
    usage
fi

# Convert `skip_test` to boolean if needed
if [[ "$skip_test" != true ]] && [[ "$skip_test" != false ]]; then
    echo "Error: --skip-test should be true or false"
    usage
fi

echo "Building from v$min_version to v$max_version. Skip tests: $skip_test"

# These are the Solidity versions supported by Forge
declare -a supported_versions=(
  "0.5.0" "0.5.1" "0.5.2" "0.5.3" "0.5.4" "0.5.5" "0.5.6" "0.5.7" "0.5.8" "0.5.9" "0.5.10" "0.5.11" "0.5.12" "0.5.13" "0.5.14" "0.5.15" "0.5.16" "0.5.17"
  "0.6.0" "0.6.1" "0.6.2" "0.6.3" "0.6.4" "0.6.5" "0.6.6" "0.6.7" "0.6.8" "0.6.9" "0.6.10" "0.6.11" "0.6.12"
  "0.7.0" "0.7.1" "0.7.2" "0.7.3" "0.7.4" "0.7.5" "0.7.6"
  "0.8.0" "0.8.1" "0.8.2" "0.8.3" "0.8.4" "0.8.5" "0.8.6" "0.8.7" "0.8.8" "0.8.9" "0.8.10" "0.8.11" "0.8.12" "0.8.13" "0.8.14" "0.8.15" "0.8.16" "0.8.17" "0.8.18" "0.8.19" "0.8.20" "0.8.21" "0.8.22" "0.8.23" "0.8.24" "0.8.25" "0.8.26" "0.8.27" "0.8.28" "0.8.29"
)

# Check if the minimum Solidity version supplied by user is among the supported versions
if [[ ! " ${supported_versions[*]} " =~ " $min_version " ]]; then
    echo "Minimum Solidity version not supported or does not exist"
    exit 1
fi

# Check if the maximum Solidity version supplied by user is among the supported versions
if [[ ! " ${supported_versions[*]} " =~ " $max_version " ]]; then
    echo "Maximum Solidity version not supported or does not exist"
    exit 1
fi

# Get the index of the minimum version
for mini in "${!supported_versions[@]}"; do
   [[ "${supported_versions[$mini]}" = "$min_version" ]] && break
done

# Get the index of the maximum version
for maxi in "${!supported_versions[@]}"; do
   [[ "${supported_versions[$maxi]}" = "$max_version" ]] && break
done

# Run "forge build" over all versions
for i in $(seq $mini $maxi); do
  if [[ "$skip_test" == "true" ]]; then
    forge build --use ${supported_versions[$i]} --skip "./test/**/*.sol"
  else
    forge build --use ${supported_versions[$i]}
  fi
done
