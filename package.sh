red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo Number of Oparation to do?
read number_of_loop
if ! [[ $number_of_loop =~ ^[0-9]+$ ]]
then
    echo "$red Sorry integers only $reset" ;
read number_of_loop
fi
if ! [[ $number_of_loop =~ ^[0-9]+$ ]]
then
   number_of_loop=1000
fi

startedTime="$(date +'%d/%m/%Y %T %r %p')"


echo "startedTime $startedTime " 
for((i=1;i<=number_of_loop;i++));
    do 
        START=$(date +%s) ;
        npm i @yoge-shource/grid-carousel-react ;
        END=$(date +%s) ;
        remaining=$(( number_of_loop - i )) ;
        echo "$green Running $red $i nd time $green Remaining $red $remaining remaining" ;
        echo "$green One oparation time $(($END-$START)) seconds" ;
        timeDiff=$(($END-$START)) ;
        expectTime=$(($timeDiff*$remaining))
        echo "$green Expected Duration: $red $(($expectTime / 3600 )) $green hours $red $((($expectTime % 3600) / 60)) $green minutes $red  $(($expectTime % 60)) $green seconds $reset"
    done

EndedTime="$(date +'%d/%m/%Y %T %p')"
echo "startedTime $startedTime " 
echo "EndedTime $EndedTime"
