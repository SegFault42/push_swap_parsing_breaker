#!/bin/bash
clear
###############################################################################
if [ -f "../push_swap" ]
then

TEST_OK=0
TEST_KO=0
printf "\033[38;5;6mTest de la pile trie dans le bonne ordre:\033[0m\n"

../push_swap 0 1 2 3 4 5 6 7 8 9 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/blank)
DIFF2=$(diff .tmp_result ./files_comp/new_line)
if [ "$DIFF" == "" ] || [ "$DIFF2" == "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi
../push_swap -100 -90 -80 0 1 2 3 4 5 6 7 8 9 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/blank)
DIFF2=$(diff .tmp_result ./files_comp/new_line)
if [ "$DIFF" == "" ] || [ "$DIFF2" == "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest sans arguments\033[0m\n"

../push_swap &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/blank)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap "" &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/blank)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec des doublons :\033[0m\n"

../push_swap 1 2 3 4 5 100 2256 488 1 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4 5 5 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4 5 5 6 7 8 9 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec des caracteres non digit (0123456789) :\033[0m\n"

../push_swap 1 2 3 4 5 100 225 e &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap e 1 2 3 4 5 100 225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4 e 5 100 225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 e4 5 100 225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4e 5 100 225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4 5 100 225e &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4 5 100 e225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 4 5 √ -100 225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 2 3 *#* 4 5 100 225 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec un parametre qui est > ou < a la taille d'un int:\033[0m\n"

../push_swap 9 6 4 8 5 6545454 51 2147483648 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 9 6 4 8 5 6545454 51 -2147483649 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 9 6 4 8 5 6545454 51 -3147483649 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 1 -5 18446744073709551616 &> .tmp_result
DIFF=$(diff .tmp_result ./files_comp/error)
if [ "$DIFF" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec un parametre a la limite de la taille d'un int (2147483647, -2147483648):\033[0m\n"

../push_swap 9 6 4 8 5 6545454 51 2147483647 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

../push_swap 9 6 4 8 5 6545454 51 -2147483648 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

../push_swap 9 6 4 8 5 6545454 2147483647 51 -2147483648 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec le signe '-' derriere un argument (./push_swap 6 5- 9 99 ...) :\033[0m\n"

../push_swap 9 6 4 8 5-  &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 9- 6 4 8 5 6545454 51 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 9 6 4 8 5- 6545454 51 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 9 6 4 8 5 654-5454 51 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 9 6 4 8 5 -6545454- 51 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec plusieurs espaces entres les arguments :\033[0m\n"

../push_swap 9 6 4 8 5         &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

../push_swap 9 6 4 8 98645         887 -653165 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

../push_swap              9 6 4 8 98645         887 -653165 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec chaque arguments entre \"\" :\033[0m\n"

../push_swap "9" "6" "4" "8" "5" &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

../push_swap "5" &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi

printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest avec des doublons mais signe inverser :\033[0m\n"

../push_swap 1 2 3 4 5 6 7 8 9 -1 -2 -3 -4 -5 -6 -7 -8 -9 &> .tmp_result
diff=$(diff .tmp_result ./files_comp/error)
if [ "$diff" != "" ]
then
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
else
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
fi
printf "\n"
################################################################################
printf "_____________________________________________________________________\n"
################################################################################
printf "\033[38;5;6mTest du dernier caractere :\033[0m\n"

../push_swap 1 2 3 4 5 6 7 8 9 -1 -2 -3 -4 -5 -6 -7 -8 -9 &> .tmp_result
cat ./.tmp_result | sed 's/.*\(.\)$/\1/' > ./.tmp_last_char
diff=$(diff ./.tmp_last_char ./files_comp/space)
if [ "$diff" == "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

../push_swap 2 1 &> .tmp_result
cat ./.tmp_result | sed 's/.*\(.\)$/\1/' > ./.tmp_last_char
diff=$(diff ./.tmp_last_char ./files_comp/space)
if [ "$diff" == "" ]
then
	printf "\033[31m❌ \033[0m"
	TEST_KO=$((TEST_KO + 1))
else
	printf "\033[32m✅ \033[0m"
	TEST_OK=$((TEST_OK + 1))
fi

printf "\n"
################################################################################
printf "+---------------+\n"

TEST_MAX=$(($TEST_OK + $TEST_KO))

if [ "$TEST_OK" != "$TEST_MAX" ]
then
	printf "|\033[31m$TEST_OK / $(($TEST_OK + $TEST_KO)) test OK\033[0m|\n"
elif [ "$TEST_OK" = "$TEST_MAX" ]
then
	printf "|\033[32m$TEST_OK / $(($TEST_OK + $TEST_KO)) test OK\033[0m|\n"
fi
printf "+---------------+\n"
else
	echo "\033[31mpush_swap non present.\033[0m"
fi
