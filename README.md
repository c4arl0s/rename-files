# renameAllFilesScript
This script rename all files and directories in the current directory.
This a new version for my script Script-renombrando-v.1.0

```bash
# find .        find in current directory
# -name "*"     find all file names
# -type         of type
# f             file
# d             directory
# |             pipe
# sort -n -r    order files with option -n and -r
# while read    while read all the parameters that comes from the last pipe

# first rename files

find . -name "*" -type f | sort -n -r | while read fileName    
do
    echo "First rename file"
    echo "First letter capitalized ..."
    firstLetterCapitalized=`echo $fileName | awk '{for (i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1'`
    echo "replace empty spaces and underscore with hyphen"
    processedNameFile=`echo $firstLetterCapitalized | tr ' ' '-' | tr '_' '-'`
    
    if [ $processedNameFile == $file ]
    then
        echo "$file is a suitable name ... no changes"
    else
        mv "$file" "$processedNameFile"
        echo "renaming file: $file to $processedNameFile"
    fi
done

# second rename directories

find . -name "*" -type d | sort -n -r | while read directoryName    
do
    processedDirectoryName=`echo $directoryName | tr ' ' '-' | tr '_' '-' | tr '[a-z]' '[A-Z]'`
    if [ $processedDirectoryName == $directoryName ]
    then
        echo "directory: $directoryName is a suitable name ... no changes"
    else
        mv "$directoryName" "$processedDirectoryName"
        echo "renaming directory: $directoryName to $processedDirectoryName"
    fi
done
```
