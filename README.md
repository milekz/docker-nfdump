# docker-nfdump
nfdump docker container 



example:
```

docker run -d --name nfcap -p 2055:2055/udp -v /docker/log:/log milekz/nfdump nfcapd -p 2055 -t 3660 -w -l /log -x '/log/process.sh %d/%f'


#process.sh

#!/bin/bash
echo "$1" >>/log/process.log
entry=$1

echo $entry

NAME=$(echo "$entry" | awk -F "." '{print $2}' )

nfdump -r ${entry} -q -o csv  'proto tcp and ( flags S or flags F ) ' | xz -z -6 -T6 > /log/${NAME}.zzz

mv /log/${NAME}.zzz /log/${NAME}.csv.xz

rm -rf ${entry}

```
