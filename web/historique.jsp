<%-- 
    Document   : historique
    Created on : 12 mars 2019, 09:24:55
    Author     : mvincent
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
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
    </head>
    <body>
        <%
        session = request.getSession();
        if ( session.getAttribute("login") == null || session.getAttribute("droit") == null){
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
                <center><h1>Historique</h1></center><br/>
            </header>

            <div class="row">
                <div class="col-12">
                    <label for="name">Historique:</label>
                </div>   
            </div><hr>
            <div class="row">
                <div class="col-12">
                    <%
                    Connection conn=null;
                    Statement stmt=null;
                    int i = 0;
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        try {
                            String jdbc="jdbc:mysql://localhost:3306/g9";
                            String root= "g9";
                            String mdp="g9";
                            conn = DriverManager.getConnection(jdbc, root, mdp);
                            stmt = conn.createStatement();

                            
                            try{
                                
                                String queryString = "SELECT id_partie,nb_coup,combinaisons from info_user where user_login like ?";
                                PreparedStatement pstatement = conn.prepareStatement(queryString);
                                pstatement.setString(1, session.getAttribute("login").toString());
                                ResultSet res = pstatement.executeQuery();
                                out.print("<table id='tab' border=1 align='center' class=\"table table-striped table-fixed table-sm\">"
                                        + "<thead><th class='col-3'>Partie</th>"
                                        + "<th class='col-3'>Nombre de Coups</th>"
                                        + "<th class='col-6'>Combinaison</th></thead><tbody>");
                                i = 0;
                                while (res.next()) {
                                    String coups = res.getString("nb_coup");
                                    String combinaisons = res.getString("combinaisons");
                                    out.print("<tr><td align = 'center' class='col-3'>"+(i+1)+"</td>"
                                            + "<td align = 'center' class='col-3'>" + coups + "</td>"
                                            + "<td align = 'center' class='col-6'>" + combinaisons + "</td>"
                                            + "</tr>");
                                    i++;
                                } 
                                out.print("</tbody></table>");
                            }catch(Exception e){out.print("Erreur de lecture dans la base de donnée");}

                        }catch(Exception e){out.print("Erreur de connection à la base de donnée<br>Imposible de sauvegarder les resultats");}
                    }catch(Exception e){out.print("Erreur de driver MySQL<br>");}
                        
                    %>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <center>
                    Vous avez effectué <% out.print(i); %> parties au total !
                    </center>
                </div>
            </div>
        </div>      
    </body>
    <div class="footer-copyright text-center py-3">© 2018-2019 <a href="https://www.uvsq.fr">UVSQ</a>, Mini projet JEE/JSP. </i>Maxime VINCENT, Driss NAIT BELKACEM</a>
    </div>
</html>
