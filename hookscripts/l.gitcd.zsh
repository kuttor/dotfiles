if [ "$XDG_DOWNLOAD_DIR" != "" ]; then
    export GITCD_HOME="$XDG_DOWNLOAD_DIR/repos"
else
    export GITCD_HOME="$HOME/repos"
fi
export GITCD_USEHOST=false
[ ! -d "$GITCD_HOME" ] && mkdir -p "$GITCD_HOME"
