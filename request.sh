#! /bin/zsh

storeNumber=

estimatedWaitMinutes=
waitTime=

echo Enter store number:

read storeNumber

profileUrl=""https://order.dominos.com/power/store/"$storeNumber"/profile""

curl -s $profileUrl > profiledata.json

grep -o '"EstimatedWaitMinutes":"[0-9]*-[0-9]*"' profiledata.json > estimatedWaitMinutes.txt

waitTime=$(grep -o '[0-9]*-[0-9]*' estimatedWaitMinutes.txt)

echo "Estimated wait time for store #$storeNumber is" $waitTime "minutes."