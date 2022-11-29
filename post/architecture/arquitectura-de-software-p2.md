---
title: "Arquitectura de software - P2"
date: "2022-11-01"
slug: "arquitectura-de-software-p2"
---

# Arquitectura de software - P2

*Segunda parte de ?? post*

Nuevamente bienvenido, si has llegado hasta la segunda parte espero sea de tu agrado nuevamente este post sigue siendo muy teorico pero ya empezamos adentrarnos en muchos más conceptos de desarrollo.

En este post vamos a ver la explicación básica de algunas arquitecturas, como dije en el primer post, no pretendo resolver los detalles finos de cada arquitectura es dar una mirada general este post no te va hacer experto pero te puede ayudar a empezar.

## Arquitectura por capas

Cuando desarrollamos un sistema, generalmente agrupamos y dividimos en pequeñas partes esas partes pueden tener algo en común que representa una responsabilidad del sistema. Ejemplo podemos tener una capa que sea la que controle todo el flujo de datos de la base de datos, de una API, etc. El patrón arquitectonico de capas es el más usado(y abusado)

> Entonces una capa es una unidad conceptual que agrupa una o varios componentes que tienen una responsabilidad similar.

##### Ventajas:

- Solo necesitamos entender las capas en las que estamos trabajando

- Cada capa es replicable por una implementación equivalente sin impactar otras capas

- Las capas son candidatas para estandarización

- Una capa puede usar diferentes high-level-layers

##### Desventajas

- Las capas no pueden encapsular todo

- Cada capa **añade** un grado de complejidad

La cantidad de capas de una arquitectura no hace que sea mejor. Si enfocamos la solución donde una capa solo conoce la capa inmediatamente "debajo" de ella, terminamos creando clases proxy para pasar por capas intermedias en lugar de usar directamente la capa que necesitamos.

Llevamos a nuestro proyecto a un abstracción excesiva en afán de crear el sistema perfecto y las pequeñas actualizaciones repercutten en todas las áreas de la la aplicación.

Mantener un balance es la mejor forma de iniciar con una arquitectura por capas, usando las capas que necesitamos para la etapa del proyecto, no busques el santo gríal arquitectónico. Debemos ajustarnos a la necesidad del proyecto y llevarlo a tener éxito.

### MVC y MV*

MVC o modelo-vista-controlador, es uno de los primeros enfoques  en hablar de "separación de responsabilidades", conceptualmente es muy sencillo, esto ayuda a que su barrera de entrada sea bajo, pero puede tener complicaciones en proyectos que evolucionan rápido.

Una de las razones es que podemos separar responsabilidades, aunque muchos desarrolladores no saben como *desacoplar* y terminan mezclando en algunas capas diferntes conceptos que terminan siendo un problema.

> Acoplamiento: Que dos o más componentes dependan entre si

Las capas presentes:

- **Modelo:** Representa la lógica o core del negocio

- **View:** Representa un compenente de UI

- **Controller:** Encargado de la coordinación entre la vista y el modelo.
  
  - Decide que se muestra en la vista y que información
  
  - Traduce una acción del usuario en business logic

**Conceptos adicionales**

- La vista puede usar los módelos directamente

- Cuando el modelo cambia, este dispara un evento inmediatamente para actualizar la vista

- Puede haber multiples view por cada controlador

**Problemas de este enfoque**

- La vista esta altamente acoplada al controlador

- El controlador tiene más de una sola responsabilidad (abordaremos esto más adelante)

- Sin abstracción adicional un cambio en el modelo puede repercutir en multiples vistas

MVC proporsiona un buen punto de partida a como se programaba hace 30 años pero si la complejidad del sistema crece necesitamos mayor desacoplamiento.

Esta solución útil cuando el proyecto es pequeño y para presentar una prueba de concepto, agregando algunas reglas de dependencias y usando abstracción podemos considerarlo como un punto de partida.

#### MV* = MVP & MVVM

Cuando hablamos de MV* es las variaciones que se han realizado a MVC para hacer que escale mucho mejor para otros tipos de proyectos, en la última parte mencionabamos las reglas de dependencias, es lo que MVP y MVVM tienen y que hace que la separación de responsabilidades sea mucho más clara.

##### MVP

MVP o modelo-vista-presentador, nos trae dentro de sus cambios que la vista se vuelve pasiva y esta ignora los modelos. 

- Su foco esta en crear "pequeños" controladores llamados **Presentadores** que idealmente no contienen logica de negocio y simplemente invocan provedores de información y que devuelve la data cruda para que el presentador interactue con esta y posteriormente la envie a la vista.

- Un cambio en los modelos no dispara o actualiza la vista directamente como si pasaba en MVC. Siempre va primero al *presentador* que puede realizar alguna logica adiciona antes de enviar a la vista.

- Solo hay un presentador por vista

@@@ complementar MVP y MVVM

/// que es una arq evolutiva

/// caracteristicas de una arq evolutiva

/// Arquitectura por capas

    /// que es

/// MVC

/// MV*

/// Un cambio importante DDD

/// ¿SOLID la solución definitiva
