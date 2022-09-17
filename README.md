# Autoprod
autoprod.sh allows you to easily deploy your process on your server in a simple and automatic way using the cron job scheduler.

After placing `autoprod.sh` in your local repository folder and added to your .gitignore project file, you can use cron as the job scheduler to let this script running automatically.

Please check and modify commands from the autoprod.sh because you don't may use supervisor as your process manager but maybe pm2 or another...

In order to run this script automatically, you'll need [Cron](https://doc.ubuntu-fr.org/cron) which is a job scheduler. (already included in most Linux distros)
- Run `crontab -e` in order to enter and modify your crontab file
- You can setup Autoprod like this following line by adding this line to the file : `* * * * *       root    sh /home/my_super_cool_repo/autoprod.sh`

Once launched, this script will log into `autoprod.log` any update from your git remote request.
