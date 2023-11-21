function __jcnd_system_alias_init
    abbr --add ip 'dig +short myip.opendns.com @resolver1.opendns.com'
    abbr --add localip 'ipconfig getifaddr en0'

    abbr --add mute 'osascript -e 'set volume output muted true''
    abbr --add unmute 'osascript -e 'set volume output muted false''
    # Open ports
    abbr --add oports 'lsof -PiTCP -sTCP:LISTEN'
end
