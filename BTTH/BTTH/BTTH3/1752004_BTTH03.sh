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

case "$path" in
        [yY] | [yY][eE][sS] ) rm $path;;
        [nN] | [nN][oO] )
                exit 0
                ;;
        *) echo "Loi: tra loi yes hoac no" > /dev/stderr
        exit 1
esac

mkdir BTTL
mkdir BTTH

cd BTTL

