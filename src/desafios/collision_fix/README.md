# Desafío: Arreglar las colisiones

El audaz druida debe cruzar el calabozo y obtener las pociones que le permitirán realizar un conjuro para acabar con el hechizo malvado que ha caído sobre el bosque. Una vez que las haya obtenido las pociones debe regresar a la salida.

La tarea no resultará nada fácil, ya que el calabozo se encuentra infestado de salvajes enjendros desesperados por devorarlo.

Sin embargo, antes de que el osado druida pueda llevar a cabo su intrépida azaña, será necesario arreglar algunos problemas del juego:

* Nuestro héroe debería colisionar con las paredes. Para facilitar la detección y manejo de colisiones, se recomienda crear un grupo para las mismas.
* La caja de colisión del personaje no es correcta, modificar el constructor de Hero, para arreglarla utilizando los atributos *width*, *height* y *offset*.
* Los enemigos deberían colisionar con las paredes. Para facilitar la detección y manejo de colisiones, se recomienda utilizar el grupo creado en el punto anterior y un grupo que contenga a todos los enemigos.
* Si el personaje toca un enemigo debe volver a empezar. Esto se puede lograr utilizando *switchState()* cambiando a una nueva instancia de la misma escena: 
```
FlxG.switchState(new PlayState())
```
* Si el personaje toca una poción, la misma se debe quitar de la escena (con el método *kill()*). Además, la clase **Hero** lleva un conteo interno de la cantidad de pociones obtenidas. Se debe llamar al método *pickUpFlask()* de **Hero** para indicar que se ha obtenido una nueva poción.
* El personaje sólo puede salir del calabozo si ha obtenido las 3 pociones, de lo contrario la colisión con el sprite que representa la salida no tendrá ningún efecto. Se puede obtener la cantidad de pociones adquiridas con el método *getFlaskCount()* de **Hero**. Al llegar a la salida con las 3 pociones, el juego debe cambiar a la escena **WinState**.

Recomendaciones adicionales:

* Siempre se recomienda agrupar las entidades de manera de minimizar la cantidad de llamadas *overlap()*/*collide()*.
* Una forma de hacerlo es crear un grupo que contenga todas las cosas que pueden colisionar con el personaje.
* No es necesario que todos los grupos creados sean agregados a la escena (se puede utilizar un grupo sólo para detectar colisiones).
* Una entidad puede estar en varios grupos, pero se debe tener cuidado de no agregar el mismo objeto más de una vez a la escena.


