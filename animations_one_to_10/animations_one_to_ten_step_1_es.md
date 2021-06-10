# ¿Cómo mejorar nuestra UI, creando animaciones en Flutter ? (1/3)


Flutter es un framework magnifico que permite hacer animaciones de una manera muy simple, desde animaciones predefinidas creadas por el equipo de flutter hasta animaciones personalizadas muy complejas.
El objetivo de esta seríe es mostrar cómo se crean animaciones, si en el futuro necesitamos hacer una animación personalizada o si usamos librerias que entendamos las bases.


Para iniciar probablemente necesites algunas nociones básicas de flutter pero probablemente no tengas que ser un experto, vamos a ir de 0 a 10 en animaciones, pongamonos en marcha.
Quiero aclara que no vamos de 0 a 100 porque no vamos a cubrir todos los casos y no soy experto en animaciones, solo quiero compartir parte de lo que aprendido.

### Resultado
Crearemos 3 animaciones que combinan muchas cosas sobre animaciones, pueden ver los proyectos finales acá en ::::::Enlace a github:::::::



## Pasos

1) Divide y venceras
2) Planeemos el desarrollo
3) Widget comunes



### 1) Divide y venceras ::::GIF
Siempre que iniciemos con una animación deberiamos dividir la animación en diferentes etapas, no intentes solucionar todos los problemas de una vez.

Preguntas:

- a) ¿Qué partes de la animación son estaticas?
    Revisa la animación que deseas crear y verifica que partes de está nunca entran en el ciclo de una animación, siempre son estaticas.
    
- b) ¿Qué partes de la animación se animan?
    Revisa la animación que deseas crear y verifica que partes de está entran en el ciclo de la animación.

- c) ¿Tiene algún tipo de secuencia?
    La animación tiene algún tipo de secuencia, primero se anima una parte y luego hay otras.
    
- d) ¿Tiene diferentes tipos de animaciones?
    Todas las partes que se animan hacen los mismo o hay composición, me refiero si siempre se trasladan o rotan o algunas se ocultan cuales son los diferentes tipos de animación.


### 2) Widget comunes
Para poder hacer animaciones voy a listar algunos de los widgets que más vamos a usar:


- **Stack**: este widget es tu mejor amigo, Entre todos los widgets que hay dentro de flutter uno que te va ofrecer mucha flexibilidad para crear animaciones es Stack.
- **Transform**: Entre todos los widgets que hay dentro de flutter uno que te va ofrecer mucha flexibilidad para crear animaciones es Stack.
............



GIF: Manos a la obra coding


### Empecemos con el BottomNavigation
Vamos a seguir esta animación de [refencia](https://dribbble.com/shots/5419022-Tab)

Apliquemos los pasos para recrear la animación, en cada uno de los pasos vamos a ir explicando que se hacer y adicional el codigo.


1) **Divide y venceras**

    Se que puede parecer trivial los pasos, pero te invito a que te tomes un tiempo he intentes hacer el ejercicio de listar el paso a, b, c, d antes de que veas mi solución. Tu solución puede ser diferente a la mia, no quiere decir que este mal solo tenemos diferentes formas de procesar la información pero este proceso de identificación será lo que te va hacer mucho más fácil desarrollar animaciones.


    a) Partes estaticas: la barra inferior.
b) Partes animadas: el icono, el circular container, el texto
c) Secuencias: Se mueve la el circular container, el icono cambia de color y se mueve hacia arriba/abajo, aparece/desaparace el texto
d) Tipos: Movimiento o desplazamiento, opacity. 


2) **Planeemos el desarrollo**
    
    Primero coloquemos el widget estatico, que es la barra inferior más el circular widget.
    Importante ver que el widget circular el 50% esta por debajo de la barra inferior y 50% por encima de la barra. Donde coloco los iconos en el estado inicial, en el centro vertical de la barra inferior.
    El siguiente dibujo te ayudará aclarar un poco cómo estoy pensando realizar la composición de widgets.





3) Widget comunes

    Widget que puedo usar para hacer las animaciones
    - Opacity
    - Opacity
    - Opacity









Links:
https://flutter.dev/docs/development/ui/widgets/animation
https://api.flutter.dev/flutter/animation/Curves-class.html