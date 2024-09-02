# does the quickest output of brew list possible for no named arguments.
# HOMEBREW_CELLAR, HOMEBREW_PREFIX are set by brew.sh
# shellcheck disable=SC2154
homebrew-list() {
  case "$1" in
    # check we actually have list and not e.g. listsomething
    list) ;;
    list*) return 1 ;;
    *) ;;
  esac

  local ls_args=()
  local formula=""
  local cask=""

  local first_arg
  for arg in "$@"
  do
    if [[ -z "${first_arg}" ]]
    then
      first_arg=1
      [[ "${arg}" == "list" ]] && continue
    fi
    case "${arg}" in
      # check for flags passed to ls
      -1 | -l | -r | -t) ls_args+=("${arg}") ;;
      --formula | --formulae) formula=1 ;;
      --cask | --casks) cask=1 ;;
      # reject all other flags
      -* | *) return 1 ;;
    esac
  done

  local tty
  if [[ -t 1 ]]
  then
    tty=1
    source "${HOMEBREW_LIBRARY}/Homebrew/utils/helpers.sh"
  fi

  if [[ -z "${cask}" && -d "${HOMEBREW_CELLAR}" ]]
  then
    if [[ -n "${tty}" && -z "${formula}" ]]
    then
      ohai "Formulae"
    fi

    local formula_output
    formula_output="$(ls "${ls_args[@]}" "${HOMEBREW_CELLAR}")" || exit 1
    if [[ -n "${formula_output}" ]]
    then
      echo "${formula_output}"
    fi

    if [[ -n "${tty}" && -z "${formula}" ]]
    then
      echo
    fi
  fi

  if [[ -z "${formula}" && -d "${HOMEBREW_CASKROOM}" ]]
  then
    if [[ -n "${tty}" && -z "${cask}" ]]
    then
      ohai "Casks"
    fi

    local cask_output
    cask_output="$(ls "${ls_args[@]}" "${HOMEBREW_CASKROOM}")" || exit 1
    if [[ -n "${cask_output}" ]]
    then
      echo "${cask_output}"
    fi

    return 0
  fi
}
