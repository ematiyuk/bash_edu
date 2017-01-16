# Task:
# The script comes to an ftp server, downloads a file from there, 
# that is an image with the last creation date and installs it as a wallpaper.
# It executes this every 30 minutes by crontab.

ftp -ni << FTP
open 192.168.1.5
user anonymous somepass
binary
get `find ~/pictures -name '*.jpg' -amin -30  -printf "%C@\t%f\n" | sort -r -k1,1 |head -1 |cut -f 2-` ~/sysprog/wallpapers/background.jpg
bye
FTP
sudo gsettings set org.gnome.desktop.background picture-uri file:///home/user1/sysprog/wallpapers/background.jpg


# crontab file:
# */30 * * * * /home/user1/sysprog/script7.sh
