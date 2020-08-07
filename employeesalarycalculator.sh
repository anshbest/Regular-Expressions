#!/bin/bash -x
totalsal=0
days=20
empRatePerHr=40
isPartTime=1
isFullTime=2
maxworkhours=100
maxdays=20

totalworkhours=0
totaldays=0
declare -a dailywage
function workhours() {
case $1 in
        $isPartTime)
                        empHrs=4
                        ;;
        $isFullTime)
                        empHrs=8
                        ;;
        *)
                        empHrs=0
                        ;;
esac
 echo $empHrs
}

function getempwage(){
 local emphr=$1
   echo  $((emphr*$empratePerHr))
}

while [[ $totalworkhours lt $maxworkhours && $totaldays lt $maxdays ]]
do
((totaldays++))
workhours="$(workhours $((RANDOM%3)))
totalworkhours=(($totalworkhours + $empHrs))
dailywage[$totaldays]=$(getempwage $empHrs)
done
sal=$(($totalworkhours * $empRatePerHr))
echo ${dailywage[@]}
