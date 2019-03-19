<%-- 
    Document   : accueil
    Created on : 12 mars 2019, 09:24:55
    Author     : mvincent
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/jpg" href="../images/icon.jpg" />
        <title>Mini projet jsp</title>

        <meta name="description" content="Mini projet jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="./css/style.css">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="./scripts/action.js"></script>
        
    </head>
    <body>
        <%
        session = request.getSession();
        if ( session.getAttribute("login") == null || session.getAttribute("droit") == null ){
           response.sendRedirect("index.jsp"); 
        }           
            %>
            <div class="jumbotrom">
                <img alt='logo UVSQ site Vélizy' src="./images/uvsq_iut_velizy_CMJN.jpg" width="250px"/> 
            </div>

            <nav class="navbar navbar-expand-md navbar-dark">
                <button class="navbar-toggler mt-1 mb-1 ml-3" type="button" data-toggle="collapse" data-target="#barre_de_nav" aria-controls="#barre_de_nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="barre_de_nav">
                    <ul class="navbar-nav mr-auto" >
                        <li class="nav-item active ">
                            <a class="nav-link pl-3 pr-3" href="accueil.jsp"> Accueil </a>
                        </li>
                        <li class="nav-item active ">
                                <a class="nav-link pl-3 pr-3" href="jeu.jsp"> Jouer </a>
                        </li>
                        <li class="nav-item active ">
                                <a class="nav-link pl-3 pr-3" href="historique.jsp"> Mon historique </a>
                        </li>
                        <%
                            if (session.getAttribute("droit") != null && session.getAttribute("droit").toString().equals("admin")){ %>
                               <li class="nav-item active">
                                    <a class="nav-link pl-3 pr-3" href="stat.jsp"> Statistiques </a>
                               </li>      
                        <% } %>
                    </ul>
                    <form class="form-inline my-2 my-lg-0 mr-3 ml-2 mb-1" action='logout.jsp' method='POST'>
                        <label for="" class="mr-2"><%if (session.getAttribute("login") != null){ out.print(session.getAttribute("login").toString()); }%></label>
                        <button class="btn btn-danger my-2 my-sm-0" action='submit' name='deco' id="deco" >Déconnexion</button>
                    </form>
                </div>
            </nav>

            <div id='contenue' class='container-fluid'>
                <header>
                    <center><h1>Accueil</h1></center><br/>
                </header>

                <div class="row">
                    <div class="col-2">
                        <h4>Règles du jeu :</h4>
                    </div>
                    <div class="col-10">
                        <p>Sur un carré dont les sommets sont notés A ; B ; C et ; D<br/>  
                        <body onload="dessiner();">
                            <canvas id="canevas" style="margin:10px;" width="150" height="150">
                            </canvas>
                        </body><br/>
                        
                        Le joueur se place sur le sommet A et souhaite se rendre au sommet C 
                        en se déplaçant horizontalement ou verticalement en suivant les arêtes du carré.
                        Pour cela, le joueur lance un dé à 6 faces, si il fait un nombre
                        pair il se déplace horizontalement, si il fait un nombre impair
                        il se déplace verticalement. Une partie se termine lorsque le joueur arrive en C.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form action="jeu.jsp" method="POST">
                        <button class="btn btn-outline-secondary btn-right" >Jouer</button>
                    </div>
                </div><hr>
                <div class="row">
                    <div class="col-2">
                        <h4>Exemple de partie :</h4>
                    </div>
                    <div class="col-10">
                        <table border="2" class="table">
                                <tr align='center'>
                                    <th>dé</th><td>2</td><td>2</td><td>3</td><td>5</td><td>4</td><td>3</td>
                                </tr>
                                <tr align='center'>
                                    <th>sommet</th><td>B</td><td>A</td><td>D</td><td>A</td><td>B</td><td>C</td>
                                </tr>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-10">
                        <p>La partie se termine donc en 6 coups<br/><br/>
                        
                        <button class="btn btn-outline-secondary" onclick="annimation()">Lancer l'animation</button>
                        
                        <div id ="myAnimation" ></div>

                        <body onload="dessiner();">
                            <canvas id="canevas2" style="margin:10px;" width="150" height="150">
                            </canvas>
                        </body></p><br/>
                    </div>
                </div><br/>
                
            </div>
    </body>
    <div class="footer-copyright text-center py-3">© 2018-2019 <a href="https://www.uvsq.fr">UVSQ</a>, Mini projet JEE/JSP. </i>Maxime VINCENT, Driss NAIT BELKACEM</a>
    </div>
</html>
