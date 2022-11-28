#!/bin/bash

# TODO
PROJECT_NAME="TODO"

DEV_DIR="${HOME}/development/emgniddikur"

cd "$DEV_DIR/$PROJECT_NAME" || exit

if tmux has-session -t "$PROJECT_NAME"; then
  tmux attach-session -t "$PROJECT_NAME"
else
  tmux new-session -s "$PROJECT_NAME" -d
  tmux attach-session -t "$PROJECT_NAME"
fi
