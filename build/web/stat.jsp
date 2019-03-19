<%-- 
    Document   : stat
    Created on : 12 mars 2019, 09:25:02
    Author     : mvincent
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        <script src="./scripts/action.js"></script>
    </head>
    <body>
        <%
        session = request.getSession();
        if ( session.getAttribute("login") == null || session.getAttribute("droit") == null || (session.getAttribute("droit") != null && !session.getAttribute("droit").toString().equals("admin")) ){ 
           response.sendRedirect("index.jsp"); 
        }

        String tabCoups = "";

        Connection conn=null;
        Statement stmt=null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        }catch(Exception e){out.print(e);out.print("<br>");}

        try {
            String jdbc="jdbc:mysql://localhost:3306/g9";
            String root= "g9";
            String mdp="g9";
            conn = DriverManager.getConnection(jdbc, root, mdp);
            stmt = conn.createStatement();
        }catch(Exception e){out.print(e);out.print("<br>");}
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
                <center><h1>Statistiques</h1></center>
            </header>

            <div class="row">
                <div class="col-2">
                    <label for="tab">Statistiques des parties réalisées :</label>
                </div>
                <div class="col-10">
                    <div class='row col-12'>
                    <table id='tab' border=1 align='center' class="table table-striped table-fixed table-sm">
                        <thead><tr>
                            <th class="col-6">Nombre de coups</th>
                            <th class="col-6">Nombre de parties</th>        
                        </tr></thead>
                        <tbody align='center'>
                        <%
                        String sel= "SELECT nb_coup,COUNT(nb_coup) as nb_partie from info_user group by nb_coup order by nb_coup";
                        
                        PreparedStatement st = conn.prepareStatement(sel);
                        ResultSet res = st.executeQuery();
                        
                        while (res.next()) {
                            String coups = res.getString("nb_coup");
                            String nb_partie = res.getString("nb_partie");
                            out.print("<tr ><td align = 'center' class='col-6'>" + coups + "</td>"
                                    + "<td align = 'center' class='col-6'>" + nb_partie + "</td></tr>");
                            tabCoups += coups +","+nb_partie+";";
                            
                        }
                        %> 
                        </tbody>
                    </table></div>
                </div>
            </div><br/>
            <div class="row">
                <div class="col-6">
                    <label for="moyenne">Nombre moyen de coups par parties :</label>
                </div>
                <div class="col-6">
                    <label for="et">Écart type des coups par parties :</label>
                </div>
            </div><br/>
            
            <div class="row">
                <div class="col-3">
                    <imput type="button" class="btn btn-outline-secondary " name="moyenne" value="moyenne" onclick="javascript:moyenne('<% out.print(tabCoups); %>')" >Moyenne de coups</input>
                </div>
                <div class="col-3">
                    <input class="form-control" type="text" id="moy" name="moy" readonly>
                </div>
                <div class="col-3">
                    <imput type="button" name="et" class="btn btn-outline-secondary " value="type" onclick="javascript:ecart_type('<% out.print(tabCoups); %>')" >Calculer l'écart type</input>
                </div>
                <div class="col-3">
                    <input class="form-control" type="text" id="et" name="et" readonly>
                </div>
            </div><br/> 
            <div class="row">
                <div class="col-6">
                    <center><canvas id="barChart"></canvas></center><br/>
                    <script>show_bar('<% out.print(tabCoups); %>')</script>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <center><p>Graphique représentant le nombre de parties en fonction du nombre de coups</p></center>
                </div>
            </div>
    </body>
    <div class="footer-copyright text-center py-3">© 2018-2019 <a href="https://www.uvsq.fr">UVSQ</a>, Mini projet JEE/JSP. </i>Maxime VINCENT, Driss NAIT BELKACEM</a>
    </div>
</html>
