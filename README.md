# Mi Portafolio - Camila Martinez Toro

Este portafolio lo realicé para la asignatura Desarrollo Web II.

La idea de este trabajo fue crear mi propio portafolio y al mismo tiempo ir utilizando las distintas herramientas que hemos aprendido.

Comencé realizando la estructura con HTML y los estilos con CSS. Después fui agregando Bootstrap, JSP, MySQL y JavaScript. También utilicé Git y GitHub para ir guardando los cambios que fui realizando.

En mi portafolio quise mostrar un poco de lo que he ido haciendo durante la carrera, por eso agregué mis proyectos, habilidades, experiencias y una página de contacto.

Todavía no tengo mucha experiencia en desarrollo web y hay varias cosas que estoy recién aprendiendo, por eso este trabajo también me sirvió para practicar y entender mejor cómo se pueden utilizar distintas herramientas dentro de un mismo proyecto.

---

## Estructura de mi proyecto

Mi proyecto quedó organizado de la siguiente forma:

```text
MiPortafolio/
│
├── css/
│   ├── reset.css          # Reinicia algunos estilos del navegador
│   └── style.css          # Estilos de mi portafolio
│
├── js/
│   └── script.js          # JavaScript que utilizo en las paginas
│
├── jsp/
│   ├── contacto.jsp       # Formulario y conexion con MySQL
│   ├── habilidades.jsp    # Muestra las habilidades
│   └── proyectos.jsp      # Muestra los proyectos
│
├── paginas/
│   ├── contacto.html
│   ├── experiencias.html
│   ├── habilidades.html
│   ├── proyectos.html
│   └── sobre_mi.html
│
├── sql/
│   └── schema.sql         # Estructura de la base de datos
│
├── index.html             # Pagina principal
└── README.md              # Documentacion del proyecto
```

Primero realicé varias páginas utilizando HTML y después fui incorporando JSP. Por eso mantuve las dos partes dentro del proyecto, ya que también muestran cómo fui avanzando durante el desarrollo.

---

## Cómo fui realizando mi portafolio

### 1. HTML

Lo primero que hice fue crear la estructura de mi portafolio utilizando HTML5.

Fui creando las páginas de inicio, sobre mí, proyectos, habilidades, experiencias y contacto.

Para ordenar el contenido fui utilizando etiquetas como `header`, `nav`, `main`, `section` y `footer`.

También agregué los enlaces necesarios para poder moverme entre las distintas páginas.

Al principio trabajé principalmente con HTML porque era una de las partes que conocía un poco más y después fui agregando las otras herramientas.

### 2. CSS

Después comencé a trabajar en cómo quería que se viera mi portafolio.

Utilicé un archivo `reset.css` para normalizar los estilos y otro archivo llamado `style.css`, donde fui agregando los estilos que necesitaba.

Para el diseño elegí principalmente colores oscuros y morados porque me gustó cómo se veía y traté de mantener el mismo estilo en las distintas páginas.

También fui realizando ajustes para que el contenido se adaptara mejor cuando cambia el tamaño de la pantalla.

### 3. Bootstrap

Después agregué Bootstrap 5.

Lo utilicé principalmente para ayudarme con la barra de navegación, las tarjetas, los formularios y para ordenar algunos contenidos utilizando filas y columnas.

También me ayudó para que la navegación se pudiera adaptar mejor cuando el portafolio se abre en una pantalla más pequeña.

La versión que utilicé fue Bootstrap 5.3.3.

### 4. Formularios

En la parte de contacto realicé formularios para que una persona pueda enviar un mensaje y también dejar un comentario.

Utilicé validaciones de HTML5 como:

```html
required
type="email"
```

Con esto puedo revisar algunos datos antes de enviar el formulario.

Después fui conectando esta parte con MySQL para que los mensajes y comentarios enviados pudieran quedar guardados en la base de datos.

### 5. JSP y MySQL

Esta fue una de las partes que más tuve que estudiar mientras realizaba el trabajo porque todavía estoy aprendiendo a utilizar JSP.

Primero tenía mis páginas realizadas en HTML y después fui creando páginas JSP para poder trabajar con información guardada en MySQL.

En `proyectos.jsp` muestro los proyectos que se encuentran guardados en la base de datos y en `habilidades.jsp` hago algo parecido con mis habilidades.

Para realizar la conexión utilicé JDBC.

Una parte de la conexión que utilicé fue:

```java
Connection conexion = DriverManager.getConnection(url, usuario, clave);
```

Esta línea la utilizo para conectarme a MySQL con los datos de conexión que tengo configurados.

También utilicé `PreparedStatement` para realizar las consultas. Por ejemplo:

```java
PreparedStatement consulta = conexion.prepareStatement(
    "SELECT * FROM habilidades"
);
```

En el formulario de contacto también aparecen signos `?` dentro de una consulta.

Al principio no entendía bien para qué servían, pero después aprendí que indican los lugares donde se van colocando los datos que recibe la consulta, por ejemplo el nombre, correo o mensaje.

Mientras estaba revisando el proyecto me di cuenta de que había dejado escrito directamente el usuario de MySQL que utilizaba en mi computador.

Como ese usuario puede ser diferente si el proyecto se prueba en otro computador, decidí guardar también el usuario en una variable de entorno.

Ahora la conexión utiliza:

```java
String usuario = System.getenv("PORTAFOLIO_DB_USER");
String clave = System.getenv("PORTAFOLIO_DB_PASS");
```

`PORTAFOLIO_DB_USER` guarda el usuario que se utiliza para entrar a MySQL y `PORTAFOLIO_DB_PASS` guarda la contraseña.

De esta forma no tengo que cambiar los archivos JSP dependiendo del usuario que tenga configurado cada computador y tampoco dejo la contraseña escrita directamente dentro del código.

### 6. Base de datos

Para este proyecto utilicé MySQL.

La base de datos se llama:

```text
portafolio_db
```

La estructura para crearla se encuentra en:

```text
sql/schema.sql
```

La base de datos la utilicé para trabajar con la información de los proyectos, habilidades y los datos enviados desde los formularios.

Para revisar las tablas y comprobar que la información se estuviera guardando utilicé MySQL Workbench.

### 7. JavaScript

Como todavía estoy aprendiendo JavaScript, preferí hacer algo sencillo y practicar con eso.

En la página de habilidades agregué un botón para volver al comienzo de la página.

Mi `script.js` quedó así:

```javascript
// Espero que la pagina termine de cargar
document.addEventListener("DOMContentLoaded", function () {

    // Busco el boton para volver arriba
    const botonArriba = document.getElementById("botonArriba");

    // Reviso si el boton esta en la pagina
    if (botonArriba) {

        // Cuando hago clic vuelvo al inicio
        botonArriba.addEventListener("click", function () {

            window.scrollTo(0, 0);

        });

    }

});
```

Primero espero que la página termine de cargar y después busco el botón.

También reviso si el botón existe antes de darle una acción porque el mismo archivo JavaScript puede estar conectado a una página donde ese botón no se encuentra.

Cuando hago clic se utiliza `window.scrollTo(0, 0)` y la página vuelve al comienzo.

### 8. Git y GitHub

Durante el desarrollo también fui utilizando Git y GitHub.

Al comienzo Git era una de las cosas que me costaba porque todavía no conocía bien los comandos, pero de a poco fui entendiendo para qué servía cada uno.

Algunos de los comandos que fui utilizando fueron:

```text
git status
git add
git commit
git push
git branch
git merge
```

También creé una rama llamada:

```text
mejora-javascript
```

En esa rama realicé la mejora del botón para volver arriba.

Después de comprobar que funcionaba realicé el commit y uní los cambios nuevamente a la rama `master`.

Esto me ayudó a entender mejor que una rama permite trabajar en un cambio sin modificar inmediatamente la rama principal.

---

## Dificultades que tuve

No todo me funcionó a la primera y hubo varias cosas que tuve que ir probando.

Una de las partes que más me costó fue comenzar a trabajar con JSP y Apache Tomcat. Al principio algunas páginas no abrían como esperaba y tuve que revisar las rutas y volver a probar.

También tuve que realizar varias pruebas con MySQL porque quería comprobar que los datos realmente se estuvieran guardando. Para eso fui revisando las tablas desde MySQL Workbench.

Mientras realizaba la revisión final también me di cuenta de que había dejado escrito directamente en los JSP el usuario de MySQL que utilizaba en mi computador.

Al principio no había pensado que ese usuario podía ser diferente en otro equipo. Para solucionarlo creé la variable de entorno `PORTAFOLIO_DB_USER`, de la misma forma que ya estaba utilizando una variable para la contraseña.

Después realicé nuevamente las pruebas de Proyectos, Habilidades y Contacto para comprobar que la conexión siguiera funcionando.

Otra cosa que me pasó fue con JavaScript. Había realizado el cambio pero no aparecía en el navegador y pensé que no estaba funcionando. Después pude comprobar que el archivo sí estaba conectado y al volver a cargar completamente la página pude ver el cambio.

Git también fue un desafío porque tuve que ir aprendiendo los comandos mientras realizaba el trabajo. Al principio me costaba entender la diferencia entre agregar cambios, hacer un commit, subirlos a GitHub y trabajar con una rama.

Fui tratando de solucionar estas dificultades haciendo pruebas y revisando cada parte antes de continuar.

---

## Material de apoyo

Además de lo trabajado durante la asignatura también fui buscando información cuando tenía dudas.

Utilicé videos de YouTube como apoyo para estudiar algunas cosas que no entendía bien, principalmente cuando estaba trabajando con JSP, Tomcat y MySQL.

También fui buscando información y realizando pruebas en mi computador para comprobar si lo que estaba haciendo funcionaba.

---

## Mi proceso de aprendizaje

Todavía no tengo mucha experiencia en desarrollo web y hay varias herramientas que estoy recién aprendiendo a utilizar.

Por lo mismo trato de estudiar todos los días y practicar lo que voy aprendiendo para poder entenderlo mejor.

Cuando algo no me queda claro trato de buscar información, ver videos y volver a realizar los ejercicios hasta que pueda entender un poco mejor lo que estoy haciendo.

En este proyecto hubo cosas que al comienzo no sabía hacer, sobre todo cuando empecé a trabajar con JSP, Tomcat y la conexión con MySQL.

Mientras fui avanzando también fui entendiendo mejor para qué servía cada herramienta y cómo se podían relacionar entre ellas.

Para mí todavía es un proceso de aprendizaje y sé que me falta mucho por aprender, pero trato de aprovechar cada trabajo para practicar y aprender algo nuevo.

---

## Lo que aprendí realizando el proyecto

Este trabajo me sirvió para juntar varias cosas que antes había trabajado más por separado.

Antes veía HTML, CSS y las bases de datos como cosas más independientes. Con este portafolio pude entender un poco mejor cómo se pueden ir conectando dentro de un mismo proyecto.

También pude entender mejor la diferencia entre tener una página HTML y utilizar JSP para trabajar con información que viene desde una base de datos.

Aprendí un poco más sobre cómo conectar JSP con MySQL, cómo guardar información de un formulario y cómo recuperar datos para mostrarlos en una página.

Otra cosa nueva para mí fue trabajar con una rama de Git. Crear `mejora-javascript`, realizar el cambio y después unirlo a `master` me ayudó bastante a entender para qué sirven las ramas.

---

## Versiones que utilicé

Estas son las principales versiones que utilicé para realizar y probar mi portafolio:

| Herramienta | Versión |
|---|---|
| Visual Studio Code | 1.129.0 |
| Bootstrap | 5.3.3 |
| Java | 22.0.1 |
| Apache Tomcat | 11.0.24 |
| MySQL Server | 8.0.39 |
| MySQL Connector/J | 26.7.0 |
| Git | 2.55.0 |

También trabajé con HTML5, CSS3, JavaScript, JSP, JDBC, GitHub y MySQL Workbench.

---

## Cómo ejecuto mi proyecto

El proyecto lo fui probando de forma local utilizando Apache Tomcat y MySQL.

Primero se debe crear la base de datos utilizando:

```text
sql/schema.sql
```

Para realizar la conexión con MySQL se deben configurar dos variables de entorno:

```text
PORTAFOLIO_DB_USER
PORTAFOLIO_DB_PASS
```

`PORTAFOLIO_DB_USER` corresponde al usuario que se utilizará para conectarse a MySQL y `PORTAFOLIO_DB_PASS` corresponde a su contraseña.

En mi computador utilicé el usuario `portafolio_user`, pero al dejar el usuario como una variable de entorno se puede configurar otro usuario si el proyecto se prueba en otro computador.

Con Tomcat iniciado, en mi computador puedo entrar al proyecto utilizando:

```text
http://localhost:8081/MiPortafolio/
```

Esta dirección corresponde a mi entorno local, por lo tanto `localhost` no es un enlace público de Internet.

Para ejecutar el proyecto completo en otro computador se necesita tener configurado Java, Apache Tomcat, MySQL, las variables de entorno y crear la base de datos mediante `schema.sql`.

---

## Revisión final

Antes de terminar el proyecto fui revisando las principales partes del trabajo:

- [x] Página de inicio.
- [x] Página sobre mí.
- [x] Proyectos.
- [x] Habilidades.
- [x] Experiencias.
- [x] Contacto.
- [x] CSS Reset.
- [x] Estilos propios.
- [x] Bootstrap.
- [x] Diseño adaptable.
- [x] Formularios con validaciones.
- [x] Páginas JSP.
- [x] Conexión con MySQL.
- [x] Archivo `schema.sql`.
- [x] JavaScript.
- [x] Git y commits.
- [x] Rama `mejora-javascript`.
- [x] Repositorio en GitHub.
- [x] Documentación del proyecto.

---

## Tecnologías y herramientas utilizadas

`HTML5` · `CSS3` · `Bootstrap 5` · `JavaScript` · `JSP` · `JDBC` · `MySQL` · `Java` · `Apache Tomcat` · `Git` · `GitHub`

---

## Lo que me dejó este trabajo

Realizar este portafolio me permitió ir juntando varias cosas que he aprendido durante la carrera.

Comencé con algo más sencillo utilizando HTML y CSS y después fui agregando Bootstrap, JSP, MySQL, JavaScript, Git y GitHub.

Este trabajo fue un desafío para mí porque varias de las cosas que utilicé todavía las estoy aprendiendo. Me quedo contenta de haber podido ir avanzando de a poco y lograr que las distintas partes del portafolio funcionaran.

También aprendí que cuando algo no funciona a la primera tengo que ir revisando, probando y tratando de entender dónde puede estar el problema.

Todavía no tengo mucha experiencia programando, pero trato de estudiar y practicar todos los días para ir aprendiendo lo más que pueda.

Quiero seguir practicando para sentirme cada vez más segura programando y poder seguir aprendiendo cosas nuevas durante la carrera.