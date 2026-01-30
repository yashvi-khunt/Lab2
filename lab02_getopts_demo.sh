#!/bin/bash

while getopts ":hlp" opt
do
    case "$opt" in
      (h)
        shift $((OPTIND - 1)) 
        if [[ $# -eq 0 ]]; then
          echo help    
        else
          echo "help: unexpected $*"
        fi
        exit;;
      (l)
        shift $((OPTIND - 1)) 
        if [[ $# -eq 0 ]]; then
          echo list    
        else
          echo "list: unexpected $*"
        fi
        exit;;
      (p)
        shift $((OPTIND - 1)) 
        if [[ $# -eq 0 ]]; then
          echo purge   
        else
          echo "purge: unexpected $*"
        fi
        exit;;
      (\?)
         shift $((OPTIND - 1)) 
        if [[ $# -eq 0 ]]; then
          echo unknown    
        else
          echo "unknown: unexpected $*"
        fi
        exit;;
      esac
done

if [[ $# -eq 0 ]]; then
  echo "help"
else
  echo "junk: $*"
fi