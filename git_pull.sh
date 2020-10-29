#!/usr/bin/env bash
GIT_DIRS=`find ./ -name '.git'`
for dir in $GIT_DIRS
do
 LENGTH=`expr ${#dir} - 6`
 newDIR=${dir:2:$LENGTH}
 echo $newDIR
 cd ~/SourceCode$newDIR
 git fetch --all && git pull
 echo "start to pull local branch"
 git branch -l | grep -v -w `git branch --show-current` | xargs -t -I {} git fetch origin {}:{}
done
