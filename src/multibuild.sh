#!/usr/bin/env bash

# https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# check that the minimum Solidity version has been supplied
if [ -z "${1-}" ]; then
  echo "No minimum Solidity version supplied"
  exit 1
fi

# check that the maximum Solidity version has been supplied
if [ -z "${2-}" ]; then
  echo "No maximum Solidity version supplied"
  exit 1
fi

# name the input arguments
min=$1
max=$2

# the Solidity versions supported by Forge
declare -a supported_versions=(
  "0.5.0" "0.5.1" "0.5.2" "0.5.3" "0.5.4" "0.5.5" "0.5.6" "0.5.7" "0.5.8" "0.5.9" "0.5.10" "0.5.11" "0.5.12" "0.5.13" "0.5.14" "0.5.15" "0.5.16" "0.5.17"
  "0.6.0" "0.6.1" "0.6.2" "0.6.3" "0.6.4" "0.6.5" "0.6.6" "0.6.7" "0.6.8" "0.6.9" "0.6.10" "0.6.11" "0.6.12"
  "0.7.0" "0.7.1" "0.7.2" "0.7.3" "0.7.4" "0.7.5" "0.7.6"
  "0.8.0" "0.8.1" "0.8.2" "0.8.3" "0.8.4" "0.8.5" "0.8.6" "0.8.7" "0.8.8" "0.8.9" "0.8.10" "0.8.11" "0.8.12" "0.8.13" "0.8.14" "0.8.15" "0.8.16" "0.8.17" "0.8.18" "0.8.19" "0.8.20" "0.8.21" "0.8.22" "0.8.23"
)

# check if the minimum Solidity version supplied by user is among the supported versions
if [[ ! " ${supported_versions[*]} " =~ " $min " ]]; then
    echo "Minimum Solidity version not supported"
    exit 1
fi

# check if the maximum Solidity version supplied by user is among the supported versions
if [[ ! " ${supported_versions[*]} " =~ " $max " ]]; then
    echo "Maximum Solidity version not supported"
    exit 1
fi

# get the index of the minimum version
for mini in "${!supported_versions[@]}"; do
   [[ "${supported_versions[$mini]}" = "$min" ]] && break
done

# get the index of the maximum version
for maxi in "${!supported_versions[@]}"; do
   [[ "${supported_versions[$maxi]}" = "$max" ]] && break
done

# run "forge build" over
for i in $(seq $mini $maxi); do
  forge build --use ${supported_versions[$i]}
done
