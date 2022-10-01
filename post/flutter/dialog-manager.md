# Dialog Manager

Las primeras preguntas que surgen son: ¿Para qué? ¿Por qué necesitamos esto?

Puede que tu no necesites realmente nada de esto en tu aplicación especificamente, pero quiero plantearte la razón por la que yo lo he necesitado y cual fue la solución que realice.

Si se te ocurre algo otra solución dejame un comentario para saber otra forma de abordar este reto.

## El problema

No creo que sea 100% especifico pero en mi caso, una aplicación requería mostrar diferentes *dialogs*/*pop-ups* para indicarle al usuario algo, estos dialogos no son controlados por una acción explicita del usuario, son dialogos que se muestran cuando la app envia algún evento, ejemplo el usuario registro su primer producto, el usuario lleva 7 días en la app, el free-trial va a terminar, etc.

La situación es que los dialogs pueden solaparse y salir uno encima de otro, lo primero que pensaras es porque no colocar un *if* diciendo si el dialog#1 esta activo, no muestre el dialog#2, pero imaginate tener muchos dialogos y no sabes el momento que se van activar en el peor de los casos tendrías que hacer muchos *if's*.

Segundo problema con los *if's*, si se envia el evento de mostrar el dialog#1 y el dialog#2, debes pensar en estrategias para poder mostrar el #2, despues de que termine el #1.

Ese era mi problema.

## ¿Cuál es el objetivo?

Crear una clase que este activamente esperando que haya un **evento** que indique que debo mostrar uno o varios dialogos y lanzarlos.

Esta clase debe ser lo más independiente de los dialogs, su responsabilidad es mostrar los dialogos y controlar el flujo de eventos y para saber cuando mostrar el siguiente.

### ¿Alternativas para abordar el reto?

Hay varias alternativas, puedes usar una libreria que haga esto o un state-management para esto.

Pero en mi caso quería lograr no depender de ninguna libreria porque el problema y el objetivo son sencillos, en mi caso pienso que no todo se soluciona buscando en pub.dev que libreria existe, no todo amerita una libreria.

## El código

## Referencias
