#!/bin/bash

while getopts ":hlp" opt
do
    case "$opt" in
      (h)
        shift $((OPTIND - 1)) 
         [[ $# -eq 0 ]] && echo help || echo "help: unexpected $*"
         exit;;
      (l)
        shift $((OPTIND - 1)) 
         [[ $# -eq 0 ]] && echo list || echo "list: unexpected $*" 
         exit;;
      (p)
        shift $((OPTIND - 1)) 
         [[ $# -eq 0 ]] && echo purge || echo "purge: unexpected $*" 
         exit;;
      (\?)
         shift $((OPTIND - 1)) 
         [[ $# -eq 0 ]] && echo unknown || echo "unknown: unexpected $*" 
        exit;;
      esac
done

[[ $# -eq 0 ]] && echo help || echo "junk: $*"
