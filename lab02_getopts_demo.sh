#!/bin/bash

mode=""
opt_count=0

while getopts ":hlp" opt
do
    case "$opt" in
      (h)
        mode="h" 
          ((opt_count++))
         ;;
      (l)
        mode="l" 
          ((opt_count++))
         ;;
      (p)
        mode="p" 
          ((opt_count++))
         ;;
      (\?)
         mode="?"
         ;;
      esac
done                    #set the mode based on the option passed

shift $((OPTIND -1))    #shift the processed options away

# Check for duplicate options
if [[ $opt_count -gt 1 ]]; then
  [[ $# -eq 0 ]] && echo duplicate || echo "duplicate: unexpected $*"
  exit
fi

# Execute based on mode
case "$mode" in
  (h)
     [[ $# -eq 0 ]] && echo help || echo "help: unexpected $*" 
     exit
     ;;
  (l)
    [[ $# -eq 0 ]] && echo list || echo "list: unexpected $*" 
    exit
    ;;
  (p)
    [[ $# -eq 0 ]] && echo purge || echo "purge: unexpected $*"
    exit
    ;;
  (?)
    [[ $# -eq 0 ]] && echo unknown || echo "unknown: unexpected $*"
    exit
    ;;
esac


# Handle case with no options but possible arguments
if [[ $# -eq 0 ]]; then
  echo help
else
  echo "junk: $*"
fi