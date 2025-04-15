#!/bin/bash

if [ -z "$REPO_URL" ] || [ -z "$RUNNER_TOKEN" ] || [ -z "$RUNNER_NAME" ]; then
  echo "Error: REPO_URL, RUNNER_TOKEN, and RUNNER_NAME must be set."
  exit 1
fi

./config.sh --url "$REPO_URL" --token "$RUNNER_TOKEN" --name "$RUNNER_NAME" --work _work --unattended

./run.sh
