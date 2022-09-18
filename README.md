
<h3 align="center"><img src="https://user-images.githubusercontent.com/49253492/190898264-3e6fb94a-6eed-42e7-b5bc-02406cee05ed.png" width="600px"></h3>

autoprod.sh allows you to easily deploy your process on your server in a simple and automatic way using the cron job scheduler.

### Installation :

After placing `autoprod.sh` in your local repository folder, you can use cron as the job scheduler to let this script run automatically.

- Please check and modify the autoprod.sh because you don't may use supervisor as your process manager but maybe pm2 or another... 
- After that **the only thing you have to change is the PROCESS_NAME variable** which is the name of your process/git repo
- You can change the Git folder location too, by default, **all your git folders must be in your home/ folder.**

**Warning :** The git repository/folder name need to be the same as the process name to let this script works !

In order to run this script automatically, you'll need [Cron](https://doc.ubuntu-fr.org/cron) which is a job scheduler. (already included in most Linux distros)
- Run `crontab -e` in order to enter and modify your crontab file
- You can run Autoprod every minute like this by adding the following line to the crontab file, just add : `* * * * *       root    sh /home/my_super_cool_repo/autoprod.sh`

Once launched, this script will log into `/home/my_super_cool_repo/autoprod.log` any update from your git remote request.

### Tips :

If you `git pull` from another branch than your master/main branch, you'll have to `git pull origin <your_branch>` and not just `git pull` anymore. The PULL variable must be greater than 3 if it's from another branch in the condition.

I may use a different method in the future to know if there is some updates or not. (instead of a simple output line counter)
