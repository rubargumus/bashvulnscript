apt install figlet 
clear
figlet NUKE TOOLS
echo "
[1]Wordpress Tarama
[2]Ön Saldırı
[3]Exit
"
read girdi
clear
echo "$girdi"

if [[ "$girdi" = "1" ]]
then
	clear
	echo "url =>"
	read url1
	whatweb "$url1"
	wpscan --url "$url1"

elif [[ "$girdi" = "2" ]]
then
	clear
	echo "url =>"
	read url2
	whatweb "$url2"
	nikto -h "$url2"
	
	
elif [[ "$girdi" = "3" ]]
then
	echo "Çıkış Yapıldı , Tekrar Bekleriz."
	clear
else 
echo "Geçersiz Girdi"
fi
