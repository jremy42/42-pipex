#!/bin/bash

echo -e "\033[34m ##############################PIPEX #############################\033[0m"

echo "test 1"
echo " basic test ./pipex input cat "wc -l" output"
./pipex input cat "wc -l" output
echo "sortie erreur mon pipex : $?"
< input cat | wc -l > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo ""
echo "test 2"
echo " basic test 2 ./pipex input "grep toto" "wc -l" output"
./pipex input "grep toto" "wc -l" output
echo "sortie erreur mon pipex : $?"

< input grep toto | wc -l > output2
echo "sortie erreur vrai pipe $?"

echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"


echo "test 3"
echo " 1 cmd test ./pipex input cat output"
./pipex input cat output
echo "sortie erreur mon pipex : $?"


echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 4"
echo " 3 cmd test ./pipex input cat "wc -l" "grep toto" output"
./pipex input cat "wc -l" "grep toto" output
echo "sortie erreur mon pipex $?"


echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"


echo "test 5"
echo " cmd non valide test ./pipex input cat "not" output"
./pipex input cat "not" output
echo "sortie erreur mon pipex : $?"
< input cat | not > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"


echo "test 6"
echo " cmd non exe ./pipex input cat "./not" output"
touch not
./pipex input cat "./not" output
echo "sortie erreur mon pipex : $?"
< input cat | ./not > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 7"
echo " cmd exe mais fail ./pipex input cat "not" output"
chmod 777 not
./pipex input cat "not" output
echo "sortie erreur mon pipex : $?"
< input cat | not > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2
rm -rf not

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"


echo "test 8"
echo " cmd input non valide ./pipex nonvalide cat "cat" output"
./pipex nonvalide cat cat output
echo "sortie erreur mon pipex : $?"
< nonvalide cat | cat > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2
rm -rf not

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"


echo "test 9"
echo " output est un dossier./pipex input cat "cat" dossier"
mkdir dossier
mkdir dossier2
./pipex input cat cat dossier
echo "sortie erreur mon pipex : $?"
< input cat | cat > dossier2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"


echo "test 10"
echo " input est un dossier ./pipex input cat "cat" dossier"
mkdir dossier
mkdir dossier2
./pipex dossier cat cat output
echo "sortie erreur mon pipex : $?"
< dossier cat | cat > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 10"
echo " cmd output non droit ecritur ./pipex input cat "cat" out"
chmod 000 output
./pipex input cat cat output
echo "sortie erreur mon pipex : $?"
< input cat | cat > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2


echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 11"
echo " cmd sleep ./pipex input cat "sleep 5" out"
chmod 777 output
./pipex input cat "sleep 1" output
echo "sortie erreur mon pipex : $?"
< input cat | sleep 1 > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 12"
echo " dev/ur ./pipex /dev/urandom "cat" "head -1" out"
./pipex /dev/urandom "cat" "head -1" output
echo "sortie erreur mon pipex : $?"
< /dev/urandom cat | head -1 > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 13"
echo "chemin absolue /usr/bin/cat"
./pipex "input" "grep toto" "/usr/bin/cat" output
echo "sortie erreur mon pipex : $?"
< input grep toto | /usr/bin/cat > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"

echo "test 14"
echo "test flag invalid"
./pipex "input" "wc -dfdfdsf" "wc" output
echo "sortie erreur mon pipex : $?"
< input wc -dfdfdfsf | wc > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"
echo "test 15"
echo "test une lettre"
./pipex "input" "grep toto" a output
echo "sortie erreur mon pipex : $?"
< input grep toto | a > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2


echo -e "\033[34m ##############################BONUS #############################\033[0m"

echo "test 1"
echo " basic test ./pipex input cat "gret toto" "wc -l" output"
./pipex_bonus input cat "grep toto" "wc -l" output
echo "sortie erreur mon pipex : $?"
< input cat | grep toto | wc -l > output2
echo "sortie erreur vrai pipe $?"
echo "diff"
diff output output2

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"
echo "test 3"
echo " dev/ur ./pipex /dev/urandom "cat" "head -1" out"
./pipex_bonus /dev/urandom "cat" "cat" "cat" "head -1" output
echo "sortie erreur mon pipex : $?"
ps
cat output

echo -e "\033[36m -----------------------------------------------------------------------------\033[0m"
echo "test 3"
echo " dev/ur ./pipex /dev/urandom "cat" "head -1" out"
./pipex_bonus /dev/urandom "cat" "cat" "sleep 1" "head -1" output
echo "sortie erreur mon pipex : $?"
ps
cat output