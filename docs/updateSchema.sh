#!/bin/bash

#set -x

if [ -z "${1}" ]; then
  echo "use script like this: 'sh updateSchema.sh [path_to_devfile.json]'"
  exit 1
fi

if [ ! -f "${1}" ]; then
    echo "File '${1}' does not exist."
    exit 1
fi

if [ ! -x "$( command -v docker )" ]; then
  echo 'Docker not found. Install to run this script.'
  exit 1
fi

DEVFILE_JSON=$1
REPO_DIR=$( dirname "${0}" )
REPO_DIR=$( realpath "${REPO_DIR}")

docker run -it --rm \
-v "${DEVFILE_JSON}":/home/node/devfile.json:Z \
-v "${REPO_DIR}":/home/node/devfile:Z \
node:8 /bin/bash -c \
"npm install -g @adobe/jsonschema2md@3.3.1; jsonschema2md -d /home/node/devfile.json -o /home/node/devfile;"
