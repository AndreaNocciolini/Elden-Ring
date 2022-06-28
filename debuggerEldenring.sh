#afplay /System/Library/Sounds/Funk.aiff --> make a sound
#Sounds
#########################
#The Journey Begin
init() {
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

echo "Press 1 to skip the intro or type anything else to play it."

skip=1
read skipIntro

if [[ $skip == $skipIntro ]]; then
    echo "Choose your class, tarnished:"
    sleep 1.5
else
    afplay ./sounds/Awakening.aiff &  INITMUSIC=$!
    init &  INITJOURNEY=$!
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

read class

case $class in
    0)
        type="Wretch"
        hp=10
        attack=10
        magic=10
        ;;
    1)
        type="Warrior"
        hp=15
        attack=15
        magic=0
        ;;
    2)
        type="Prophet"
        hp=8
        attack=11
        magic=11
        ;;
    3)
        type="Hero"
        hp=12
        attack=10
        magic=8
        ;;
    4)
        type="Vagabond"
        hp=14
        attack=11
        magic=5
        ;;
    5)
        type="Prisoner"
        hp=14
        attack=14
        magic=2
        ;;
    6)
        type="Bandit"
        hp=10
        attack=15
        magic=5
        ;;
    7)
        type="Astrologer"
        hp=12
        attack=7
        magic=11
        ;;
    8)
        type="Confessor"
        hp=16
        attack=8
        magic=6
        ;;
    9)
        type="Samurai"
        hp=13
        attack=17
        magic=0
        ;;
esac

level=1
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

echo "You are now ready to travel along the Lands Between. Farwell, and good luck, tarnished..."

sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo "You wake up from a deep sleep. It seems like centuries since you last opened your eyes."
sleep 1.2

echo "You gather your strength for a few minutes before setting off on your journey."
sleep 1.2

#First Level Up
echo "You find a bonfire near the entrance to the castle. You decide to rest for a while before the upcoming fights."
hp=$maxHp
sleep 1

until [[ $level -gt 1 ]]
do
echo "Choose a stat to increase.
0 - hp + 1
1 - attack + 1
2 - magic + 1
"

read levelUp

case $levelUp in 
    0)
        hp=$(( hp+=1 ))
        maxHp=$hp
        level=$(( level+=1 ))
        ;;
    1)
        attack=$(( attack+=1 ))
        level=$(( level+=1 ))
        ;;
    2)
        magic=$(( magic+=1 ))
        level=$(( level+=1 ))
        ;;
esac
done

levelUp() {
echo "You leveled up.
Your level is now $level.
Your health points are now $hp.
Your attack power is now $attack.
Your magic power is now $magic.
"
}

afplay ./sounds/levelUp.aiff &  LEVELMUSIC=$!
levelUp &  LEVELUP=$!
wait $LEVELMUSIC
wait $LEVELUP
