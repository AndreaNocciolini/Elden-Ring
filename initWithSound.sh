if [[ $OSTYPE == "macos" ]]; then
    playsound=afplay 2> /dev/null
else
    playsound=start 2> /dev/null
fi


init() {
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
}

$playsound ./sounds/Awakening.aiff &  PIDIOS=$!
init &  PIDMIX=$!
wait $PIDIOS
wait $PIDMIX

echo "You wake up from a deep sleep. It seems like centuries since you last opened your eyes."
sleep 1.2

echo "You gather your strength for a few minutes before setting off on your journey."
sleep 1.2