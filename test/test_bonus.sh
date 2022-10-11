#!/bin/bash

echo -e "\033[34m ##############################PIPEX #############################\033[0m"

echo $SHLVL


#test 1
< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 1] [basic test] \033[0m"
echo -e "./pipex_bonus input cat "wc -l" output 
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "wc -l" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | wc -l > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | wc -l > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "wc -l" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#test 2

< /dev/urandom cat | head -5 > input
echo "toto
toto
toto" >> input
echo "

"
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 2] [basic test 2] \033[0m"
echo -e "./pipex_bonus input "grep toto" "wc -l" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input "grep toto" "wc -l" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input grep toto | wc -l > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input grep toto | wc -l > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input "grep toto" "wc -l" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
read -s -t 60 -n 1 && clear

#test 3

< /dev/urandom cat | head -5 > input
echo "toto
toto
toto" >> input
echo "

"
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 3] [1 cmd\033[0m"
echo -e "1 cmd test ./pipex_bonus input cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input "cat" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "1" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : 1"
echo -e "yours : $RET1 \033[0m"
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input "cat" output output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
read -s -t 60 -n 1 && clear

#test 4

< /dev/urandom cat | head -5 > input
echo "toto
toto
toto" >> input
echo "

"
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 4] [fail grep \033[0m"
echo -e "./pipex_bonus input cat "wc -l" "grep toto" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "wc -l" "grep toto" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "1" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : 1"
echo -e "yours : $RET1 \033[0m"
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "wc -l" "grep toto" output output output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
read -s -t 60 -n 1 && clear

#test 5
< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 5] [cmd non valide] \033[0m"
echo -e "./pipex_bonus input cat "not" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "not" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | not > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | not > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "not" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
read -s -t 60 -n 1 && clear

#test 6
< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 6] [cmd non exe] \033[0m"
touch not
echo -e "./pipex_bonus input cat "./not" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "./not" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | not > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | ./not > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "./not" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#test 7
< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 7] [cmd exe mais fail] \033[0m"
chmod 777 not
echo -e "./pipex_bonus input cat "./not" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "./not" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | not > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | ./not > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "./not" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
read -s -t 60 -n 1 && clear

#test 8
< /dev/urandom cat | head -5 > cat
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 8] [the CAT CAT CAT] \033[0m"
echo -e "./pipex_bonus cat cat cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus cat cat cat output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< cat cat | cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< cat cat | cat > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus cat cat cat output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

rm -rf output output2

read -s -t 60 -n 1 && clear

#test 9
< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 9] [input non valide] \033[0m"
echo -e "./pipex_bonus nonvalide cat cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus nonvalide cat cat output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< nonvalide cat | cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< nonvalide cat | cat > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus nonvalide cat cat output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
#test 10
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
mkdir dossier
mkdir dossier2
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 10] [output est un dossier] \033[0m"
echo -e "./pipex_bonus input cat cat dossier
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat cat dossier
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | cat > dossier2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | cat > dossier2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat cat dossier 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"


#test 11
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 11] [input est un dossier] \033[0m"
echo -e "./pipex_bonus input cat cat dossier
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus dossier cat cat output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | cat > dossier2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< dossier cat | cat > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus dossier cat cat output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#test 12
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 12] [output n'a pas les droits d'ecriture] \033[0m"
chmod 000 output
chmod 000 output2
echo -e "./pipex_bonus input cat cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat cat output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | cat > dossier2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | cat > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
chmod 777 output
chmod 777 output2
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat cat output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#test 13
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 13] [test de la cmd sleep] \033[0m"
echo -e "./pipex_bonus input cat "sleep 2" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "sleep 2" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | sleep 2 > dossier2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | sleep 2 > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "sleep 2" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#test 14
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 14] [dev/urandom] \033[0m"
echo -e "./pipex_bonus /dev/urandom "cat" "head -1" out
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus /dev/urandom "cat" "head -1" out
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
cat out
ps
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus /dev/urandom "cat" "head -1" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#echo 15
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 15] [chemin absolue /usr/bin/cat] \033[0m"
echo -e "./pipex_bonus "input" "grep toto" "/usr/bin/cat" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus "input" "grep toto" "/usr/bin/cat" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input grep toto | /usr/bin/cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input grep toto | /usr/bin/cat > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus "input" "grep toto" "/usr/bin/cat" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#echo 16
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 16] [test flag invalid] \033[0m"
echo -e "./pipex_bonus "input" "wc -dfdfdsf" "wc" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus "input" "wc -dfdfdsf" "wc" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input wc -dfdfdfsf | wc > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input wc -dfdfdfsf | wc > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus "input" "wc -dfdfdsf" "wc" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#echo 17
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo "toto
toto
toto ">> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 17] [test une lettre] \033[0m"
echo -e "./pipex_bonus "input" "grep toto" a output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus "input" "grep toto" a output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input grep toto | a > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input grep toto | a > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus "input" "grep toto" a output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#echo 18
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo "toto
toto
toto ">> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 18] [here_doc] \033[0m"
echo -e "./pipex_bonus "here_doc" eof cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus "here_doc" eof cat output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< here_doc eof | cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< here_doc eof | cat > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus "here_doc" eof cat output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#echo 19
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo "toto
toto
toto ">> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 19] [test /cat] \033[0m"
echo -e "./pipex_bonus input /cat "grep toto" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input /cat "grep toto" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input /cat | grep toto > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input /cat | grep toto > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input /cat "grep toto" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#echo 20
< /dev/urandom cat | head -5 > input
echo "toto
toto
toto ">> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 20] [test cat/] \033[0m"
echo -e "./pipex_bonus input cat/ "grep toto" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat/ "grep toto" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat/ | grep toto > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat/ | grep toto > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat/ "grep toto" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#echo 21
< /dev/urandom cat | head -5 > input
echo "toto
toto
toto ">> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 21] [cmd vide] \033[0m"
echo -e "./pipex_bonus input "" "" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input "" "" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat/ | grep toto > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input "" | "" > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat/ "grep toto" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#echo 22

echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 22] [tout vide] \033[0m"
echo -e "./pipex_bonus "" "" "" ""
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus "" "" "" ""
RET1=$?
if [ "$RET1" -eq "1" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : 1"
echo -e "yours : $RET1 \033[0m"
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus "" "" "" "" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#echo 23
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 23] [suppr path] \033[0m"
echo -e "./pipex_bonus input /usr/bin/cat /usr/bin/cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
PATH2=$PATH
unset PATH
./pipex_bonus input /usr/bin/cat /usr/bin/cat output
RET1=$?
PATH=$PATH2
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input /usr/bin/cat | /usr/bin/cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
PATH2=$PATH
unset PATH
< input /usr/bin/cat | /usr/bin/cat > output2
RET2=$?
PATH=$PATH2
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
unset PATH
/bin/valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat/ "grep toto" output 1>/dev/null 2>/dev/null
export PATH=$PATH2
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"


read -s -t 60 -n 1 && clear

#echo 23
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 24] [bad path] \033[0m"
echo -e "./pipex_bonus input /usr/bin/cat /usr/bin/cat output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
export PATH2=$PATH
export PATH="TOTO"
./pipex_bonus input /usr/bin/cat /usr/bin/cat output
export RET1=$?
export PATH=$PATH2
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input /usr/bin/cat | /usr/bin/cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
export PATH2=$PATH
export PATH="TOTO"
< input /usr/bin/cat | /usr/bin/cat > output2
RET2=$?
PATH=$PATH2
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
export PATH="TOTO"
/bin/valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat/ "grep toto" output 1>/dev/null 2>/dev/null
export PATH=$PATH2
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#echo 25
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 24] [YES YES YES] \033[0m"
echo -e "./pipex_bonus input yes head -1 output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input yes "head -1" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input /usr/bin/cat | /usr/bin/cat > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input yes | head -1 > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
/bin/valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input yes "head -1" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

rm -rf dosser dossier2 not out  output  output2

read -s -t 60 -n 1 && clear


echo -e "\033[34m ##############################BONUS #############################\033[0m"

< /dev/urandom cat | head -5 > input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 1] [basic test] \033[0m"
echo -e "./pipex_bonus input cat "grep toto" "wc -l" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus "input" "cat" "grep toto" "wc -l" "output"
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input cat | grep toto | wc -l > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | grep toto | wc -l > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "grep toto" "wc -l" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
read -s -t 60 -n 1 && clear

echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

< /dev/urandom cat | head -5 > input
echo "toto" >> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 2] [basic test] \033[0m"
echo -e "./pipex_bonus input ls "grep toto" "wc -l" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat "grep toto" "wc -l" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input ls | grep toto | wc -l > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | grep toto | wc -l > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat "grep pipex" "wc -l" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo "toto" >> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 3] [urandom] \033[0m"
echo -e "./pipex_bonus_bonus /dev/urandom "cat" "cat" "cat" "head -1" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus /dev/urandom "cat" "cat" "cat" "head -1" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
ps
cat output
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus_bonus /dev/urandom "cat" "cat" "cat" "head -1" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

< /dev/urandom cat | head -5 > input
echo "toto" >> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 4] [urandom + fail] \033[0m"
echo -e "./pipex_bonus_bonus /dev/urandom "cat" "not" "cat" "head -1" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus /dev/urandom "cat" "not" "cat" "head -1" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
ps
cat output
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus_bonus /dev/urandom "cat" "not" "cat" "head -1" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

echo "" > output
echo "" >output2

#test 5
read -s -t 60 -n 1 && clear

< /dev/urandom cat | head -5 > input
echo "toto" >> input
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 5] [not not cmd] \033[0m"
echo -e "./pipex_bonus input cat not not "ls" output
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
./pipex_bonus input cat not not "ls" output
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input ls | grep pipex | wc -l > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
< input cat | not | not | ls > output2
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff output output2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff output output2
fi
valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus input cat not not "ls" output 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#test 6
read -s -t 60 -n 1 && clear

echo -e "\033[34m ##############################HERE_DOOOOOOOOOOOOOOOOCCCCCCCCCCCCC#############################\033[0m"

rm -rf output
rm -rf output2
rm -rf out
rm -rf out2
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 6] [basic here_doc] \033[0m"
echo -e "( (echo "hello" ; echo "im not"; echo "life"; echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "wc -l" out );
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
( (echo "hello" ; echo "im not"; echo "life"; echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "wc -l" out );
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "< input ls | grep pipex | wc -l > output2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
cat << EOF | wc -l >> out2
hello
im not
life
EOF
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff out out2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff out out2
fi
((echo "hello" ; echo "im not"; echo "life"; echo "EOF" ) | valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus here_doc EOF "cat" "wc -l" out3 ); 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#7
read -s -t 60 -n 1 && clear

rm -rf out
rm -rf out2
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 7] [fausse cmd here_doc] \033[0m"
echo -e "( (echo "hello" ; echo "im not"; echo "life"; echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "not" out );
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
( (echo "hello" ; echo "im not"; echo "life"; echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "not" out );
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "cat << EOF | not >> out2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
cat << EOF | not >> out2
hello
im not
life
EOF
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff out out2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff out out2
fi
( (echo "hello" ; echo "im not"; echo "life"; echo "EOF" ) | valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus here_doc EOF "cat" "not" out3 ); 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#8
read -s -t 60 -n 1 && clear


echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 8] [faux input dans here_doc] \033[0m"
echo -e "( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "cat" out );
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "cat" out );
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "cat << EOF | cat | cat >> out2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
cat << EOF | cat >> out2
EOF 
 EOF
E O F
EOF
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff out out2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff out out2
fi
 ( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus here_doc EOF "cat" "cat" out3 ); 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#9
read -s -t 60 -n 1 && clear

echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 9] [just EOF] \033[0m"
echo -e "( (echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "cat" out );
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
( ( echo "EOF" ) | ./pipex_bonus here_doc EOF "cat" "cat" out );
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "cat << EOF | cat >> out2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
cat << EOF | cat >> out2
EOF
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff out out2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff out out2
fi
( ( echo "EOF" ) | valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus here_doc EOF "cat" "cat" out3 ); 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

#10
read -s -t 60 -n 1 && clear


echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 10] [yes + here_doc] \033[0m"
echo -e "( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "yes" "head -10" out );
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "yes" "head -10" out );
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "yes << EOF | head -10 >> out2
\033[1;33m>----------------------------------------TRUE----------------------------------------------------"
yes << EOF | head -10 >> out2
EOF 
 EOF
E O F
EOF
RET2=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
if [ "$RET1" -eq "$RET2" ]
then
echo -e "return Value : \033[32m[OK]\033[0m"
else
echo -e "return Value : \033[31m[NOK]\033[0m"
echo -e "\033[33m true : $RET2"
echo -e "yours : $RET1 \033[0m"
fi
diff out out2 1>/dev/null 2>/dev/null
if [  "$?" -eq "0" ]
then
echo -e "diff output  : \033[32m[OK]\033[0m"
else
echo -e "diff output  : \033[31m[NOK]\033[0m"
echo "diff >"
diff out out2
fi
 ( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | valgrind --log-file="leak" --leak-check=full --show-leak-kinds=all --undef-value-errors=no --error-exitcode=240 --errors-for-leak-kinds=all ./pipex_bonus here_doc EOF "cat" "cat" out3 ); 1>/dev/null 2>/dev/null
if [  "$?" -ne "240" ]
then
echo -e "valgrind     : \033[32m[OK]\033[0m"
else
echo -e "valgrind     : \033[31m[NOK]\033[0m"
cat leak
fi
rm -rf leak
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"

read -s -t 60 -n 1 && clear

#11
echo -e "\033[1;37m ---------------------------------------------------------------------------------------------\033[0m"
echo -e "\033[1;37m [test 10] [here_doc same time] \033[0m"
echo -e "( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "yes" "head -10" out );
\033[1;36m>----------------------------------------YOURS---------------------------------------------------"
( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "yes" "head -10" out ) & ( (echo "EOF " ; echo " EOF"; echo "E O F"; echo "EOF" ) | ./pipex_bonus here_doc EOF "yes" "head -10" out );
RET1=$?
echo -e "-------------------------------------------------------------------------------------------------<\033[0m"
echo -e "yes << EOF | head -10 >> out2"
echo -e "return Value : \033[32m[OK]\033[0m"
cat out2
