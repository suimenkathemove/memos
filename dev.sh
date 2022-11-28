#!/bin/bash

PROJECT_NAME="articles"

DEV_DIR_PATH="${HOME}/development/suimenkathemove"

cd "$DEV_DIR_PATH/$PROJECT_NAME" || exit

if tmux has-session -t "$PROJECT_NAME"; then
  tmux attach-session -t "$PROJECT_NAME"
else
  tmux new-session -s "$PROJECT_NAME" -d
  tmux attach-session -t "$PROJECT_NAME"
fi
