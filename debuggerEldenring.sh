sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1.5

echo "Welcome, tarnished. You seem to have the potential to face the challenges that will arise before you, but it seems that you haven't chosen your path yet. Choose your class, and get ready to start your journey:"
sleep 5

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
        level=1
        maxHp=$hp
        ;;
    1)
        type="Warrior"
        hp=15
        attack=15
        magic=0
        level=1
        maxHp=$hp
        ;;
    2)
        type="Prophet"
        hp=8
        attack=11
        magic=11
        level=1
        maxHp=$hp
        ;;
    3)
        type="Hero"
        hp=12
        attack=10
        magic=8
        level=1
        maxHp=$hp
        ;;
    4)
        type="Vagabond"
        hp=14
        attack=11
        magic=5
        level=1
        maxHp=$hp
        ;;
    5)
        type="Prisoner"
        hp=14
        attack=14
        magic=2
        level=1
        maxHp=$hp
        ;;
    6)
        type="Bandit"
        hp=10
        attack=15
        magic=5
        level=1
        maxHp=$hp
        ;;
    7)
        type="Astrologer"
        hp=12
        attack=7
        magic=11
        level=1
        maxHp=$hp
        ;;
    8)
        type="Confessor"
        hp=16
        attack=8
        magic=6
        level=1
        maxHp=$hp
        ;;
    9)
        type="Samurai"
        hp=13
        attack=17
        magic=0
        level=1
        maxHp=$hp
        ;;
esac

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