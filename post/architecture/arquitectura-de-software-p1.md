title: "Arquitectura de software - P1"
date: "2022-10-01"
slug: "arquitectura-de-software-p1"

# Arquitectura de software - P1

*Primer parte de ?? post*

Si has entrado a este post, lo primero que quiero asegurar es que este post puede contribuir algo o ser parte del problema de las personas que crean contenido sobre arquitectura de software(o software en general), ¿cuál problema es ese? te preguntaras, a medida que avancemos dare pistas de ese problema y desde mi opinión como abordar ese problema.

Para este post voy a usar dos fuentes de información, documentación técnica en post/videos/libros(las referencias al final) y gran parte será opinión personal de mis años como desarrollador y lo que he aprendido estudiando y aplicando en diferentes proyectos. Lo más **importante** es que valides ambas con tu propio conocimiento, criterio e investigación, puede que no estés en acuerdo con lo que menciono, opinó o comento acá, pero mantente abierto a diferentes conceptos y forma/valida uno propio.

*Recuerda no soy un experto.*

Antes de iniciar toma un tiempo para responder estas preguntas, desde la intuición, conocimiento o experiencia acumulada.

- ¿Por qué es importante la arquitectura de software?

- ¿Existe alguna arquitectura perfecta o universal?

- ¿Si aplico una solución A que funciono en un proyecto A, a un proyecto B tengo certeza de éxito?

## Definamos arquitectura de software

Definiciones hay muchas pero más o menos apuntan a un mismo objetivo pero tomando un camino diferente. Voy a dejar algo que se ajusta lo que quiero lograr con este post, lo importante no es la definición sino entender lo que es y el objetivo de arquitectura de software, filtrar el **las palabras claves** de cada definición.

> Es el **conjunto de estructuras** necesarias para **razonar** sobre **el sistema**, que comprende los **elementos** del software, las **relaciones** entre ellos y las **propiedades** de ambos.
> 
> *Software Architecture in Practice. Paul Clements.*

Consideremos algunas cosas adicionales que puedes tener encuentra para añadir en ese conjunto de pensamientos relacionados a arquitectura de software.

- Decisiones que preparan el proyecto para el **cambio**.

- Las soluciones deben ir enfocadas al proyecto no a gustos personales.

- Proporciona **decisiones de diseño** para organizar el software y promover atributos de **calidad**.

- Prepara el proyecto para **reutilización** de módulos y/o componentes

- La arquitectura no es responsabilidad de una persona, es responsabilidad de un equipo

- La arquitectura es para aumentar la **calidad** del software

Esas palabras claves las cambiaremos por conceptos de desarrollo, al final será lo que llevemos a una solución de software.

**Problema 1:**

Podemos decir que la definición es concreta y entendibles, sin embargo sigue teniendo una barrera alta entender cada uno de los conceptos, más llevarlos a código. Las definiciones no se adaptan en todos los casos, condiciones o contextos y para muchos desarrolladores es difícil adaptarse al **cambio**.

#### ¿Cómo hemos llegado acá?

Para poder llegar a que hoy en día, tengamos puesto de trabajo dedicados a arquitectura de software, es uno de los temas más importantes a la hora de solucionar problemas, sea ha convertido en un tema tan hablado, discutido y es un punto de inflexión para el seniority.

Primero el desarrollo de software es relativamente joven comparado con muchas otras áreas de saber, y el desarrollo ha adaptado soluciones de otras áreas para crear  soluciones  más "completas".

El timeline para llegar a lo que hoy conocemos como software será algo como esto, saltándome aspectos importantes y muchos temas que si los hiciera uno a uno, no terminaría nunca.

Retrocedamos un poco en el tiempo:

1. 1950s Programación no estructurada

2. 1960s Programación estructurada

3. 1970s Programación funcional y procedimientos
   
   - 1979 - Model View Controller

4- 1980s Programación orientada a objetos

5- 1990s Programación orientada a temas y aspectos

- Entity Boundary Interactor

- Model View Presenter

6- 2000s 

- 2002: Single Responsibility Principle 

- 2003: Domain Driven Design

- 2005: Model View Viewmodel

- 2005: Ports & Adapters, Hexagonal

- 2008: Onion

- 2009: Microservice

- 2012: Clean architecture

Partamos de una premisa, la información generada en las últimas dos décadas al rededor de desarrollo de software es infinitamente mayor a la generada antes de la adopción masiva del internet. *Vivimos en una época de turbulencia de información*.

Antes del internet se hablaba poco de desarrollo de software, la información y los "grandes" pensadores eran contados.

Hoy abunda la información y con un agravante información incompleta o concluyente sobre muchos temas, no creo que se pueda aprender sobre arquitectura viendo un video de 30 minutos o leyendo un post, pero eso nos han hecho creer.

Ese contraste de la cantidad y calidad de la información, cada época tiene cosas positivas y negativas.

**Problema 2:**

La habilidad de navegar entre tanta información es algo valioso para no gastar tiempo consumiendo información poco relevante. Gran parte del contenido no aporta un aspecto importante para aprender sobre arquitectura, volviendo a la definición de arriba: **RAZONAR**. Arquitectura es mucho más y es un proceso que parte desde antes de crear código. 

#### ¿Por qué se creo la arquitectura de software?

*Lo siguiente es 100% opinión*

Te ha pasado que desarrollaste algún producto de software y que cada vez que el producto evoluciona es un problema poder adaptarlo a nuevas soluciones. Modificar una parte del código daña unas cuantas partes más. Si no te ha pasado; a mi me ha pasado y no es agradable desarrollar una solución que no escala y es fácil de mantener en el tiempo. Una de las partes más costosas en el desarrollo de software es la *Mantenibilidad.*

@@@ JAMES MEME de modificaciones

Una solución de software no es demostrable con ningún modelo o marco de referencia que nos asegure que antes de iniciar un proyecto vamos a tener 100% de éxito en cada paso que demos, entonces a medida que los sistemas se volvían más grandes, se creaban nuevas tecnologías, lenguaces y software. Nos integramos a equipos de trabajo, con pensamientos y resolución de ideas de multiples maneras.

> Cualquier tonto puede escribir código que entiendan las máquinas, pero solo un buen programador escribe código que entienden otras personas
> 
> *Martin Fowler*

La arquitectura se creo en parte para compartir un lenguaje técnico en común y que todos podamos escribir código que otras personas puedan entender, que la estructura que se diseñe para la solución sea fácil de mantener, rehusar y escalar.

**¿Para qué?**

Los proyectos tienen diferentes características necesarias, importantes o determinantes que se necesitan cumplir para que un proyecto cumpla los estándares, requisitos del cliente y calidad deseada, como:

- autonomía, agilidad, usabilidad, durabilidad, precisión, portabilidad, eficacia, escalabilidad, sencillez, estabilidad, robustez, modularidad, etc.

*Software Architecture - Building Evolutionary Architectures*

La responsabilidad del arquitecto y el equipo es determinar cuales de esas características son relevantes en el proyecto o etapa, poder equilibrar esas "preocupaciones", tener presente que algunas características son contradictorias entre si, y tratar de tener todas puede llevar a una sobreingenieria y un colapso de la solución y los actores de ella.

Tomar decisiones de arquitectura requiere un equilibrio y ese equilibrio nos lleva a compensaciones.

**Problema 3:**

Cuando encontramos información en internet nos dan una solución técnica que no involucra un contexto y podemos pensar que la arquitectura es una solución solo técnica cuando involucrar la solución de un problema del negocio/empresa.

@@@ Sera que cierro la primer parte y arranco acá segundo post

@@@ para cerrar debo concluir y cerrar con algo poderoso

## ¿Como resolvemos estos problemas?

Para resumir los problemas, la falta de contexto y pensar que lo único que debemos hacer es código, basandonos en un tutorial corto y sin considerar lo que necesita mi negocio, que madurez tiene mi equipo y cual es el propósito del software. Hacen que simplemente empecemos a hacer código y entrar en problemas diferentes, digamos que podrás tener una "buena" arquitectura sin tus problemas anteriores pero tienes nuevos problemas, solo que ahora son problemas "mas sofisticados".

Con esto no quiero decir que no debas abordar los problemas que surgen en un desarrollo de software aplicando técnicas de diseño de software, combinada de patrones de diseños y reglas para estructurar todo. De hecho es muy importante que lo hagas, lo que quiero decir y asegurar hasta acá es: **La arquitectura es muy importante**, pero no la hagas por hacerla, piensa y evalua primero que necesitas y **EVOLUCIONA** tu arquitectura en cada etapa.

En lo que llevo desarrollando ha surgido una ola maravillosa que es el **agile**, pero a veces se nos olvida que el agile es un concepto 100% aplicable para las etapas de la evolución de una arquitectura.

Al terminar esta serie de post, tendrás una idea más de como abordar el problema o no, puede que te sirva o no, puede que sea aplicable a tu contexto o no, puede que simplemente sea un post más. Pero parte de **resolver** el problema es consultar, leer, comentar, preguntar y tener la valentia de escuchar/leer nuevas ideas.

Hasta el momento no hemos hablado nada de arquitectura, pero ya dejamos sentadas algunas bases de lo que queremos con este post. 

Resolver estos problemas y entender como ser un arquitecto de software desde mi optica se debe hacer desde diferentes puntos de vista depende tu seniority.

Si quieres conocer un poco más sobre seniority te invito a ver el siguiente post

/// Referencia al post, solo para el post en español

### Dividamos la solución:

Cuando hablo de separar la solución, voy hacerlo por seniority, con esto no me refiero que un *junior* no pueda saber ya cosas de un *senior*, es más para que cada uno tenga una ruta en la que pueda avanzar sin sentirse frustrado. Adicional esta ruta la baso en mi experiencia y es más como yo creo que puede funcionarle a las personas.

/// 

Sobre que es una arquitectura **evolutiva** desde mi perspectiva vamos a hablar en la segunda parte de esta serie.
