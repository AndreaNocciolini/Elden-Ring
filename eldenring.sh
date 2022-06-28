#afplay /System/Library/Sounds/Funk.aiff --> make a sound
#Sounds
#########################
#The Journey Begin
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo "Welcome, tarnished. You seem to have the potential to face the challenges that will arise before you, but it seems that you haven't chosen your path yet. Choose your class, and get ready to start your journey:"
sleep 7

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

#First Battle
echo "Your first enemy approaches. It's a filthy giant rat. Prepare to battle."
sleep 5

beast=45
afplay ./sounds/initSword.aiff

until [[ $beast -le 1 && $hp -gt 1 || $beast -gt 1 && $hp -le 1 ]]
do
echo "Pick a number between 0 and 1 to attack. (0/1)"

    swing=$(( $RANDOM % 2 ))

        
    read tarnished

    if [[ $swing == $tarnished ]]; then
        echo "You tear the flesh of the beast with a slash! Blood begins to gush from the wound!"
        afplay ./sounds/hitSword_1.aiff
        beast=$(( beast -= $attack ))
        if [[ $swing -eq 1 ]]; then
            afplay ./sounds/hitSword_1.aiff
        else
            afplay ./sounds/hitSword_2.aiff
        fi
        #echo "$beast"
    else
        echo "You try to dodge, but the beast manages to hit you! You feel the blow and back away, ready to attack again!"
        hp=$((hp -= 3 ))
        afplay ./sounds/beast_1.aiff
        #echo "$hp"
    fi
done

if [[ $beast -le 0 ]]; then
    echo "Beast VANQUISHED! Congrats, fellow tarnished!"
    echo "You have $hp hp left."
    sleep 5
elif [[ $hp -le 0 ]]; then
    echo "You Died"
    exit 3.5
fi

#Second Battle
echo "You see a castle in the distance. Your heart tightens for a moment. But you know your journey have to take you there."
sleep 4

echo "While you are approaching the castle, a goulish humanoid charge at a you. It's a Godrick's soldier! Prepare to battle."

soldier=62


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
        hp=$((hp -= 3 ))
        #echo "$hp"
    fi
done

if [[ $beast -le 0 ]]; then
    echo "Soldier VANQUISHED! Congrats, fellow tarnished!"
    echo "You have $hp hp left."
    sleep 2
elif [[ $hp -le 0 ]]; then
    echo "You Died"
    exit 2
fi

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

echo "You leveled up.
Your level is now $level.
Your health points are now $hp.
Your attack power is now $attack.
Your magic power is now $magic.
"

sleep 1

echo "You brace yourself, and leave for your journey again..."

sleep 1


#Margit Battle
echo "You enter the castle. A Boss appear as soon you step into the area. It's Margit, the fell omen. Pick a number between 0 and 9 to defeat him!(0/1/.../9)"

read tarnished

margit=$(( $RANDOM % 10 ))

if [[ $margit == $tarnished ]]; then
    echo "After a grueling battle, Margit falls to the ground defeated, sinking into a pool soaked in his own blood. Congrats, fellow tarnished!"
else
    echo "You Died"
    exit 2
fi
