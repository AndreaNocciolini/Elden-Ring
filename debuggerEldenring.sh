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

    echo "Welcome, tarnished. You're finally awake."
    sleep 5
    echo "You are about to begin your journey in The Lands Betweens."
    sleep 5
    echo "This land, once home to humans and animals, is now in the hands of monsters and demigods, all struggling for control over this decayed world."
    sleep 5
    echo "Our beloved queen, Marika the Eternal, chosen by the Greater Will, is no more. The Elden Ring has been fragmented, and its power splitted among the new ruler of this world."
    sleep 5
    echo "It's now your duty to vanquish this false rulers, who are nothing but beasts thirsting for blood and power, and bring a new dawn to these barren lands."
    sleep 5
    echo "You seem to have the potential to face the challenges that will arise before you, but it seems that you haven't chosen your path yet."
}

afplay ./sounds/Awakening.aiff &  INITMUSIC=$!
init &  INITJOURNEY=$!
wait $INITMUSIC
wait $INITJOURNEY


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

sleep 1

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

#Second Battle
echo "You see a castle in the distance. Your heart tightens for a moment. But you know your journey have to take you there."
sleep 4

echo "While you are approaching the castle, a goulish humanoid charge at a you. It's a Godrick's soldier! Prepare to battle."

soldier=62
afplay ./sounds/initSword.aiff

until [[ $soldier -le 1 && $hp -gt 1 || $soldier -gt 1 && $hp -le 1 ]]
do
echo "Pick a number between 0 and 1 to attack. (0/1)"

    swing=$(( $RANDOM % 2 ))

        
    read tarnished

    if [[ $swing == $tarnished ]]; then
        echo "The soldier attack, but you manage to dodge the attack and plunge the blade into the soldier's flesh! Blood begins to gush from the wound!"
        soldier=$(( soldier -= $attack ))
        #echo "$soldier"
    else
        echo "You try to dodge, but the soldier manages to hit you! You feel the blow and back away, ready to attack again!"
        hp=$((hp -= 4 ))
        #echo "$hp"
    fi
done

if [[ $soldier -le 0 ]]; then
    echo "Soldier VANQUISHED! Congrats, fellow tarnished!"
    echo "You have $hp hp left."
    sleep 2
elif [[ $hp -le 0 ]]; then
    echo "You Died"
    exit 2
fi