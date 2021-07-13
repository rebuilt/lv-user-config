#!/bin/sh
ln -sfn $(ls -I current -I README.md -I .git -I mode.sh -I utils| fzf ) current
nvim +PackerSync
