#!/bin/sh

set -eu

printf '\033[33m Warning: This action does not currently support host verification; verification is disabled. \n \033[0m\n'

SSHPATH="$HOME/.ssh"
mkdir "$SSHPATH"
touch "$SSHPATH/known_hosts"

echo "$INPUT_KEY" > "$SSHPATH/deploy_key"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/deploy_key"

echo -e $INPUT_COMMAND > $HOME/shell.sh
echo -e $INPUT_COMMAND
cat $HOME/shell.sh

echo Start Run Command
sh -c "ssh -i $SSHPATH/deploy_key -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USER}@${INPUT_HOST} < $HOME/shell.sh"