mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/grc"
cp -fv ./colourfiles/conf.* ./grc.conf "${XDG_CONFIG_HOME:-$HOME/.config}/grc"
