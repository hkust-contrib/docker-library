#!/bin/bash

REPOSITORY=$REPO
ACCESS_TOKEN=$TOKEN
ORGANIZATION=$ORG

echo "REPO ${REPOSITORY}"
echo "ACCESS_TOKEN ${ACCESS_TOKEN}"
echo "ORG ${ORGANIZATION}"

if [ -z "$ORGANIZATION" ]; then
  REG_TOKEN=$(curl -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)
  URL="https://github.com/${REPOSITORY}"
else
  REG_TOKEN=$(curl -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)
  URL="https://github.com/${ORGANIZATION}"
fi

cd /home/runner/actions-runner

./config.sh --url ${URL} --token ${REG_TOKEN} --ephemeral

# cleanup() {
#     echo "Removing runner..."
#     ./config.sh remove --unattended --token ${REG_TOKEN}
# }

# trap 'cleanup; exit 130' INT
# trap 'cleanup; exit 143' TERM

./run.sh & wait $!
