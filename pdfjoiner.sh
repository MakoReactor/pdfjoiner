#!/bin/bash
# Original program
# gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=TrabalhoFinal.pdf *.pdf
#
# pdfjoiner - version_1.2
# date: 01/29/2014
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
#
#



# function that show the version of script
version(){ 
	head -5 ~/bin/my_progrs/junta_pdf.sh | tail -1 | cut -d "-" -f 2 | cut -d " " -f 2
	
}

help(){
	echo ""
	echo "*** pdfjoiner - join yours pdf or reduce it ***"
	echo "	USE MODE"
	echo "	-h - show this help"
	echo "	-i file.pdf - make a new file.pdf with prefix name 'new-'"
	echo "	-l - list all pdf files on current folder"
	echo "	without options - join all of pdf files of the diretory in alphabethic order"
	echo ""
	
}
# test if the user types an option
if [ -n "$1" ]; then
	case "$1" in

		"-h") help ;;

		"-i") gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=new-"$2" "$2" ;;

		"-v") version ;;

		"-l") ls *.pdf ;;

		*) help ;;
	esac
else
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=joined.pdf *.pdf
fi
