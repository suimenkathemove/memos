# tmux

[manual page](https://man7.org/linux/man-pages/man1/tmux.1.html)

global options
| option | description |
| ------ | ----------- |
| -t     | target      |

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

## Panes
