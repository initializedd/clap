#compdef my-app

autoload -U is-at-least

_my-app() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-o+[cmd option]: :_default' \
'-O+[cmd option]: :_default' \
'--option=[cmd option]: :_default' \
'--opt=[cmd option]: :_default' \
'-f[cmd flag]' \
'-F[cmd flag]' \
'--flag[cmd flag]' \
'--flg[cmd flag]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::positional:_default' \
&& ret=0
}

(( $+functions[_my-app_commands] )) ||
_my-app_commands() {
    local commands; commands=()
    _describe -t commands 'my-app commands' commands "$@"
}

if [ "$funcstack[1]" = "_my-app" ]; then
    _my-app "$@"
else
    compdef _my-app my-app
fi
