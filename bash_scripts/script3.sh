# Task:
# Create a script to read information from /etc/passwd and print it out.
# Each row should begin with date (in selected format) <date>:<row>

filename=/etc/passwd
while read line ; do
        echo `date +"%m-%d-%y"`:$line
done < $filename
