#! /bin/sh

node_env=true;
if ! type node >/dev/nul 2>&1; then
node_env=false;
fi;

echo $node_env