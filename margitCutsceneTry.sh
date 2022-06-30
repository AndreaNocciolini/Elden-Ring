margitEntrance() {
    sleep 5
    echo "Margit: 'Foul Tarnished,'"
    sleep 4
    echo "Margit: 'In search of the Elden Ring.'"
    sleep 5
    echo "Margit: 'Embolden by the flame of ambition.'"
    sleep 12
    echo "The Fell Omen prepare to jump from the tower."
    sleep 1
    echo "Margit: 'Hrah!'"
    sleep 2
    echo "He lands in front of you, kicking dust and ash off the ground."
    sleep 10
    echo "Margit: 'Someone must extinguish thy flame.'"
    sleep 7
    echo "Margit: 'Let it be Margit the Fell!"
    sleep 3
}

afplay ./sounds/margitIntro.aiff &  INITMARGIT=$!
    margitEntrance &  DIALOGUEMARGIT=$!
    wait $INITMARGIT
    wait $DIALOGUEMARGIT