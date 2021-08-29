#!/bin/bash

clone-it() {
    /usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$1" "google-drive:Backup/$1"
}

clone-it ~/bin
clone-it ~/notes

