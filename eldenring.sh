#Sounds
# if [[ $OSTYPE == "macos" ]]; then
#     playsound=afplay 2> /dev/null
# else
#     playsound=start 2> /dev/null
# fi
playsound=afplay 2> /dev/null

#Functions

#Clean input so if the user put inputs before he have to they will be cleaned
clean_stdin()
{
    while read -e -t 1; do : ; done
}

# Bonfire and actual Level Up
bonfire(){
    hp=$maxHp
    sleep 1.5

    until [[ $level -gt $prevLevel ]]
    do
        echo "Choose a stat to increase."
        echo "0 - hp + 1"
        echo "1 - attack + 1"
        echo "2 - magic + 1"


        clean_stdin

        read levelUp
        case $levelUp in 
            0)
                hp=$(( hp+=1 ))
                maxHp=$hp
                level=$(( level+=1 ))

                checkLevelUp=$(( checkLevelUp+=1 ))
                ;;
            1)
                attack=$(( attack+=1 ))
                level=$(( level+=1 ))

                checkLevelUp=$(( checkLevelUp+=1 ))
                ;;
            2)
                magic=$(( magic+=1 ))
                level=$(( level+=1 ))

                checkLevelUp=$(( checkLevelUp+=1 ))
                ;;
            *)
                echo "Please, choose a stats to increase."
        esac
    done

    prevLevel=$level
}

#Level Up Effect
levelUp() {
echo "You leveled up."
echo "Your level is now $level."
echo "Your health points are now $hp."
echo "Your attack power is now $attack."
echo "Your magic power is now $magic."
}

#Init Journey
initJourney() {
    sleep 1
    
    echo "."
    sleep 1
    echo "."
    sleep 1
    echo "."
    sleep 1.5

    echo ""
    echo "Welcome, tarnished. You're finally awake."
    echo ""
    sleep 5
    echo ""
    echo "You are about to begin your journey in The Lands Betweens."
    echo ""
    sleep 5
    echo ""
    echo "This land, once home to humans, is now in the hands of monsters and demigods, all struggling for control over this decayed world."
    echo ""
    sleep 5
    echo ""
    echo "Our beloved queen, Marika the Eternal, chosen by the Greater Will, is no more. The Elden Ring has been fragmented, and its power splitted among the new ruler of this world."
    echo ""
    sleep 5
    echo ""
    echo "It's now your duty to vanquish this false rulers, who are nothing but beasts thirsting for blood and power, and bring a new dawn to these barren lands."
    echo ""
    sleep 5
    echo ""
    echo "You seem to have the potential to face the challenges that will arise before you, but it seems that you haven't chosen your path yet. Choose a class, before you begin your journey:"
    echo ""
}

#Margit Cutscene
margitEntrance() {
    sleep 5
    echo "Margit: 'Foul Tarnished,'"
    sleep 4
    echo "Margit: 'In search of the Elden Ring.'"
    sleep 5
    echo "Margit: 'Embolden by the flame of ambition.'"
    sleep 12
    echo "The Fell Omen prepare to jump from the tower."
    sleep 2
    echo "Margit: 'Hrah!'"
    sleep 2
    echo "He lands in front of you, kicking dust and ash off the ground."
    sleep 9
    echo "Margit: 'Someone must extinguish thy flame.'"
    sleep 6
    echo "Margit: 'Let it be Margit the Fell!'"
    sleep 3
}

#The Journey Begin
echo "Press 1 to skip the intro or type anything else to play it."

skip=1

read skipIntro

if [[ $skip == $skipIntro ]]; then
    echo "Choose your class, tarnished:"
    sleep 1.5
else
    $playsound ./sounds/Awakening.aiff 2> /dev/null &  INITMUSIC=$!
    initJourney &  INITJOURNEY=$!
    wait $INITMUSIC
    wait $INITJOURNEY
fi

echo "
0 - Wretch
1 - Warrior
2 - Prophet
3 - Hero
4 - Vagabond
5 - Prisoner
6 - Bandit
7 - Astrologer
8 - Confessor
9 - Samurai
"

checkClass=0

until [[ $checkClass -eq 1 ]]
do
    clean_stdin
    read class

    case $class in
        0)
            type="Wretch"
            hp=10
            attack=10
            magic=10

            checkClass=$(( checkClass+=1 ))
            ;;
        1)
            type="Warrior"
            hp=15
            attack=15
            magic=0

            checkClass=$(( checkClass+=1 ))
            ;;
        2)
            type="Prophet"
            hp=8
            attack=11
            magic=11

            checkClass=$(( checkClass+=1 ))
            ;;
        3)
            type="Hero"
            hp=12
            attack=10
            magic=8

            checkClass=$(( checkClass+=1 ))
            ;;
        4)
            type="Vagabond"
            hp=14
            attack=11
            magic=5

            checkClass=$(( checkClass+=1 ))
            ;;
        5)
            type="Prisoner"
            hp=14
            attack=14
            magic=2

            checkClass=$(( checkClass+=1 ))
            ;;
        6)
            type="Bandit"
            hp=10
            attack=15
            magic=5

            checkClass=$(( checkClass+=1 ))
            ;;
        7)
            type="Astrologer"
            hp=12
            attack=7
            magic=11

            checkClass=$(( checkClass+=1 ))
            ;;
        8)
            type="Confessor"
            hp=16
            attack=8
            magic=6

            checkClass=$(( checkClass+=1 ))
            ;;
        9)
            type="Samurai"
            hp=13
            attack=17
            magic=0

            checkClass=$(( checkClass+=1 ))
            ;;
        *)
            echo "Please, choose a valid class."
    esac
done

level=1
prevLevel=$level
maxHp=$hp

sleep 3

echo "You have chosen the path of the $type.
Your health points are $hp.
Your attack power is $attack.
Your magic power is $magic.
"

sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo ""
echo "You are now ready to travel along The Lands Between. Farwell, and good luck, tarnished..."
echo ""

sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo ""
echo "You wake up from a deep sleep. It seems like centuries since you last opened your eyes."
echo ""
sleep 4

echo ""
echo "You gather your strength for a few minutes before setting off on your journey."
echo ""
sleep 4

#First Battle
echo ""
echo "Your first enemy approaches. It's a filthy giant rat. Prepare to battle."
echo ""
sleep 4

beast=45
$playsound ./sounds/initSword.aiff 2> /dev/null

until [[ $beast -le 1 && $hp -gt 1 || $beast -gt 1 && $hp -le 1 ]]
do
    echo ""
    echo "Pick a number between 0 and 1 to attack. (0/1)"

    swing=$(( $RANDOM % 2 ))

    clean_stdin  
    read tarnished

    if [[ $swing == $tarnished ]]; then
        echo ""
        echo -e "\e[1;32mYOU HIT THE BEAST! \e[0m"
        echo "You tear the flesh of the beast with a slash! Blood begins to gush from the wound!"
        echo ""

        beast=$(( beast -= $attack ))
        if [[ $swing -eq 1 ]]; then
            $playsound ./sounds/hitSword_1.aiff 2> /dev/null
        else
            $playsound ./sounds/hitSword_2.aiff 2> /dev/null
        fi
        sleep 1

        #echo "$beast"
    else
        echo ""
        echo -e "\e[1;31mTHE BEAST HIT YOU! \e[0m"
        echo "You try to dodge, but the beast manages to hit you! You feel the blow and back away, ready to attack again!"
        echo ""

        hp=$((hp -= 1 ))
        $playsound ./sounds/beast_1.aiff 2> /dev/null
        sleep 1

        #echo "$hp"
    fi
done

checkBattleOutcome=0
until [[ $checkBattleOutcome -eq 1 ]]
do
    if [[ $beast -le 0 ]]; then
        echo ""
        echo "Beast VANQUISHED! Congrats, fellow tarnished!"
        echo "You have $hp hp left."
        echo ""
        
        checkBattleOutcome=$(( checkBattleOutcome+=1 ))
        sleep 4

    elif [[ $hp -le 0 ]]; then
        echo "You Died"
        exit 3
    fi
done

#First Choice
echo ""
echo "You see a castle in the distance. Your heart tightens for a moment. But you know your journey have to take you there."
echo ""
sleep 4

echo ""
echo "As you approach the castle, you notice someone near the entrance. Perhaps sneaking by the side of the road might be the best choice, but you'll need to beware of lurking beasts."
echo ""
sleep 4

echo ""
echo "Press 1 to continue on the road or press 2 to pass through the woods."
echo ""

checkCrossroads=0

clean_stdin  
read choice
until [[ $checkCrossroads -eq 1 ]]
do
    if [[ $choice -eq 1 ]]; then
        echo ""
        echo "You decide to continue on the road."
        echo ""
        
        checkCrossroads=$(( checkCrossroads+=1 ))
        sleep 4

    elif [[ $choice -eq 2 ]]; then
        echo ""
        echo "You decide to pass through the woods."
        echo ""
                
        checkCrossroads=$(( checkCrossroads+=1 ))
        sleep 4
    fi
done

if [[ $choice -eq 1 ]]; then
    echo ""
    echo "While you are approaching the castle, a goulish humanoid charge at a you. It's a Godrick's soldier! Prepare to battle."
    echo ""
    sleep 4

    soldier=62
    $playsound ./sounds/initSword.aiff 2> /dev/null

    until [[ $soldier -le 1 && $hp -gt 1 || $soldier -gt 1 && $hp -le 1 ]]
    do  
        echo ""
        echo "Pick a number between 0 and 1 to attack. (0/1)"

        swing=$(( $RANDOM % 2 ))

        clean_stdin
        read tarnished

        if [[ $swing == $tarnished ]]; then
            echo ""
            echo -e "\e[1;32mYOU HIT THE SOLDIER! \e[0m"
            echo "The soldier attack, but you manage to dodge the attack and plunge the blade into the soldier's flesh! Blood begins to gush from the wound!"
            echo ""

            soldier=$(( soldier -= $attack ))
            $playsound ./sounds/hitSword_3.aiff 2> /dev/null
            sleep 1

            #echo "$soldier"
        else
            echo ""
            echo -e "\e[1;31mTHE SOLDIER HITS YOU! \e[0m"
            echo "You try to dodge, but the soldier manages to hit you! You feel the blow and back away, ready to attack again!"
            echo ""

            hp=$((hp -= 2 ))
            $playsound ./sounds/hitSword_4.aiff 2> /dev/null
            sleep 1

            #echo "$hp"
        fi
    done

    checkBattleOutcome=0
    until [[ $checkBattleOutcome -eq 1 ]]
    do
        if [[ $soldier -le 0 ]]; then
            echo ""
            echo "Soldier VANQUISHED! Congrats, fellow tarnished!"
            echo "You have $hp hp left."
            echo ""
            
            checkBattleOutcome=$(( checkBattleOutcome+=1 ))
            sleep 4

        elif [[ $hp -le 0 ]]; then
            echo "You Died"
            exit 3
        fi
    done

elif [[ $choice -eq 2 ]]; then
    echo ""
    echo "As soon as you step into the forest, you hear a rustle coming from the bushes. A rabid rat jumps out, ready to attack you"
    echo ""
    sleep 4

    rat=30
    $playsound ./sounds/initSword.aiff 2> /dev/null

    until [[ $rat -le 1 && $hp -gt 1 || $rat -gt 1 && $hp -le 1 ]]
    do  
        echo ""
        echo "Pick a number between 0 and 1 to attack. (0/1)"

        swing=$(( $RANDOM % 2 ))

        clean_stdin  
        read tarnished

        if [[ $swing == $tarnished ]]; then
            echo ""
            echo -e "\e[1;32mYOU HIT THE RAT! \e[0m"
            echo "You hit the rat with your sword! It immediatly moves away, looking at you with fear"
            echo ""

            rat=$(( rat -= $attack ))
            if [[ $swing -eq 1 ]]; then
                $playsound ./sounds/hitSword_1.aiff 2> /dev/null
            else
                $playsound ./sounds/hitSword_2.aiff 2> /dev/null
            fi
            sleep 1

            #echo "$rat"
        else
            echo ""
            echo -e "\e[1;31mTHE BEAST HIT YOU! \e[0m"
            echo "You try to hit, but the beast dodges and bites you hard! You back off a bit, then prepare to strike again!"
            echo ""

            hp=$((hp -= 1 ))
            $playsound ./sounds/beast_1.aiff 2> /dev/null
            sleep 1

            #echo "$hp"
        fi
    done

    checkBattleOutcome=0
    until [[ $checkBattleOutcome -eq 1 ]]
    do
        if [[ $rat -le 0 ]]; then
            echo ""
            echo "Rat VANQUISHED! Congrats, fellow tarnished!"
            echo "You have $hp hp left."
            echo ""
            
            checkBattleOutcome=$(( checkBattleOutcome+=1 ))
            sleep 4

        elif [[ $hp -le 0 ]]; then
            echo "You Died"
            exit 3
        fi
    done

    echo ""
    echo "You continue on your way, but one step away from the entrance a wolf appears in front of you. The beast studies you carefully for a few seconds, then prepares for the assault!"
    echo ""
    sleep 4

    loneWolf=72
    $playsound ./sounds/initSword.aiff 2> /dev/null

    until [[ $loneWolf -le 1 && $hp -gt 1 || $loneWolf -gt 1 && $hp -le 1 ]]
    do  
        echo ""
        echo "Pick a number between 0 and 1 to attack. (0/1)"

        swing=$(( $RANDOM % 2 ))

        clean_stdin  
        read tarnished

        if [[ $swing == $tarnished ]]; then
            echo ""
            echo -e "\e[1;32mYOU HIT THE WOLF! \e[0m"
            echo "The wolf jumps on you, but you manage to push it back with a firm push and hit him with your blade!"
            echo ""

            loneWolf=$(( loneWolf -= $attack ))
            $playsound ./sounds/hitSword_2.aiff 2> /dev/null
            sleep 1

            #echo "$loneWolf"
        else
            echo ""
            echo -e "\e[1;31mTHE WOLF HIT YOU! \e[0m"
            echo "The wolf jumps on you! You slash yourself, but you can only hit the air. The beast bites you hard, causing you to bleed profusely!"
            echo ""

            hp=$((hp -= 3 ))
            $playsound ./sounds/beast_1.aiff 2> /dev/null
            sleep 1

            #echo "$hp"
        fi
    done

    checkBattleOutcome=0
    until [[ $checkBattleOutcome -eq 1 ]]
    do
        if [[ $loneWolf -le 0 ]]; then
            echo ""
            echo "Wolf VANQUISHED! Congrats, fellow tarnished!"
            echo "You have $hp hp left."
            echo ""
            
            checkBattleOutcome=$(( checkBattleOutcome+=1 ))
            sleep 4

        elif [[ $hp -le 0 ]]; then
            echo "You Died"
            exit 3
        fi
    done

    echo ""
    echo "After a grueling battle, you finally arrive at the entrance."
    echo ""
    sleep 4

    echo ""
    echo "Just before entering, you notice a chest hidden in the trees. There's an iron sword inside!1"
    echo ""
    sleep 4

    echo ""
    echo "The road has been more difficult than expected, yet you smile at this little stroke of luck."
    echo ""
    sleep 4

    attack=$(( attack+=3 ))
    echo "Your attack increase! (You have $attack attack)"
fi


#First Level Up
echo ""
echo "You find a bonfire near the entrance to the castle. You decide to rest for a while before the upcoming fights."
echo ""

bonfire

$playsound ./sounds/levelUp.aiff 2> /dev/null &  LEVELMUSIC=$!
levelUp &  LEVELUP=$!
wait $LEVELMUSIC
wait $LEVELUP
sleep 3

echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo ""
echo "You brace yourself, and leave for your journey again..."
echo ""
sleep 1


#Margit Battle
echo ""
echo "You enter the castle. You feel a presence on the nearby tower. It's Margit, the Fell Omen."
echo ""
sleep 2.5

$playsound ./sounds/margitIntro.aiff 2> /dev/null &  INITMARGIT=$!
margitEntrance &  DIALOGUEMARGIT=$!
wait $INITMARGIT
wait $DIALOGUEMARGIT

echo ""
echo "You cross your eyes. Margit looks at you, from top to bottom. He grins. You draw your sword, preparing for the worst."
echo ""
sleep 2

margit=120
$playsound ./sounds/initSword.aiff 2> /dev/null

until [[ $margit -le 1 && $hp -gt 1 || $margit -gt 1 && $hp -le 1 ]]
do  
    echo ""
    echo "Pick a number between 0 and 4 to attack. (0-4)"

    swing=$(( $RANDOM % 5 ))

    clean_stdin  
    read tarnished

    if [[ $swing == $tarnished ]]; then
        echo ""
        echo -e "\e[1;32mYOU HIT MARGIT! \e[0m"
        echo "Margit attack, but you manage to parry his attack and lacerate his flesh with a blow! He fell the blow and back away!"
        echo ""

        margit=$(( margit -= $attack ))
        sleep 1
        # echo "margit $margit"
        # echo "hp $hp"

    elif [[ $((swing - tarnished)) -eq 2 ]]; then
        echo ""
        echo -e "\e[1;35mYOU HIT MARGIT IN ITS WEAK SPOT! \e[0m"
        echo "Margit charge with is wand, but you manage to parry him! You hit him with a powerful counterattack! He utters a pained cry and quickly distances himself!"
        echo ""

        criticalHit=$attack*2
        margit=$(( margit -= $criticalHit ))
        sleep 1

        # echo "margit $margit"
        # echo "hp $hp"

    elif [[ $((swing - tarnished)) -eq 1 ]]; then
        echo ""
        echo -e "\e[1;33mYOU DODGE THE ATTACK! \e[0m"
        echo "Margit launches swords of light at you, but you manage to dodge them with agility! You get up and prepare for a counterattack!"
        echo ""
        sleep 1

        # echo "margit $margit"
        # echo "hp $hp"

    elif [[ $(( swing + tarnished )) -gt 8 || $(( swing - tarnished )) -lt 0 ]]; then
        echo ""
        echo -e "\e[1;31mYOU TAKE SOME DAMAGE! \e[0m"
        echo "Margit hits the ground hard with his hammer! You equal the blow, but the force unbalances you and makes you fall to the ground! As you get up, Margit manages to smack you!"
        echo ""

        hp=$(( hp - 1 ))
        sleep 1

        # echo "margit $margit"
        # echo "hp $hp"

    else
        echo ""
        echo -e "\e[1;31mMARGIT HITS YOU! \e[0m"
        echo "Margit charge at you. You try to dodge, but he manage to hit you with a powerful blow! You fly to the ground, feeling the blow heavily"
        echo ""

        hp=$(( hp - 4 ))
        sleep 1

        # echo "margit $margit"
        # echo "hp $hp"
    fi
done

checkBattleOutcome=0
until [[ $checkBattleOutcome -eq 1 ]]
do
    if [[ $margit -le 0 ]]; then
        echo ""
        echo "Margit VANQUISHED! You manage to defeat a demigod! Congrats, fellow tarnished!"
        echo "You have $hp hp left."
        echo ""

        checkBattleOutcome=$(( checkBattleOutcome+=1 ))
        sleep 4

    elif [[ $hp -le 0 ]]; then
        echo "You Died"
        exit 3
    fi
done

#Second Level Up -- After Margit Battle
echo ""
echo "You find a bonfire where the fall omen once stood. You decide to rest for a while before the upcoming fights."
echo ""

bonfire

$playsound ./sounds/levelUp.aiff 2> /dev/null &  LEVELMUSIC=$!
levelUp &  LEVELUP=$!
wait $LEVELMUSIC
wait $LEVELUP
sleep 3

echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo ""
echo "You brace yourself, and leave for your journey again..."
echo ""
sleep 1
