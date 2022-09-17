#!/bin/bash
# autoprod.sh allows you to easily deploy your process on your server in a simple and automatic way using the cron job scheduler.

# Here supervisor example but it can be pm2 as well
# ${PWD##*/} refers to the folder name where your process is running
# e.g. If your process AND repository folder name is "my_super_cool_repo" then its is all automatic
# and you don't need any user configuration when copying this shell script into another folder repo.

# git pull to update
PULL=$(git pull 2>&1 | wc -l)

# supervisorctl restart if git return more than 1 line
if [ $PULL -gt 1 ]
then

  # Add / modify whatever command you need for example :
  # pm2 restart ${PWD##*/}
  # supervisorctl stop ${PWD##*/}
  # npm i
  supervisorctl restart ${PWD##*/}
  echo "Repo updated and restarted from git pull at $(date '+%Y-%m-%d %H:%M:%S')" >> autoprod.log

# else
  # echo "No update from git pull command at $(date '+%Y-%m-%d %H:%M:%S')" >> autoprod.log
fi
