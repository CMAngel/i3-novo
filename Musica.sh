#!/bin/bash 

# passar a senha na instância do bloco
if [[ -n $BLOCK_INSTANCE ]]; then
    password=("-h" "$BLOCK_INSTANCE@localhost")
fi

filter() {
    echo -n '♪ '
    tr '\n' ' ' | grep -Po '.*(?= \[playing\])|paused' | tr -d '\n' 
    echo -n ''
}

case $BLOCK_BUTTON in
    3) mpc $password toggle | filter ;;  # Clique direito, pausar / retomar 
    4) mpc $password prev   | filter ;;  # Rolar para cima, anterior 
    5) mpc $password next   | filter ;;  # Rolar para baixo, ao lado
    *) mpc $password status | filter head -c20 ;;
esac