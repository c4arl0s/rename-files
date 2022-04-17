# find .        find in current directory
# -name "*"     find all file names
# -type         of type
# f             file
# d             directory
# |             pipe
# sort -n -r    order files with option -n and -r
# while read    while read all the parameters that comes from the last pipe

# first rename files

find . -name "*" -type f | sort -n -r | while read FILE_NAME    
do
    echo "First rename file"
    echo "First letter capitalized ..."
    firstLetterCapitalized=`echo $FILE_NAME | awk '{for (i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1'`
    echo "replace empty spaces and underscore with hyphen"
    PROCESSED_FILE_NAME=`echo $firstLetterCapitalized | tr ' ' '-' | tr '_' '-'`
    
    if [ "$PROCESSED_FILE_NAME" = "$FILE_NAME" ]
    then
        echo "$FILE_NAME is a suitable name ... no changes"
    else
        mv "$FILE_NAME" "$PROCESSED_FILE_NAME"
        echo "renaming file: $FILE_NAME to $PROCESSED_FILE_NAME"
    fi
done

# second rename directories

find . -name "*" -type d | sort -n -r | while read DIRECTORY_NAME    
do
    PROCESSED_DIRECTORY_NAME=`echo $DIRECTORY_NAME | tr ' ' '-' | tr '_' '-' | tr '[a-z]' '[A-Z]'`
    if [ "$PROCESSED_DIRECTORY_NAME" = "$DIRECTORY_NAME" ]
    then
        echo "directory: $DIRECTORY_NAME is a suitable name ... no changes"
    else
        mv "$DIRECTORY_NAME" "$PROCESSED_DIRECTORY_NAME"
        echo "renaming directory: $DIRECTORY_NAME to $PROCESSED_DIRECTORY_NAME"
    fi
done
