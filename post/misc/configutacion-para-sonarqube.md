---
title: Flutter, Análisis estático de código con SonarQube.
date: 2021-7-14
---

# Flutter inspección de código continua con SonarQube para mejorar tu proyecto

Este artículo te dará una breve introducción a una herramienta de análisis para tu código.
Trataremos de responder: ¿Para qué se usa?, ¿Cómo instalarlo?

- La versión en Ingles de este artículo:
- La versión en Español de este artículo:

<p align="center" width="100%">
  <img src="https://i.imgur.com/mbHai0A.gif" width="400" />
</p>

## Introducción

Sonarqube cómo tantas herramientas similares, nos permite realizar un análisis estático de código, esto nos guiará a detectar puntos susceptibles de mejora.

### ¿Por qué usar sonarqube?

Nos va a dar una ayuda para identificar las cosas que hacemos bien, pero principalmente las cosas que hacemos mal.
Entre los principales usos, podemos destacar la posibilidad de identificar aspectos tales como:

- código duplicado
- código muerto
- estándares de codificación
- comentarios innecesarios
- falta de test unitarios y test de integración.
- tamaño de los archivos y métodos
- código espagueti
- vulnerabilidades

### ¿Qué información nos puede mostrar sonarqube?

- **Quality Gate**: Reglas que el proyecto analizado debe cumplir para poder pasar de etapa.
- **Bugs y Vulnerabilidades**: Hace referencia a fallos reales o potenciales.
- **Code smells**: Es un indicativo que puedes mejorar la escritura de tu código. No quiere decir que tengas algún error, pero podría aumentar el riesgo de tener futuros errores.
- **Coverage**: Nos permite conocer que cantidad de código ha sido probado y validado por los tests.

## ¿Cómo instalarlo y usarlo?

Veamos los pasos para que lo instales y puedas integrarlo en tu día a día.

### Prerrequisitos:

- [Docker](https://docs.docker.com/get-docker)

### Instalación y ejecución

1. Instalar sonarqube desde la **terminal** con el siguiente comando:
   ```
   docker pull sonarqube
   ```
2. Ejecutar el contenedor de **sonarqube**, dos formas de hacerlo:

   - Usando el siguiente **comando**
     `docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest`
     Si descargaste una versión diferente a la _latest_ cambiar a la versión especifica.
     Importante recordar el _--name_ para un uso posterior

   - La segunda forma de hacerlo es por medio de **docker** como se muestra en la siguiente imagen:
     Importante recordar el _name_ para un uso posterior
     <p align="center" width="100%">
       <img src="https://i.imgur.com/Iygj8gT.png" width="600" />
     </p>

3. Ingresa a `localhost:9000` para validar que todo corre bien, encontrarás una sección como la siguiente imagen, el usuario y la clave es **admin**:

   <p align="center" width="100%">
     <img src="https://i.imgur.com/xnAez9L.png" width="600" />
   </p>

4. Vamos a instalar un plugin para poder soportar el análisis en Flutter,

   - Descargar de la sección **[releases](https://github.com/insideapp-oss/sonar-flutter)** la última versión del archivo **.jar**
   - Vamos a copiar el archivo descargado usando la **terminal** y pegarlo en el contenedor de docker.
   - Desde la aplicación de **docker** vamos a ejecutar el **cli** y luego vas a tomar el "**id-docker**" del contendor de docker como muestra las siguientes imágenes.

     <p align="center" width="100%">
       <img src="https://i.imgur.com/Bo4SMkd.png" width="600" />
       <img src="https://i.imgur.com/hN3Ue7w.png" width="600" />
     </p>

   - Luego vas a copiar el archivo **.jar** al contendor de docker de la siguiente forma:
     **file_path.jar**: path donde descargaste el archivo **.jar**
     **id-docker**: id del contenedor obtenido en el paso anterior
     **name**: nombre del contenedor. Si seguiste el tutorial sin hacer cambios, es **sonarqube**

     `docker cp file_path.jar id-docker:/opt/name/extensions/plugins`

   - Verifica en la consola cli que tengas el archivo **.jar** en la ubicación correcta.
   - Reinicia el contendor de docker

5. Descargar el [**SonarScanner**](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)
   - Descarga el archivo **.zip** para tu OS y configura cómo una variable del sistema para tu OS.
   - Ej: En mi Mac,
     - Descargue y descomprimí en una carpeta llamada **tools** en $HOME
     - Luego configuración mi bash/zsh es de la siguiente forma: `export PATH="$PATH":"$HOME/tools/sonar-scanner/bin"`
6. Volvamos a retomar ingresando a `localhost:9000`
7. Seguido de eso vas a crear un proyecto y vas a elegir la opción **Manually**.
8. Ingresa una key y un nombre de tu elección
9. Ingresa un token para tu proyecto a tu elección.
10. Crea un archivo de [configuración](https://github.com/insideapp-oss/sonar-flutter#project-configuration) en tu proyecto de flutter llamado: `sonar-project.properties`

```console
# Project identification
sonar.projectKey=flutter_rocks
sonar.projectName=Flutter Rocks
sonar.projectVersion=1.0

# Source code location.
# Path is relative to the sonar-project.properties file. Defaults to .
# Use commas to specify more than one folder.
sonar.sources=lib
sonar.tests=test

# Encoding of the source code. Default is default system encoding.
sonar.sourceEncoding=UTF-8

# Allows reuse of an existing analyzer report
# sonar.dart.analysis.reportPath=

# Analyzer mode
# Can be:
# - flutter (flutter analyze) - default
# - dart (dart analyze)
# - legacy (dartanalyzer)
# sonar.flutter.analyzer.mode=
```

    Si quieres usar tu propio linter analyzer agrega esto:
    ```sonar.dart.analysis.useExistingOptions=true```
    El **analysis_options.yaml** debe existir en root del proyecto.

11. Ejecuta el comando para tu OS cómo te lo indica la consola de **SonarQube** en la raíz de tu proyecto.

    <p align="center" width="100%">
      <img src="https://i.imgur.com/zN4S6nt.png" width="600" />
    </p>

    ```console
    sonar-scanner \
      -Dsonar.projectKey=NAME \
      -Dsonar.sources=. \
      -Dsonar.host.url=http://localhost:9000 \
      -Dsonar.login=AuthenticationToken -X;
    ```

12. Resultado: Puedes recargar tu **dashboard** para ver todos resultados.
    <p align="center" width="100%">
      <img src="https://i.imgur.com/6ivPZnm.png" width="600" />
      <img src="https://i.imgur.com/m3PTgHi.png" width="600" />
    </p>

PD: Si te ocurre un error al indexar los archivos de la carpeta test, puedes seguir esta [solución](https://stackoverflow.com/questions/29837369/cant-be-indexed-twice-testsourcedirectory-and-sourcedirectory-are-same/40150551#40150551)

```console
sonar.test.inclusions=**/*test*/**
sonar.exclusions=**/*test*/**
```

PD2: Si quieres excluir las clases generadas por el **build_runner**, puedes usar la solución anterior.

```console
sonar.exclusions=**/*.g.dart,**/*.gr.dart,**/*.freezed.dart
```

## Conclusión

**Sonarqube** puede convertirse en un aliado para proyectos donde tengas equipos que requieran evaluar la calidad del código y dar un salto de calidad. Te permitirá crear "reglas" para que un equipo pueda ir a la par de las expectativas de los clientes. Aun esta muy crudo para flutter y creo que puede bastar con una de las siguientes librerias.

**Static code anlysis**, creo que en la gran mayoria basta con usar alguna de estas librarias [Lint](https://pub.dev/packages/lint), [VeryGoodAnalysis](https://pub.dev/packages/very_good_analysis), [Pedantic](https://pub.dev/packages/pedantic)

---

Realmente los pasos para ejecutar e instalar sonarqube son cortos; lo que quería lograr era ser lo más detallado posible para personas que apenas estén empezando y necesitan un paso a paso más detallado.

Gracias por llegar hasta acá.<br/>
Recuerda dar un like y compartir.

Nos vemos en un próximo articulo de Flutter!!

<p align="center" width="100%">
  <img src="https://i.imgur.com/q7fqQHS.gif" width="200" />
</p>

### Referencias:

- https://docs.sonarqube.org/latest/setup/get-started-2-minutes/
- https://hub.docker.com/_/sonarqube.
- https://docs.docker.com/engine/reference/commandline/cp/
- https://stackoverflow.com/questions/29837369/cant-be-indexed-twice-testsourcedirectory-and-sourcedirectory-are-same/40150551#40150551
- https://github.com/insideapp-oss/sonar-flutter

###### tags: sonarcloud, flutter, dev
