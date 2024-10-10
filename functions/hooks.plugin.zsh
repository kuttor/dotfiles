
#! /usr/bin/env zsh

# Set default values for EDITOR and INSIDE_EMACS if not set
: ${EDITOR:=vim}

TYPE="$1" VAR="$2" PATH="$3"
XDG_TYPE XDG_VAR XDG_HOME FULL_PATH
XDG_TYPE="${TYPE:l}"
case "${XDG_TYPE}" in
    xdgconfig|config) XDG_TYPE="config" ;;
    xdgdata|data)     XDG_TYPE="data" ;;
    xdgcache|cache)   XDG_TYPE="cache" ;;
    *) print -u2 "Unknown XDG type: ${TYPE}"; return 1 ;;
esac
XDG_VAR="XDG_${(U)XDG_TYPE}_HOME"
XDG_HOME="${(P)${XDG_VAR}:-}"
if [[ -z "${XDG_HOME}" ]]; then
    case "${XDG_TYPE}" in
        config) XDG_HOME="${HOME}/.config" ;;
        data)   XDG_HOME="${HOME}/.local/share" ;;
        cache)  XDG_HOME="${HOME}/.cache" ;;
        *) print -u2 "Error: Invalid XDG_TYPE '${XDG_TYPE}'"; return 1 ;;
    esac
fi
FULL_PATH="${XDG_HOME}/${PATH}"
export ${VAR}="${FULL_PATH}"
print -u2 "Creating directory: ${FULL_PATH:h}"
mkdir -p "${FULL_PATH:h}" || { print -u2 "Failed to create directory"; return 1; }
print "Set ${VAR} to ${FULL_PATH}"