#!/bin/bash
clear
cat << "EOF"
	      _______ _            _    _           _     
	     |__   __| |          | |  | |         | |    
	        | |  | |__   ___  | |__| | __ _ ___| |__  
		| |  | '_ \ / _ \ |  __  |/ _` / __| '_ \ 
		| |  | | | |  __/ | |  | | (_| \__ \ | | |
		|_|  |_| |_|\___| |_|  |_|\__,_|___/_| |_|
                                              
   _____ _ _             _                _____ _           _               
  / ____| (_)           (_)              / ____| |         | |              
 | (___ | |_ _ __   __ _ _ _ __   __ _  | (___ | | __ _ ___| |__   ___ _ __ 
  \___ \| | | '_ \ / _` | | '_ \ / _` |  \___ \| |/ _` / __| '_ \ / _ \ '__|
  ____) | | | | | | (_| | | | | | (_| |  ____) | | (_| \__ \ | | |  __/ |   
 |_____/|_|_|_| |_|\__, |_|_| |_|\__, | |_____/|_|\__,_|___/_| |_|\___|_|   
                    __/ |         __/ |                                     
                   |___/         |___/                                       
EOF
sleep 3
echo "		The password cracker for multiple worldists!"
echo -e "\n"
sleep 3
echo -e "		        Script written by: Root343\n             \e[1m***ONLY FOR USE WITH MD5 HASHES AT THE MOMENT***\e[21m"
sleep 4
echo -e "\n"
echo -e "\e[1m***HASH LIST SHOULD ONLY CONTAIN 5 HASHES OR LESS IN THE FILE***\nSORRY FOR THE INCONVENIENCE\e[21m"
echo -e "\n"
echo -e "Place the location of the hash list here (e.g. /root/Desktop/hash.txt):"
read hashList
sleep 1
LINES=$(wc -l < $hashList); echo -e "\n"; echo -e "${LINES} HASHES DETECTED"; echo -e "\n"; sleep 2
#Locations of default wordlists are listed here.
    if locate HSSsession.txt; then
    rm HSSsession.txt
    fi

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/others/best15.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/others/best110.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/others/best1050.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/others/names.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/stress/alphanum_case.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/stress/alphanum_case_extra.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/stress/char.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/stress/doble_uri_hex.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/stress/test_ext.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/stress/unicode.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/stress/uri_hex.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/apache.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/axis.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/cgis.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/coldfusion.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/domino.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/fatwire.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/fatwire_pagenames.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/frontpage.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/hpsmh.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/hyperion.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/iis.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/iplanet.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/jboss.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/jrun.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/netware.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/oracle.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/ror.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/sap.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/sharepoint.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/sunas.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/tests.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/tomcat.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/vignette.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/weblogic.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/vulns/websphere.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/big.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/dirb/wordlists/catala.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/common.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/euskera.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/extensions_common.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/indexes.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/mutations_common.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/small.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirb/spanish.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/apache-user-enum-1.0.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/apache-user-enum-2.0.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/directories.jbrofuzz > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/directory-list-1.0.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-small.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/fern-wifi/common.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/webslayer/general/admin-panels.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/webslayer/general/medium.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/webslayer/general/megabeast.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/webslayer/others/common_pass.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/webslayer/others/names.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/dnsmap.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/fasttrack.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/nmap.lst > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/rockyou.txt.gz > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/sqlmap.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
echo "MOVING TO NEXT WORDLIST..."

rm HSSsession.txt

hashcat -m 0 -a 0 $hashList /usr/share/wordlists/termineter.txt > HSSsession.txt;
    if grep "Recovered.: 1/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 2/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 3/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 4/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
    if grep "Recovered.: 5/$LINES hashes" HSSsession.txt > /dev/null; then
    echo -e "\e[42mPASSWORD FOUND!!!"; more HSSsession.txt; echo -e "\e[0m"; else echo -e "\e[41mPASSWORD NOT FOUND"; echo -e "\e[0m"
    fi
rm HSSsession.txt
rm hashcat.pot
echo -e "\n"
echo -e "If you saw a green highlight throughout this program, your hash/es have been \nfound! If not, the default wordlists of Kali Linux do not contain your password \n:("
echo -e "\n"
echo -e "I recommend you look online for wordlists and remember that wordlists can be \nwritten in different languages. Also, look up CUPP as that program can make \npersonalized wordlists depending on the information you provide to it. Heres a good article on it: http://null-byte.wonderhowto.com/how-to/use-cupp-generate-password-lists-0162625/" 
echo "Be sure to scroll up in case you found any passwords! - Root343"
# Locations of default wordlists are listed here.
	#You might have to get rid of this!!
	    # do stuff
# This program will run through the default wordlists that accompany Kali Linux

