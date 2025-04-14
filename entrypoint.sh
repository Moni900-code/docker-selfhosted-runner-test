#!/bin/bash

./config.sh --unattended \
  --url "$REPO_URL" \
  --token "$RUNNER_TOKEN" \
  --name docker-runner-1 \
  --work _work \
  --labels docker \
  --replace

./run.sh
