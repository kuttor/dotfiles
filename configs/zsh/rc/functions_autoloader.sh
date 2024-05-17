#!/usr/bin/env zsh

# Define the paths to the functions directories
fpaths=("/path/to/your/functions/directory1" "/path/to/your/functions/directory2")

# Function to autoload all files in the functions directories
autoload_functions() {
    for fpath in $fpaths; do
        # Add the directory to the fpath array
        fpath=($fpath $fpath)

        # Autoload all files in the directory
        for file in $fpath/*(.N); do
            autoload -Uz "${file:t}"
      ,  done
    done
}

# Function to check for changes in the functions directories
check_functions() {
    for fpath in $fpaths; do
        # Get the current list of files in the directory
        current_files=($fpath/*(.N:t))

        # Get the list of autoloaded functions
        autoloaded_functions=($(functions -t))

        # Unload functions that have been deleted
        for func in $autoloaded_functions; do
            if [[ ! " ${current_files[@]} " =~ " ${func} " ]]; then
                unfunction $func
            fi
        done

        # Autoload new functions
        for file in $current_files; do
            if [[ ! " ${autoloaded_functions[@]} " =~ " ${file} " ]]; then
                autoload -Uz $file
            fi
        done
    done
}

# Call the functions initially
autoload_functions
check_functions

# Set up a watcher to call check_functions when a file is added or deleted
zshaddhistory() {
    check_functions
    return 1
}
