#!/bin/sh

RADARR_BRANCH=develop
if [ -n "${1}" ]; then
	RADARR_BRANCH=${1}
fi

for tool in wget jq; do
	command -v "${tool}" >/dev/null 2>&1 || { echo "${tool} is not installed"; exit 1; } 
done

wget -O - "https://radarr.servarr.com/v1/update/${RADARR_BRANCH}/changes?runtime=netcore&os=linuxmusl" | jq -r '.[0].version'

