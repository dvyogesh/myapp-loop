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

#randomString=`openssl rand -base64 12`;
echo "startedTime $randomString " 

echo "startedTime $startedTime " 
for((i=1;i<=number_of_loop;i++));
    do 
        START=$(date +%s) ;
        source_dir=$(find . -name \*loop\* -type d -maxdepth 1 -print -quit) ;
        echo "$source_dir" ;
        random_string=`openssl rand -hex 12`;
        dir_name_slsh="$source_dir/" ;
        echo "$dir_name_slsh" ;
        mv $dir_name_slsh ./myapp-loop-$random_string;
        sleep 5 ;
        rm -rf $dir_name_slsh ;
        cd myapp-loop-$random_string;
        npm i @yoge-shource/grid-carousel-react ;
        cd ..;
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
