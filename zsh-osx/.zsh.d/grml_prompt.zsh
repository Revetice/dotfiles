# Help: prompt -h grml
zstyle ':prompt:grml:left:setup' items rc user at host path vcs newline percent
zstyle ':prompt:grml:right:setup' items time sad-smiley

zstyle ':prompt:grml:*:items:user' pre '%B%F{cyan}'
zstyle ':prompt:grml:*:items:user' post '%f%b'

zstyle ':prompt:grml:*:items:host' pre '%F{green}'
zstyle ':prompt:grml:*:items:host' post '%f'

zstyle ':prompt:grml:*:items:percent' pre '%B'
zstyle ':prompt:grml:*:items:percent' post '%b'
