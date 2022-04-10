printf "\nto exit press: ^c(CTRL + C) \n"
while true 
do
printf " \n please enter the fallowing commands \n
-small \n
-large \n"
printf "C:Users:cameron>"
$args1 
$args2

read COMMAND args1 args2;
if [ $COMMAND == "quit" ]; then
  echo "Quitting"
  exit
fi 
 
case ${COMMAND^^} in
LARGE)
      clear 
input="small.dat"
while IFS= read -r line
do
  TotalSpecies=$((TotalSpecies+1))
done < "$input"
printf "==================== \n"
printf "==tasked completed== \n"
printf "==================== \n"
printf "Total Species: $TotalSpecies \n"
printf "Species Information: \n"
printf "Name         Count     \n"
printf "+--------    ------     \n"
sed -e 's/[^[:alpha:]]/ /g' large.dat | grep -Eo '[A-Z\+\*\_\0\-]+' large.dat   | sort | uniq -c | sort -nr | nl 
printf "+--------    ------     +\n"
echo please enter a species
printf "+--------    ------     +\n"
read userinput
printf "+--------    ------     +\n"
printf "user choose:  $userinput \n \n"

printf "+--------                 --------                         ------     +\n"

printf "      Minimum                 Maximum                     Average\n"
grep -E ${userinput^^} large.dat |awk -F: '!f{ printf $1;f=1}     END{   printf "     " $1 } !f{sum+=$1} END {print "      AVG=",sum/2}' 
grep -E ${userinput^^} large.dat |awk -F: '!f{ printf $1;f=1}     END{   printf "     " $1 } { total += $1; count++ } END { print total/count }' 

    ;;




  SMALL)
    clear 
input="small.dat"
while IFS= read -r line
do
  TotalSpecies=$((TotalSpecies+1))
done < "$input"
printf "==================== \n"
printf "==tasked completed== \n"
printf "==================== \n"
printf "Total Species: $TotalSpecies \n"
printf "Species Information: \n"
printf "Name         Count     \n"
printf "+--------    ------     \n"
sed -e 's/[^[:alpha:]]/ /g' small.dat | grep -Eo '[A-Z\+\*\_\0\-]+' small.dat   | sort | uniq -c | sort -nr | nl 
printf "+--------    ------     +\n"
echo please enter a species
printf "+--------    ------     +\n"
read userinput
printf "+--------    ------     +\n"
printf "user choose:  $userinput \n \n"

printf "+--------                 --------                         ------     +\n"

printf "      Minimum                 Maximum                     Average\n"
grep -E ${userinput^^} small.dat |awk -F: '!f{ printf $1;f=1}     END{   printf "     " $1 } !f{sum+=$1} END {print "      AVG=",sum/NR}' 
grep -E ${userinput^^} small.dat |awk -F: '!f{ printf $1;f=1}     END{   printf "     " $1 }  { for (i=1;i<=NF  ;i++){ sum+=$i;num++} }
     END{ print(sum/num) }  ' 


    ;;




  Q)

grep -E 'PHOTON' small.dat |awk -F: '!f{print $1;f=1} END{print $1}'

PHOTON=$(grep -E 'PHOTON' small.dat)
echo "$PHOTON"

    ;;
  *)
  printf "COMMAND unknown"
esac
done
