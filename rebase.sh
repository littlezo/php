#!/usr/bin/env bash

while [ "$(git status --short)" ]
do
  git add . && git rebase --continu
done 
