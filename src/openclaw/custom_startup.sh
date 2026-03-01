#!/usr/bin/env bash
set -ex

/usr/bin/filter_ready
/usr/bin/desktop_ready

CONFIG_FILE="$HOME/.openclaw/openclaw.json"
UI_SERVER="127.0.0.1:18789"

check_web_server() {
    curl -s -o /dev/null http://$UI_SERVER && return 0 || return 1
}

if [ -f "$CONFIG_FILE" ]; then
    xfce4-terminal --hold --command="$HOME/.local/bin/openclaw gateway --port 18789" &
    while ! check_web_server; do
      sleep 1
    done
    sleep 2
    google-chrome http://$UI_SERVER --start-maximized &
else
    xfce4-terminal --hold --command="$HOME/.local/bin/openclaw gateway --port 18789 --allow-unconfigured" &
    xfce4-terminal --hold --command="$HOME/.local/bin/openclaw onboard" &
    wget https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    chmod +x install.sh
    NONINERACTVE=1 CI=1 ./install.sh
    rm install.sh

fi

