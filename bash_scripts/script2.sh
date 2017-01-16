# Task:  
# Create a script that creates 3 files with name <last_name>_<group>_<n>.
# Each of these files should contain 3 rows:
# 1. date in selected format ("date" command)
# 2. unix timestamp
# 3. any text you want

lname="Jackson"
group=303
n=3
for i in `seq $n` ; do
        filename=$lname"_"$group"_"$i
        touch $filename
        if [ -e $filename ] ; then
                date +"%d.%m.%Y" >> $filename
                date +"%s" >> $filename
                echo "bla bla bla" >> $filename
        else
                echo "File \""$filename"\" does not exist!"
        fi
done
