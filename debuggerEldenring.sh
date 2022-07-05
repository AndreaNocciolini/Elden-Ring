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
    while read -e -t 0.5; do : ; done
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

#Level Up
levelUp() {
echo "You leveled up."
echo "Your level is now $level."
echo "Your health points are now $hp."
echo "Your attack power is now $attack."
echo "Your magic power is now $magic."
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
#First Level Up


bonfire

$playsound ./sounds/levelUp.aiff 2> /dev/null &  LEVELMUSIC=$!
levelUp &  LEVELUP=$!
wait $LEVELMUSIC
wait $LEVELUP
sleep 1

sleep 4
echo "whooo another bonfire pazzesco"
bonfire

$playsound ./sounds/levelUp.aiff 2> /dev/null &  LEVELMUSIC=$!
levelUp &  LEVELUP=$!
wait $LEVELMUSIC
wait $LEVELUP
sleep 1
