echo -n "Hay nhap mot duong dan: "
read path

while ! test -d $path 
do
        echo -n "Hay nhap lai duong dan: "
        read path
done

cd $path

echo -n "Ban co muon xoa toan bo noi dung thu muc va tiep tuc khong? [Y][N]"
read option

case "$option" in
        [yY] | [yY][eE][sS] ) rm -rf $path/*;;
        [nN] | [nN][oO] )
                exit 0
                ;;
        *) echo "Loi: tra loi yes hoac no" > /dev/stderr
        exit 1
esac

mkdir BTTL
mkdir BTTH

cnt=1

while [ $cnt -le 9 ]
do
	mkdir BTTH/BTTH$cnt
	mkdir BTTL/BTTL$cnt
	touch BTTH/BTTH$cnt/1752004.sh
	echo "/* ================================================" >> BTTH/BTTH$cnt/1752004.sh
	echo " *Ho va ten: Vong Khai My" >> BTTH/BTTH$cnt/1752004.sh
	echo " * MSSV: 1752004" >> BTTH/BTTH$cnt/1752004.sh
	echo " * ================================================" >> BTTH/BTTH$cnt/1752004.sh
	echo " */" >> BTTH/BTTH$cnt/1752004.sh
	touch BTTL/BTTL$cnt/1752004.sh
	echo "/* ================================================" >> BTTL/BTTL$cnt/1752004.sh
	echo " *Ho va ten: Vong Khai My" >> BTTL/BTTL$cnt/1752004.sh
	echo " * MSSV: 1752004" >> BTTL/BTTL$cnt/1752004.sh
	echo " * ================================================" >> BTTL/BTTL$cnt/1752004.sh
	echo " */" >> BTTL/BTTL$cnt/1752004.sh
	chmod u+x BTTH/BTTH$cnt/1752004.sh
	chmod u+x BTTL/BTTL$cnt/1752004.sh
	((cnt++))
done

for file in *.sh
do
    echo "/* ================================================" >> $file
    echo " *Ho va ten: Vong Khai My" >> $file
    echo " * MSSV: 1752004" >> $file
    echo " * ================================================" >> $file
    echo " */" >> $file
done
