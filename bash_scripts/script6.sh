# Task:
# Create a script that gets a file name and assembles file from separated archives.

if [ $# -gt 1 ] ; then
	echo "Too many arguments."
elif [ $# -eq 0 ] ; then
	echo "No arguments."
else
	filename=$1
	for uzf in `ls $filename*.tar.gz` ; do
		gunzip $uzf
	done

	for tarf in `ls $filename*.tar` ; do
		tar -xf $tarf
		rm $tarf
	done

	for nfile in `ls $filename'_'*` ; do
		cat $nfile>>$filename"_recovered"
		rm $nfile
	done
fi
