#!/usr/bin/env bash

: '
Wraps around autocompletion to run the appspec completion command from within the docker container
'

# Set to fail on non-zero exit code
set -euo pipefail

# Globals
AUTOCOMPLETION_DIR="src/autocompletion"
CWL_ICA_NAMEROOT="cwl-ica"
TEMPLATE_FILE="templates/${CWL_ICA_NAMEROOT}-autocompletion.yaml"

(
 : '
 Run the rest in a subshell
 '

 # Change to autocompletion dir
 cd "${AUTOCOMPLETION_DIR}"

 # Create the bash and zsh dirs
 mkdir -p "bash"
 mkdir -p "zsh"

 # Run the bash completion script
 appspec completion \
  "${TEMPLATE_FILE}" \
  --name "${CWL_ICA_NAMEROOT}" \
  --bash > "bash/${CWL_ICA_NAMEROOT}.bash"

  # Run the zsh completion script
  appspec completion \
    "${TEMPLATE_FILE}" \
    --name "${CWL_ICA_NAMEROOT}" \
	  --zsh > "zsh/_${CWL_ICA_NAMEROOT}"

)