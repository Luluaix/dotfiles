#!bin/bash
# find ${DEV} -name .git | sed 's/....$//' | awk '{system("echo " $1 " | cut -d / -f6- "" && git -C "$1 " status -s" )}'
# for (( i=0; i < ${#tab[@]}; i++ )); do echo ${tab[i]}; done
# for find ${DEV} -name .git | sed 's/....$//'
# echo $REPOSITORIES
# TEST=find ${DEV} -name .git | sed 's/....$//' | awk '{system("echo " $1 " | cut -d / -f6- "" && git -C "$1 " status -s | TMP="wc -l"" )}'
# if [ -n "$TMP" ]; then \
#     echo "not empty" \
# else \
#     echo "empty" \
# fi \
#

VAR=$1
find ${DEV} -name .git | sed 's/....$//' | awk '{
	system("\
	echo " $1 " | cut -d / -f6- "" && \
	git -C "$1 " status -s | \
	if wc -l | grep -q '[1-9]' \
	then git -C "$1 " status && sh $CFG/scripts/gitcommit.sh " $1 " \
    else git -C "$1 " status -s && git -C "$1 " pull \
	fi" )}'
