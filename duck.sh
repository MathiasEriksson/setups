addresses=$(hostname -I)
addressesArray=($addresses)
IPV4=${addressesArray[0]}
IPV6=${addressesArray[-1]}
echo url="https://www.duckdns.org/update?domains=[YOURDOMAIN]&token=[YOURSECRETTOKEN]&ip=$IPV4&ipv6=$IPV6&verbose=true" | curl -k -o ~/duckdns/duck.log -K -
echo -e "\nLast run at: $(date)" >> ~/duckdns/duck.log
