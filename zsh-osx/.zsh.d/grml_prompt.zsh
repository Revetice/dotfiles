# Help: prompt -h grml


function virtual_env_prompt () {
    REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token \
    virtual-env -f virtual_env_prompt '%F{magenta}' '%f'
# zstyle ':prompt:grml:left:setup' items \
    # rc virtual-env change-root user at host path vcs percent


zstyle ':prompt:grml:left:setup' items rc virtual-env user at host path vcs newline percent
zstyle ':prompt:grml:right:setup' items time sad-smiley

zstyle ':prompt:grml:*:items:user' pre '%B%F{cyan}'
zstyle ':prompt:grml:*:items:user' post '%f%b'

zstyle ':prompt:grml:*:items:host' pre '%F{green}'
zstyle ':prompt:grml:*:items:host' post '%f'

zstyle ':prompt:grml:*:items:percent' pre '%B'
zstyle ':prompt:grml:*:items:percent' post '%b'
