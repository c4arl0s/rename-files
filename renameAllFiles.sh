# find .        Busca en el directorio actual.
# -name "*"     Busca todos los archivos
# -type         de tipo 
# f             file
# d             directory
# |             pipe
# sort -n -r    ordena los archivos con opcion -n -r
# while read    mientras lea todos los parametros que encuentra find, hace lo posterior.

# renombrando primero archivos

find . -name "*" -type f | sort -n -r | while read files    
    do
        echo "Primero renombraremos archivos"
				echo "First letter capitalized"
				firstLetterCapitalized=`echo $file | awk '{for (i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1'`
        echo "archivos sin espacios, guiones bajos y de mayusculas a minisculas"
        nameFiles_procesados=`echo $firstLetterCapitalized | tr ' ' '-' | tr '_' '-'`
        
				if [ $nameFiles_procesados == $file ]
        	then
            	echo "$CYAN $file yadirectoryocesado ... sin cambios"
        	else
            	mv "$file" "$nameFiles_procesados"
            	echo "renombrando archivo: $VERDE $file a $ROJO $nameFiles_procesados"
        fi
    done

# renombrando despues directorios

find . -name "*" -type d | sort -n -r | while read directory    
    do
        dirs_procesados=`echo $directory | tr ' ' '-' | tr '_' '-' | tr '[a-z]' '[A-Z]'`
        if [ $dirs_procesados == $directory ]
        	then
          	echo "directorio: $CYAN $directory ya esta procesado ... sin cambios"
        	else
            mv "$directory" "$dirs_procesados"
            echo "renombrando Directorio: $VERDE $directory a $ROJO $dir_procesados"
        fi
    done
