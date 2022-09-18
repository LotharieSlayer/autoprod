#!/bin/bash
# autoprod.sh allows you to easily deploy your process on your server in a simple and automatic way using the cron job scheduler.
# author: Lothaire Guée

# Here's supervisor example but it can be any other process manager
# The only thing you have to change is the PROCESS_NAME variable which is the name of your process/git repo
# You can change the Git folder location too, by default, all your git folders must be in your home/ folder.
# Warning : The repository/folder name need to be the same as the process name to let this script works !

# Process and git repository folder name
PROCESS_NAME="my_super_cool_repo"

# Git folder location
cd /home/$PROCESS_NAME

# git pull to update the code
PULL=$(git pull 2>&1 | wc -l)

# supervisorctl restart if git return more than 1 line
if [ $PULL -gt 1 ]
then
  # Add / modify whatever command you need for example :
  # npm i
  # pm2 restart $PROCESS_NAME
  supervisorctl restart ${PROCESS_NAME}
  echo "Repository ${PROCESS_NAME} had been updated and restarted from git pull at $(date '+%Y-%m-%d %H:%M:%S')" >> autoprod.log
# else
  # echo "No update from git pull command on ${PROCESS_NAME} at $(date '+%Y-%m-%d %H:%M:%S')" >> autoprod.log
fi
