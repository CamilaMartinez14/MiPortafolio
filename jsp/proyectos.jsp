<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Datos para conectarme a la base de datos
    String url = "jdbc:mysql://localhost:3306/portafolio_db";

    // Tomo el usuario desde una variable de entorno
    String usuario = System.getenv("PORTAFOLIO_DB_USER"); 
    
    // Tomo la clave desde una variable de entorno para no dejarla escrita en el codigo
    String clave = System.getenv("PORTAFOLIO_DB_PASS"); 
    

    Connection conexion = null;
    PreparedStatement consulta = null;
    ResultSet resultado = null;

    try {

        // Intento realizar la conexion con MySQL
        conexion = DriverManager.getConnection(url, usuario, clave);

        // Consulto los proyectos que tengo guardados
        consulta = conexion.prepareStatement(
            "SELECT * FROM proyectos"
        );

        resultado = consulta.executeQuery();

    } catch (SQLException e) {

        out.println("Error al conectar con la base de datos.");

    }
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Proyectos | Camila Martinez Toro</title>
    <meta name="description"
        content="Proyectos realizados durante mi formación en Ingeniería en Informática.">

    <link rel="stylesheet" href="../css/reset.css">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Mis estilos -->
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>

    <!-- Navegacion principal -->
    <header>
        <nav class="navbar navbar-expand-md" aria-label="Navegación principal">
            <div class="container">

                <a class="navbar-brand logo" href="../index.html">
                    Camila Martinez Toro
                </a>

                <!-- Boton para pantallas pequeñas -->
                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#menuPrincipal"
                    aria-controls="menuPrincipal"
                    aria-expanded="false"
                    aria-label="Abrir menu">

                    <span class="navbar-toggler-icon"></span>

                </button>

                <!-- Opciones del menu -->
                <div class="collapse navbar-collapse" id="menuPrincipal">
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="../index.html">Inicio</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="../paginas/sobre_mi.html">Sobre mí</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="proyectos.jsp">Proyectos</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="habilidades.jsp">Habilidades</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="../paginas/experiencias.html">Experiencias</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="contacto.jsp">Contacto</a>
                        </li>

                    </ul>
                </div>

            </div>
        </nav>
    </header>


    <main>

        <!-- Mis proyectos -->
        <section id="proyectos" aria-labelledby="titulo-proyectos">
            <div class="container">

                <h1 id="titulo-proyectos">Proyectos</h1>

                <p>
                    En esta sección presento algunos de los proyectos que he
                    desarrollado durante mi formación en esta hermosa carrera
                    que es Ingeniería en Informática.
                </p>


                <!-- Tarjetas de proyectos -->
                <div class="row mt-4">

                    <%
                        // Recorro los proyectos que tengo guardados
                        while (resultado != null && resultado.next()) {
                    %>

                        <div class="col-md-6 mb-4">

                            <div class="card h-100">

                                <div class="card-body">

                                    <h2 class="card-title">
                                        <%= resultado.getString("nombre") %>
                                    </h2>

                                    <p class="card-text">
                                        <%= resultado.getString("descripcion") %>
                                    </p>

                                    <p class="card-text">
                                        Utilicé <%= resultado.getString("tecnologias") %>.
                                    </p>

                                </div>

                            </div>

                        </div>

                    <%
                        }
                    %>

                </div>

            </div>
        </section>

    </main>


    <!-- Pie de pagina -->
    <footer>

        <p>
            &copy; 2026 Camila Martinez Toro - Mi portafolio.
        </p>

        <p>
            Repositorio:
            <a href="https://github.com/CamilaMartinez14"
                target="_blank"
                rel="noopener">
                github.com/CamilaMartinez14
            </a>
        </p>

    </footer>


    <!-- JavaScript de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Mi JavaScript -->
    <script src="../js/script.js"></script>

</body>

</html>