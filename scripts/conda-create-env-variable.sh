#!/bin/bash

# Creates a conda environment variable from user input/args.

# Show all existent environment variables
# echo "$(conda env config vars list)"

# Create conda environment variable
VAR_NAME="${1}"
VAR_VALUE="${2}"
conda env config vars set ${VAR_NAME}=${VAR_VALUE}
