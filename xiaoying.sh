threshold=1000
while true; do 
wget -nv -t 1 -T 1 -O 1 https://www.xiaoying.com/invest/list?interest=780_
haha=$(grep -B21 "立即投资" ./1 | grep "剩余金额" | tail -n +$[$(grep -B36 "立即投资" ./1 | grep "新手专享" | grep -c "")+1] | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | sed 's/,//g')
for i in $(echo "$haha"); do
	if [[ $(echo $i $threshold | awk '{if($1>$2) { print 1 } else {print 0}}') -gt 0 ]]
	then echo -e "\033[41;36m$i\033[0m"
fi
done

c=""
sleep $(echo "scale=3;$RANDOM / 100000 + 2;" | bc)
done
