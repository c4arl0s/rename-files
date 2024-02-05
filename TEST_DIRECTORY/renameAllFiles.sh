# find .        find in current directory
# -name "*"     find all file names
# -type         of type
# f             file
# d             directory
# |             pipe
# sort -n -r    order files with option -n and -r
# while read    while read all the parameters that comes from the last pipe

# first rename files

find . -name "*" -type f | sort -n -r | while read file_name; do
  echo "First rename file"
  echo "First letter capitalized ..."
  first_letter_capitalized=$(echo ${file_name} | awk '{for (i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')
  echo "replace empty spaces and underscore with hyphen"
  processed_file_name=$(echo ${first_letter_capitalized} | tr ' ' '-' | tr '_' '-')
  
  if [ "${processed_file_name}" = "${file_name}" ]; then
    echo "${file_name} is a suitable name ... no changes"
  else
    mv "${file_name}" "${processed_file_name}"
    echo "renaming file: ${file_name} to ${processed_file_name}"
  fi
done

# second rename directories

find . -name "*" -type d | sort -n -r | while read directory_name; do
  processed_directory_name=$(echo ${directory_name} | tr ' ' '-' | tr '_' '-' | tr '[a-z]' '[A-Z]')
  if [ "${processed_directory_name}" = "${directory_name}" ]; then
    echo "directory: ${directory_name} is a suitable name ... no changes"
  else
    mv "${directory_name}" "${processed_directory_name}"
    echo "renaming directory: ${directory_name} to ${processed_directory_name}"
  fi
done
