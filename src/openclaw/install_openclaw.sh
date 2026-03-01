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

cat >$HOME/Desktop/openclaw.desktop <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=Unreal Tournament 2004
GenericName=Game
Comment=Unreal Tournament 2004
Exec=/opt/ut2004/launch.sh %F
Path=/opt/ut2004/
Terminal=false
MimeType=text/plain;
Icon=/opt/ut2004/Help/Unreal.ico
Categories=Graphics;Utility;
StartupNotify=true
EOL

chmod +x $HOME/Desktop/openclaw.desktop
chown 1000:1000 $HOME/Desktop/openclaw.desktop