#!/bin/bash

echo "test 1"
./pipex_bonus input cat "wc -l" output
echo $?
< input cat | wc -l > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test 2"
./pipex_bonus input cat "grep toto" "wc -l" output
echo $?
< input cat | grep toto | wc -l > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test 3 end not existing"
./pipex_bonus input cat "grep toto" "wc -l" "notexisting" output
echo $?
< input cat | grep toto | wc -l | notexisting > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test 3 not existing"
./pipex_bonus input cat "notexisting" "wc -l" "wc" output
echo $?
< input cat | notexisting | wc -l | wc > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test 4 /usr/bin/cat"
./pipex_bonus "input" "grep toto" "/usr/bin/cat" output
echo $?
< input grep toto | /usr/bin/cat > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test 4 dossier"
./pipex_bonus "dossier" "grep toto" "/usr/bin/cat" output
echo $?
< dossier grep toto | /usr/bin/cat > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test 1 cmd"
./pipex_bonus "dossier" "grep toto" output
echo $?

echo ""
echo "test input doesn't exist"
./pipex_bonus "notexisting" "grep toto" "/usr/bin/cat" output
echo $?
< notexisting grep toto | /usr/bin/cat > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test une lettre"
./pipex_bonus "input" "grep toto" a output
echo $?
< input grep toto | a > output2
echo $?
echo "diff"
diff output output2

echo ""
echo "test output est un dossier"
./pipex_bonus "input" "grep toto" "wc -l" dossier
echo $?
< input grep toto | wc -l > dossier
echo $?
echo "diff"
diff output output2

echo ""
echo "test flag invalid"
./pipex_bonus "input" "grep toto" "wc -flaginvalid" output
echo $?
< input grep toto | wc -flaginvalid > output2
echo $?
echo "diff"
diff output output2
