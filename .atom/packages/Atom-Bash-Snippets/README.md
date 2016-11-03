# Atom Bash Snippets
Bash snippets for Atom

# List of snippets

## Redirect stdout to /dev/null

Prefix: **1**  
Render: `>/dev/null`

## Redirect stderr to /dev/null

Prefix: **2**  
Render: `2>/dev/null`

## Redirect stdout & stderr to /dev/null

Prefix: **12**
Render:`>/dev/null 2>&1`

## Redirect to stderr

Prefix: **e2**
Render: `>&2`

## cat until EOF

Prefix: **cat**  
Render:

    cat <<-EOF >/path/to/file

    EOF

### Notes
- The `-` option to mark a here document limit string (<<-EOF) suppresses leading tabs (but not spaces) in the output. This may be useful in making a script more readable.

- cat something to `stdout` by removing the redirection to file (`>/path/to/file`).

### More about heredocuments

See http://tldp.org/LDP/abs/html/here-docs.html

## Short 'if..then..else' (almost ternary operator)

Prefix: **ite**  
Render: `[[ condition ]] && echo "true" || echo "false" >&2`

### Notes
- Be sure the first command (`echo "true"`) always exits with 0 otherwise, the second command will also be executed!

Example:

    $ [[ 1 -eq 1 ]] && { echo "it's true"; false; } || echo "but it's also false" >&2
    it's true
    but it's also false

## Read file line by line

Prefix: **while read file**  
Render:

    while read -r line
    do
      ${2:echo "\$line"}
    done < ${1:/path/to/file}

## Parsing short command line arguments/parameters

Prefix: **getopts**  
Render:

    while getopts :?h arg
    do
      case $arg in
        )
          : #statements
          ;;
        :|?|h)
          [[ $arg == \? ]] && print_error "L'arg -$OPTARG n'est pas prise en charge !"
          [[ $arg == : ]] && print_error "L'arg -$OPTARG requiert un argument !"
          usage
          exit $([[ $arg == h ]] && echo 0 || echo 2)
          ;;
      esac
    done

### Notes
- After triggering this snippet, you must enter a letter (or number) for the first argument, otherwise, script doesn't works.
- `print_error` is a custom function according to my needs to print message in red to stderr. You can replace it with `echo "the error message" >&2`.

## Parsing short command line options/parameters

Same as above but with support of long options.

Prefix: **getopts long**  
Render:

    while getopts :?a-:fqvh arg
    do
      case $arg in
        -)
          if [[ ${!OPTIND} == -* ]]
          then
            value=
          else
            value="${!OPTIND}"
            ((OPTIND++))
          fi
          case $OPTARG in
            host)
              HOST=$value
              ;;
            port)
              if [[ ! $value =~ ^[0-9]+$ ]]
              then
                print_error "L'arg --$OPTARG a besoin d'un entier en parametre. "$value" n'est pas un entier."
                usage
                exit 2
              fi
              ;;
            *)
              print_error "Le parametre '--$OPTARG' n'est pas reconnu !"
                    usage
                exit 2
                    ;;
            esac
          ;;
        a)
          [[ $OPTARG == -* ]] && print_error "L'option -$arg requiert un argument !" && usage && exit 2
          ;;
        )
          : #statements
          ;;
        f)
          FORCE=1
          ;;
        q)
          QUIET=1
          ;;
        v)
          VERBOSE=1
          ;;
        :|?|h)
          [[ $arg == \? ]] && print_error "L'option -$OPTARG n'est pas prise en charge !"
          [[ $arg == : ]] && print_error "L'option -$OPTARG requiert un argument !"
          usage
          exit $([[ $arg == h ]] && echo 0 || echo 2)
          ;;
      esac
    done

### More about getopts
See http://tldp.org/LDP/abs/html/internal.html#EX33

## function template

Prefix: **function!**
Render:

    # TODO 's description
    # @param  The first parameter
    # @return
    #
    function_name() {
      local param_name="$1"; shift
      echo "TODO !"
    }

## usage function template

Prefix: **usage**
Render:

    usage() {
      cat <<-EOF
      Usage: pgihadmin tache <CIBLE> [-f] [-q] [-h]
      Cette tache permet de bla bla
      PARAMETRES:
      ===========
          CIBLE    Serveur cible : <vide> ou all, aps, ts, lb, ord, apsN, tsN, lbN, ordN (avec N un nombre)
      OPTIONS:
      ========
          -f    Mode force
          -q    Mode silencieux
          -h    Affiche ce message
      EOF
    }
