#!/bin/sh
cd /home/wolffram/nowcasting-data/
git pull --no-rebase
git add commits_and_updates.csv
git commit --allow-empty -m "update status"
git push