#!/bin/bash

curl -X POST -d "{\"text\": \"Testing Download\"}" -H "Content-Type: application/json" https://api.pushcut.io/SECRET/notifications/Download%20Complete!

osascript /Users/server/Library/Mobile\ Documents/com\~apple\~ScriptEditor2/Documents/transmissionNote.scpt "${TR_TORRENT_NAME}"