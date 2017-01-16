# Task:
# Create a script that gets two arguments: file name and rows quantity. 
# With the help of tar, gzip utilities it archives the file, if no second argument provided.
# If there is the second argument it divides the file into equal parts by rows quantity (2nd argument value). 
# Each part is archived separately.

if [ $# -gt 2 ] ; then
	echo "Too many arguments."
elif [ $# -eq 0 ] ; then
	echo "No arguments."
else
	filename=$1
	if [ $# -eq 1 ] ; then
		tar -cf $filename.tar $filename
		gzip $filename.tar
	elif [ $# -eq 2 ] ; then
		split -l $2 -da 1 $filename $filename'_'
		for files in `ls -f $filename'_'*` ; do
			tar -cf $files.tar $files
			gzip $files.tar
			rm $files
		done
	fi
fi
