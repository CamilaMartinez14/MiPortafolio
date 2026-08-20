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
        // Me conecto a MySQL
        conexion = DriverManager.getConnection(url, usuario, clave);

        // Busco las habilidades guardadas
        consulta = conexion.prepareStatement(
            "SELECT * FROM habilidades"
        );

        resultado = consulta.executeQuery();

    } catch (SQLException e) {
        out.println("No se pudo conectar a la base de datos.");
    }
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Habilidades | Camila Martinez Toro</title>
    <meta name="description"
        content="Tecnologías y herramientas utilizadas durante mi formación en Ingeniería en Informática.">

    <link rel="stylesheet" href="../css/reset.css">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

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

        <!-- Habilidades -->
        <section id="habilidades" aria-labelledby="titulo-habilidades">
            <div class="container">

                <h1 id="titulo-habilidades">Habilidades</h1>

                <p>
                    Estas son algunas de las tecnologías y herramientas
                    que he utilizado durante mi formación. Actualmente
                    continúo aprendiendo y desarrollando mis conocimientos
                    en cada una de ellas.
                </p>

                <!-- Tecnologias y herramientas -->
                <div class="row mt-4">

                    <%
                        // Recorro las habilidades guardadas
                        while (resultado != null && resultado.next()) {
                    %>

                        <div class="col-md-6 mb-4">
                            <div class="card h-100">

                                <div class="card-body">

                                    <h2 class="card-title">
                                        <%= resultado.getString("categoria") %>
                                    </h2>

                                    <p class="card-text">
                                        <%= resultado.getString("descripcion") %>
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


    <!-- Boton para volver al inicio -->
    <div class="container text-center mb-4">

        <button id="botonArriba"
            type="button"
            class="btn btn-outline-light">
            Volver arriba
        </button>

    </div>


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