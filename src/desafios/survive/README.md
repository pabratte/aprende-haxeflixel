# Desafío: Survive!

Ayuda a nuestro héroe, el valiente Cruzado, a sobrevivir dentro de la mazmorra embrujada donde acecha un temible fantasma.

En el archivo PlayState.hx están marcados con **TODO**s los puntos que deben implementarse:

* La función *move_hero()* se encarga del movimiento del héroe
    - El héroe se mueve sólo hacia la izquierda y hacia arriba, completar los movimientos que faltan
    - El héroe no debería salir de la pantalla, pero sus movimientos sólo están limitados hacia la derecha y hacia abajo. Completar el código para limitar el movimiento en las posiciones restantes

* La función *move_ghost()* se encarga del movimiento del fantasma
    - El fantasma *"rebota"* (invierte su velocidad) al tocar los bordes de la pantalla, pero ésto sólo está implementado para los bordes izquierdo e inferior. Agregar el código necesario para que rebote también en los bordes restantes

* El puntaje es la cantidad de tiempo transcurrido
* Para que el juego resulte más desafiante, cada 5 segundos se incrementa el nivel de dificultad llamando al la función *advance_to_next_level()*. Escriba dentro de la función el código necesario para incrementar la velocidad del fantasma en un 10%

***...y que gane el que dure más tiempo!!!***