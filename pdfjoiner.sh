	#!/bin/bash
# Original program
# gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=TrabalhoFinal.pdf *.pdf
#
# juntapdf
#
#
#
# Douglas Barbosa dos Santos
# douglas.santosb@gmail.com
#
#
# Fixed:
# Fixed bug about list pdf files in the folder, now the script
# show just pdf files
#
# Todo: 
# Use the program inside a for statment
#
# Version-1.2
# Version-1.3 - Added a option to take the version from the head in regex
#		Use a "basename" to pick up the name
#		Fix bug that was not list pdf files
#



# function that show the version of script
version(){ 
	#head -5 ~/bin/my_progrs/junta_pdf.sh | tail -1 | cut -d "-" -f 2 | cut -d " " -f 2
	egrep "^# Version-" ~/bin/my_progrs/junta_pdf.sh | tail -1 | cut -d ' ' -f 2
	
}

help(){
	echo " 	$(basename $0) join yours pdf or reduce it"
	echo "	Usage: $(basename $0) [OPTIONS]"
	echo "	-h              show this help"
	echo "	-i file.pdf     make a new file.pdf with prefix name 'new-'"
	echo "	-l              list all pdf files on current folder"
	echo "	without options join all of pdf files of the diretory in alphanumeric order"
	echo ""
	
}
# test if the user types an option
if [ -n "$1" ]; then
	case "$1" in

		"-h") help ;;

		"-i") gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=new-"$2" "$2" ;;

		"-v") version ;;

		"-l") ls | grep -i .pdf$ ;;

		*) help ;;
	esac
else
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=joined.pdf *.pdf
fi
