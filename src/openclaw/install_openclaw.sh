#!/usr/bin/env bash
set -ex
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo "kasm-user  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



export OPENCLAW_GIT_DIR=/opt/openclaw/

wget https://openclaw.ai/install.sh
chmod +x install.sh

./install.sh --install-method git --no-onboard --no-prompt

rm install.sh
chown -R 1000:1000 /opt/openclaw

curl -fsSL https://openclaw.ai/install.sh | bash -s -- --install-method git
