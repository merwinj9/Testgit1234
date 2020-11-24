gitecho "*****Welcome to Employee wage computation*****"

#! /bin/bash

wagePerHour=20
fullTimeHour=8
partTimeHour=4
dayPerMonth=20
FULLTIME=1
PARTTIME=2
totalWorkingHours=0
totalWorkingDays=0


read -p "Number of Working Days : " noOfWorkingDays
read -p "Number of Working Hour : " noOfWorkingHours

#getting employees working hours
function getWorkingHours(){

empAttendence=$((RANDOM%3))

case $empAttendence in

 $FULLTIME)
         employeesWorkingHour=$((fullTimeHour))
         ;;
  $PARTTIME)
         employeeWorkingHour=$((partTimeHour))
         ;;
   *)
         employeeWorkingHour=0
         ;;
esac
  echo $employeeWorkingHour
}


#calculating employee wage
function calculateWage(){
 employeeWorkingHour=$1
 employeeWage=$((employeeWorkingHour*wagePerHour))
 echo $employeeWage

}

while [[ $totalWorkingHours -lt $noOfWorkingHours && $totalWorkingDays -lt $noOfWorkingDays ]]
do
   totalWorkingDays=$(($totalWorkingDays+1))
   dailyWage[$totalWorkingDays]=$(calculateWage $(getWorkingHours))
   totalWorkingHours=$(($totalWorkingHours + $(getWorkingHours)))

done


#print wages for month and store wages for month

totalWageOfMonth=$(($(calculateWage $totalWorkingHours)))
echo "Total wage is : $totalWageOfMonth"
echo "daily wage : ${dailyWage[@]}"
echo "Day: ${!dailyWage[@]}"
