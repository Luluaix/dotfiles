#!bin/bash
printf "Do you want to add all files, commit and push ? (y/n) : "
read KEY </dev/tty # 5s timeout
if [ "$KEY" = "y" ]; then {
	printf "enter the commit : "
	read KEY </dev/tty
	git -C $1 add .
	git -C $1 commit -m "$KEY"
	git -C $1 push
}
fi;
