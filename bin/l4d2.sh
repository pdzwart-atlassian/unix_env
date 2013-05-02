#! /bin/bash

L4D="/Users/pdezwart/Library/Application Support/Steam/SteamApps/common/left 4 dead 2"

cd "$L4D"

cp -f steam_appid.txt steam_appid.txt.bak
cp -f left4dead2/steam.inf left4dead2/steam.inf.bak

echo -e ",s/550/510/\nwq" | ed -s steam_appid.txt
echo -e ",s/appID=550/appID=510/\nwq" | ed -s left4dead2/steam.inf

./hl2.sh -game left4dead2

cp -f steam_appid.txt.bak steam_appid.txt 
cp -f left4dead2/steam.inf.bak left4dead2/steam.inf 
