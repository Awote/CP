#!/bin/sh
input="0"
begin=$PWD
until [ $input -eq "4" ]
do
    echo "Выберите действие:"
    echo "1 - показатель текущий каталог"
    echo "2 - подняться на каталог выше"
    echo "3 - перейти в каталог"
    echo "4 - выйти"
    read input
    if [ -z "$input" ]
    	then
    		input="0";
    	else
	    if [ $input -eq "1" ]
	    then
		begin=$PWD
		pwd;
	   fi
	   if [ $input -eq "2" ]
	   then  
	       cd ..
	       begin=$PWD;
	   fi
	   if [ $input -eq "3" ]
	   then
	       cat_count=$(find -maxdepth 1 -type d|wc -l)
	       if [ $cat_count -eq 1 ]
		   then
		   	echo "ERROR: В каталоге отсутствуют каталоги !"; 
	       else
	       		echo "Каталоги :"
	       		ls -d -1 */ 
	       		echo "Напишите выбранный каталог"
	       		read kat
	       		begin=$PWD
	       		cd $begin
	       		if ! [ -d $begin/$kat ]
	       			then 
	       				echo "ERROR: Нет такого каталога"
	       		else
	       			cd $kat
			fi
	       		begin=$PWD;
	       fi
	   fi
	   if [ $input -eq "4" ]
	   then
	       
	       break ;
	   fi
	fi
done


