# tmux

[manual page](https://man7.org/linux/man-pages/man1/tmux.1.html)

global options
| option    | description       |
| --------- | ----------------- |
| -t        | target            |
| -c        | working directory |
| 'COMMAND' | command           |

## Sessions

### new

```shell
tmux new-session
```

| option  | description  |
| ------- | ------------ |
| -s NAME | session name |
| -d      | detach       |
| -n NAME | window name  |

[tmux-start.sh](https://github.com/emgniddikur/dotfiles/blob/main/.commands/tmux-start.sh)

### attach

-t

```shell
tmux attach-session
```

### has

-t

```shell
tmux has-session
```

## Windows

### new

```shell
tmux new-window
```

| option  | description |
| ------- | ----------- |
| -n NAME | window name |

### select

-t

```shell
tmux select-window
```

## Panes

## Troubleshooting

[バックスペースがスペースになるバグの対応](https://github.com/tmux/tmux/issues/597)
