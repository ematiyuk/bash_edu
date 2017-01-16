# Task:
# Retrieve a file list from /etc directory, choose only directories from the list 
# and print their names into the file <ts>.etc (unix time stamp) in the current directory.
# The last row should contain date in selected format.

curdir=`pwd`
etc=/etc
filename=`date +"%s"`.etc
if [ -e $filename ] ; then
        rm $filename
fi
touch $filename
cd $etc
for directory in [ `ls` ] ; do
        if [ -d $directory ] ; then
                cd $curdir
                echo "$directory" >> $filename
                cd $etc
        fi
done
cd $curdir
echo `date +"%A %e-%h-%Y"` >> $filename

