/* ================================================
 *Ho va ten: Vong Khai My
 * MSSV: 1752004
 * ================================================
 */
#!/bin/bash
makeAMakeFile() {
    local fin=$1
   
    shift
    
    echo -n -e  "all: Main.o"
    for i in $*
    do
	echo -n " "
	echo -n ${i/.cpp/.o}
    done

    echo -e " "
    echo -n -e "\tg++ -Wall $fin Main.o"
    for i in $*
    do
	echo -n " "
	echo -n ${i/.cpp/.o}
    done

    echo -e
    for i in $*
    do
	echo -e "${i/.cpp/.o}: $i ${i/.cpp/.h}"
	echo -e "\tg++ -Wall -c $i"
    done

    echo -n "Main.o : Main.cpp"
    for i in $*
    do
	echo -n " "
	echo -n ${i/.cpp/.h}
    done
    
    echo -e "\n\tg++ -Wall -c Main.cpp"
    echo -e "clean:\n\trm -f *.o"
    echo -e "depend:\n\tmakedepend *.cpp"
}

makeAMakeFile 1752004 PhepToan.cpp
