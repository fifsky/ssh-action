#!/bin/sh

# Exit on error. Append "|| true" if you expect an error.
set -o errexit  # same as -e
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail

printf '\033[33m Warning: This action does not currently support host verification; verification is disabled. \n \033[0m\n'

SSHPATH="$HOME/.ssh"
mkdir "$SSHPATH"
touch "$SSHPATH/known_hosts"

echo "$INPUT_KEY" > "$SSHPATH/deploy_key"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/deploy_key"

echo $INPUT_COMMAND > $HOME/shell.sh
echo $INPUT_COMMAND
cat $HOME/shell.sh

echo Start Run Command
sh -c "ssh -i $SSHPATH/deploy_key -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USER}@${INPUT_HOST} < $HOME/shell.sh"