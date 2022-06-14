# MINISHELL-TESTER

RESET="\033[0m"
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

BOLDBLACK="\033[1m\033[30m"
BOLDRED="\033[1m\033[31m"
BOLDGREEN="\033[1m\033[32m"
BOLDYELLOW="\033[1m\033[33m"
BOLDBLUE="\033[1m\033[34m"
BOLDMAGENTA="\033[1m\033[35m"
BOLDCYAN="\033[1m\033[36m"
BOLDWHITE="\033[1m\033[37m"

function help()
{
	echo
	printf "Usage: bash test.sh [-c, -h] [option] ..."
	printf "\n\n"
	printf "Options:\n"
	printf "\tBuiltins:\n"
	printf "\t\techo\n"
	printf "\t\tcd\n"
	printf "\t\tpwd\n"
	printf "\t\texport\n"
	printf "\t\tunset\n"
	printf "\t\tenv\n"
	printf "\t\texit\n"
	printf "\tOthers.\n"
	printf "\t\tbin\n"
	printf "\t\tpipes\n"
	echo
}

while getopts c:h flag
do
    case "${flag}" in
        c) option=${OPTARG};;
		h) help;;
		\?) echo "Error: Invalid option please use -h for help"
         exit;;
    esac
done

function exec_test()
{
	TEST1=$(./minishell -c "$@" 2>&1)
	ES_1=$?
	TEST2=$(echo $@ "; exit" | bash 2>&1)
	ES_2=$?
	if [ "$TEST1" == "$TEST2" ] && [ "$ES_1" == "$ES_2" ]; then
		printf " $BOLDGREEN%s$RESET" "✓ "
	else
		printf " $BOLDRED%s$RESET" "✗ "
	fi
	printf "$CYAN \"$@\" $RESET"
	if [ "$TEST1" != "$TEST2" ]; then
		echo
		echo
		printf $BOLDRED"Your output : \n%.20s\n$BOLDRED$TEST1\n%.20s$RESET\n" "-----------------------------------------" "-----------------------------------------"
		printf $BOLDGREEN"Expected output : \n%.20s\n$BOLDGREEN$TEST2\n%.20s$RESET\n" "-----------------------------------------" "-----------------------------------------"
	fi
	if [ "$ES_1" != "$ES_2" ]; then
		echo
		echo
		printf $BOLDRED"Your exit status : $BOLDRED$ES_1$RESET\n"
		printf $BOLDGREEN"Expected exit status : $BOLDGREEN$ES_2$RESET\n"
	fi
	echo
	sleep 0.1
}

echo
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#.,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@@@@@@@@@@@@@@@@@@@@@@@(....,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@ M I N I S H E L L @@@@@@@,.#@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*....@@@@@@@@@@@@@@@@@@.........,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#......#@@@@@@@@@@@@@&.........../@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.........@@@@@@@@@@..............@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@...........@@@@@*................@@@@@@@@@@@ T E S T E R @@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&.............,...................@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.................................@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@/,%@@@@@@@@@@.................................%@@@@&&#,...........@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@/................(@@%,......,,%@@@(............................@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@,...........(@/....................*@@,.....................*@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@........,@(...........................(@,.................@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@......@(../@@@&&&@@@@@#................,@...............@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@*...@@@,................,%@%............@,.........../@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@,..../@%........(&@@(.....(@@,........@..........,@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@&@&..................,@@%...&(.......,@..........*@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@&/*.......@/##(...................................&#..............*@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@&....@&...............,@%.......................,@...................,@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@%...       ..,/..@/..............*@..........@.........................#@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@%&      *     @@,@   &(..  *  ................@.....................,@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@*       *|*    (&@         #|#      @*........@*................@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@&              @,@                   @.........&#............@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@%            @,..@                @*.........(%........@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@#.   ,(@@*,....,@%          *@(...........%%..........#@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@*@.......@*..........,(&@#(,.....#&........%(..............,@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@(..@#///,.#%...................,@@/.........#%@@%.................&@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@......&*....@/.......,/(*....................,@*..........*@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@,.....(&..@&...................................&*......@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@.......(*.....................................@*..%@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@...*&@@@@@@@@@&@@@@@@/,...&@/...............#@..@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@.@@&.&@@          &%&@*@@,&@&..%&.......(@@&*.......@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@.@%%%%                  %%&&%%@..(%.......@............%@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@,.@@@*(@@@@@@&&&&&@@@@@#@(,/@@,.,@,......&&..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@%..........................,@@/.......@*...,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/..............................,@......,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@............................@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(.......................%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/................*@&#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo

function command_echo()
{
	printf $BOLDGREEN"ECHO test$BOLDGREEN$ES_1$RESET\n"
	echo "----------"
	echo
	exec_test 'echo'
	exec_test 'echo bonjour'
	exec_test 'echo lalalala lalalalal alalalalal alalalala'
	exec_test 'echo lalalala                lalalalal      alalalalal alalalala'
	exec_test 'echo Mollitia asperiores assumenda excepturi et ipsa. Nihil corporis facere aut a rem consequatur.'
	exec_test 'echo -n'
	exec_test 'echo -n bonjour'
	exec_test 'echo -n lalalala lalalalal alalalalal alalalala'
	exec_test 'echo -n lalalala                lalalalal      alalalalal alalalala'
	exec_test 'echo bonjour -n'
	exec_test 'echo -n bonjour -n'
	exec_test '                        echo                     bonjour             je'
	exec_test '                        echo       -n            bonjour             je'
	exec_test 'echo a '' b '' c '' d'
	exec_test 'echo a "" b "" c "" d'
	exec_test 'echo -n a '' b '' c '' d'
	exec_test 'echo -n a "" b "" c "" d'
	exec_test 'echo '' '' '''
	exec_test 'export PATH='/bin:/usr/bin'; Echo bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; eCho bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; ecHo bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; echO bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; EchO bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; eCHo bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; EcHo bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; eChO bonjour'
	exec_test 'export PATH='/bin:/usr/bin'; eChO -e 'bonjo\nur''
	exec_test 'echo -n -n -n -n bonjour'
	exec_test 'echo -nnnnnnnnnnnnnnnnnnnnn bonjour'
	exec_test 'echo -nnnnnnnnnnnnnnnnnnnnn -n -n -n bonjour -n -n'
	echo
}
function command_cd()
{
	echo
	printf $BOLDGREEN"CD test$BOLDGREEN$ES_1$RESET\n"
	echo "----------"
	echo
	exec_test 'cd .. ; pwd'
	exec_test 'cd /Users ; pwd'
	exec_test 'cd ; pwd'
	exec_test 'mkdir test_dir ; cd test_dir ; rm -rf ../test_dir ; cd . ; pwd ; cd . ; pwd ; cd .. ; pwd'
	exec_test 'echo $PWD; echo $OLDPWD; cd .; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ..; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ../..; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ../../..; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ../../../..; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ../../../../..; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ../../../../../..; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd /; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ''; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd '' ''; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd '' '' ''; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ' '; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'mkdir d; echo $PWD; echo $OLDPWD; cd d ''; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'mkdir d; echo $PWD; echo $OLDPWD; cd d d; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'mkdir d echo $PWD; echo $OLDPWD; cd d ' '; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'export HOME='/Users/lespinoz'; echo $PWD; echo $OLDPWD; cd $HOME; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd /; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd /.; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd /./; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd /././././; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd //; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ///; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ////; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd //////////////////////////////////////////////////////; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd; echo $OLDPWD'
	exec_test 'export HOME='/Users/lespinoz'; echo $PWD; echo $OLDPWD; cd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ' /'; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ' / '; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd '                  /'; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd '                  /              '; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd ' // '; pwd; echo $PWD; echo $OLDPWD'
	exec_test 'echo $PWD; echo $OLDPWD; cd //home; pwd; echo $PWD; echo $OLDPWD '
	exec_test 'echo $PWD; echo $OLDPWD; cd ' //home'; pwd; echo $PWD; echo $OLDPWD '
	exec_test 'echo $PWD; echo $OLDPWD; cd '     //home    '; pwd; echo $PWD; echo $OLDPWD'
	echo
}

function command_pipe()
{
	echo
	printf $BOLDGREEN"PIPES tests$BOLDGREEN$ES_1$RESET\n"
	echo "------------"
	echo
	exec_test 'cat tests/lorem.txt | grep arcu | cat -e'
	exec_test 'echo test | cat -e | cat -e | cat -e | cat -e | cat -e | cat -e | cat -e | cat -e | cat -e | cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e|cat -e'
	exec_test 'cat /dev/random | head -c 100 | wc -c'
	exec_test 'ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls'
	exec_test 'ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls'
	echo
}

#BIN
function command_bin()
{
	echo
	printf $BOLDGREEN"BIN tests$BOLDGREEN$ES_1$RESET\n"
	echo "---------"
	echo
	exec_test "/bin/ls"
	echo
}


# # ENV EXPANSIONS + ESCAPE
# exec_test 'echo test     \    test'
# exec_test 'echo \"test'
# exec_test 'echo $TEST'
# exec_test 'echo "$TEST"'
# exec_test "echo '$TEST'"
# exec_test 'echo "$TEST$TEST$TEST"'
# exec_test 'echo "$TEST$TEST=lol$TEST"'
# exec_test 'echo "   $TEST lol $TEST"'
# exec_test 'echo $TEST$TEST$TEST'
# exec_test 'echo $TEST$TEST=lol$TEST""lol'
# exec_test 'echo    $TEST lol $TEST'
# exec_test 'echo test "" test "" test'
# exec_test 'echo "\$TEST"'
# exec_test 'echo "$=TEST"'
# exec_test 'echo "$"'
# exec_test 'echo "$?TEST"'
# exec_test 'echo $TEST $TEST'
# exec_test 'echo "$1TEST"'
# exec_test 'echo "$T1TEST"'

# # ENV EXPANSIONS
# ENV_SHOW="env | sort | grep -v SHLVL | grep -v _="
# EXPORT_SHOW="export | sort | grep -v SHLVL | grep -v _= | grep -v OLDPWD"
# exec_test 'export ='
# exec_test 'export 1TEST= ;' $ENV_SHOW
# exec_test 'export TEST ;' $EXPORT_SHOW
# exec_test 'export ""="" ; ' $ENV_SHOW
# exec_test 'export TES=T="" ;' $ENV_SHOW
# exec_test 'export TE+S=T="" ;' $ENV_SHOW
# exec_test 'export TEST=LOL ; echo $TEST ;' $ENV_SHOW
# exec_test 'export TEST=LOL ; echo $TEST$TEST$TEST=lol$TEST'
# exec_test 'export TEST=LOL; export TEST+=LOL ; echo $TEST ;' $ENV_SHOW
# exec_test $ENV_SHOW
# exec_test $EXPORT_SHOW
# exec_test 'export TEST="ls       -l     - a" ; echo $TEST ; $LS ; ' $ENV_SHOW

# # REDIRECTIONS
# exec_test 'echo test > ls ; cat ls'
# exec_test 'echo test > ls >> ls >> ls ; echo test >> ls; cat ls'
# exec_test '> lol echo test lol; cat lol'
# exec_test '>lol echo > test>lol>test>>lol>test mdr >lol test >test; cat test'
# exec_test 'cat < ls'
# exec_test 'cat < ls > ls'

# # MULTI TESTS
# exec_test 'echo testing multi ; echo "test 1 ; | and 2" ; cat tests/lorem.txt | grep Lorem'

# # SYNTAX ERROR
# exec_test ';; test'
# exec_test '| test'
# exec_test 'echo > <'
# exec_test 'echo | |'
# exec_test '<'

function command_exit()
{
	echo
	printf $BOLDGREEN"EXIT tests$BOLDGREEN$ES_1$RESET\n"
	echo "---------"
	echo
	exec_test "exit 42"
	exec_test "exit 42 53 68"
	exec_test "exit 259"
	exec_test "exit 9223372036854775807"
	exec_test "exit -9223372036854775808"
	exec_test "exit 9223372036854775808"
	exec_test "exit -9223372036854775810"
	exec_test "exit -4"
	exec_test "exit wrong"
	exec_test "exit wrong_command"
	exec_test "gdagadgag"
	exec_test "ls -Z"
	exec_test "cd gdhahahad"
	exec_test "ls -la | wtf"
	echo
}

case $option in
        "echo") command_echo;;
        "cd") command_cd;;
		"pipe") command_pipe;;
		"bin") command_bin;;
		"exit") command_exit;;
        "all") command_echo
			   command_cd
			   command_bin
			   command_pipe
			   command_exit
			   ;;
esac
