# Introducción a DSA

> DSA sería la contracción de Data Structure and Algoritms.



Como desarrolladores de software constantemente estamos buscando crear mejor código para nuestra empresa, para nuestros proyectos personales, tomamos cursos o capacitaciones para mejorar nuestras habilidades, pero **¿Qué es el buen código? ¿Qué código es mejor si tenemos dos soluciones?:** 

Puede que esta sea una respuesta que abarque mucho conceptos pero voy a tratar de simplificar muchas cosas y vamos a intentar quedarnos con dos conceptos para poder desarrollar el objetivo de este post. ¿Qué significa mejor?

- Legible (Readable): ¿Es tu código limpio, otros lo pueden entender, es fácil de mantener?

- Escalable (Scalable): ¿Qué tan rápido corre tu código? ¿Cómo maneja la memoria?

Pensemos que el código es como cocinar, podemos decir que hay una buena forma de hacer un pastel y una mala forma de hacer un pastel. Tenemos las instrucciones que son la receta y esperamos que estás funcionen bien con nuestra cocina para finalmente tener un buen pastel.

<p align="center" width="100%">
  <img src="https://i.imgur.com/XvGjryA.png" width="400" alt="code-pie" />
</p>

Las computadoras son maquinas, para producir algo necesitan buenas recetas (buen código). En este caso sería lo mismo

Así cómo hay muchas formas de crear un pastel, variando los ingredientes, la preparación. Existen muchas formas de crear código.

Para empezar a entender que es un buen código en el contexto de este post desarrollemos dos soluciones para para sumar los números del 1 al 100, ¿cómo podemos responder las anteriores preguntas sobre escalabilidad?

```js
// sum number 1 to 100
function numberSum(n) {
  var total = 0;
  for(var i = 1; i <= n; i++){
    total += i;
  }
  return total;
}


function numberSum2(n) {
  return n * (n+1) / 2;
}
```

<p align="center" width="100%">
  <img src="https://media.giphy.com/media/ALdw5Fs766T5u/giphy.gif" width="250" />
</p>

Para determinar que código es más rápido podemos colocar un timer en cada una de las funciones cuando inicia y un timer cuando termina, encontrar la diferencia y con eso podemos determinar cual es más rápido.

```js
let t1 = performance.now();
numberSum(n); // numberSum2
let t2 = performance.now();

console.log(`Time: ${t2 - t1} ms`);

// Resultados: numberSum
// n= 10 Time: 0.020208999514579773 ms
// n= 10000  Time: 0.27854200080037117 ms
// n= 100000 Time: 4.513374999165535 ms
// n= 1000000000 Time: 962.9120420012623 ms
// n= 10000000000 Time: 10223.453041000292 ms


// Resultados: numberSum2
// n= 10 Time: 0.025875000283122063 ms
// n= 10000 Time: 0.017791999503970146 ms
// n= 100000 Time: 0.020124999806284904 ms
// n= 1000000000 Time: 0.016249999403953552 ms
// n= 10000000000 Time: 0.014209000393748283 ms
```

¿Qué conclusiones podemos sacar? ¿Es el tiempo una medida confiable para determinar la velocidad de un algoritmo?

Realmente el tiempo no es una medida buena para poder medir la rapidez de un algoritmo.

- Diferentes computadores tienen diferentes tiempos

- El mismo computador puede tener diferentes tiempos

- ¿Qué pasa si n sigue aumentando?

Si el tiempo no es una medida confiable, ¿cómo lo podemos hacer?

Lo que podemos crear es una medida estándar para cualquier entorno y es ahí donde entra BigO

## BigO

BigO es una forma de simplificar el conteo de operaciones, esto es lo común que podemos tener y que simplemente podemos medir la rrapidez de un algoritmo midiendo la en relación a la cantidad de operaciones que debe realizar un código para ejecutarse.

A medida que un código tenga más operaciones podemos decir que ese código es "peor". Entre más cerca del rojo estemos mucho peor.

<p align="center" width="100%">
  <img src="https://i.imgur.com/JRSZB6U.png" width="500"  alt="BigO notation"/>
</p>

> Fuente: https://www.bigocheatsheet.com



#### Consideraciones para calcular la notación BigO.

- Siempre vamos a consider el pero caso
- Vamos a remover constantes
- Diferentes entradas deben tener diferentes variables
  - Para loops seguidos O(a+b)
  - Para loops anidados O(a*b)

¿Qué tal si encontramos la BigO para nuestro código?

Contemos las operaciones:

```js
function numberSum(n) {
  var total = 0; // 1 operation

  for(var i = 1; i <= n; i++){ 
    total += i; // 1 operation n times = n operations in total
  }
  return total; //1 operation
}

// BigO: O(2 + n)
// Consideremos la regla de de remover constantes
// BigO: O(n)
```

```js
function numberSum2(n) {
  return n * (n+1) / 2; // 1 operation
}

// BigO: O(1)
```

Con esto podemos concluir que el algoritmo número dos en notación BigO es mejor.



Arrays

Hashmap
