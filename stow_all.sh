#!/bin/bash

find * -maxdepth 0 -type d -print0 | xargs -0 stow -v1

# filter out directories example:
# find * -maxdepth 0 ! -name "*script*" -type d -print0 | xargs -0 stow -v1
