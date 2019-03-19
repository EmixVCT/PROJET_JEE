<%-- 
    Document   : jeu
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
                <center><h1>Jouer</h1></center><br/>
            </header>

            <div class="row">
                <div class="col-8">
                     <form action="" method="POST">
                        <div class="row">
                            <div class="col-6">
                                 <label for="name">Choisissez un nombre de parties :</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <input class="form-control" id="nb_partie" type="number" min="5" max="10" step="1" name="nb_partie" value="5" />
                                <!--<input class="form-control" type="text" id="nb_partie" name="nb_partie" required> -->      
                            </div>
                            <div class="col-6">
                                <button class="btn btn-outline-secondary" type="submit" name="lancer" value="lancer" >lancer</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
                <div class="col-4"><center>
                        <body onload="dessiner();">
                            <canvas id="canevas" style="margin:10px;" width="150" height="150">
                            </canvas>
                        </body>
                    </center>
                </div>
            </div><hr>
            <div class="row">
                <div class="col-12">
                    
                    <%
                        if (request.getParameter("nb_partie") != null && request.getParameter("lancer") != null){
                            int nb_partie = -1;
                            try{
                                nb_partie = Integer.parseInt(request.getParameter("nb_partie"));
                            }catch(Exception e){};
                            
                            if (nb_partie <= 10 && nb_partie >=5){
                                out.print("<h4>Résultat :</h4>");
                                
                                int i=0,numAleatoire = 0;                                
                                String partie = ""; //On stock les combinaisons dans un String 
                                String games[] = new String[nb_partie]; //On stock les partie dans un tab de string
                                char etat;

                                for (i = 0; i < nb_partie;i++){
                                    etat = 'A';
                                    
                                    while(etat != 'C'){
                                        numAleatoire = (int)(Math.random() * 6) + 1;
                                        if (numAleatoire%2 == 1){
                                            if(etat == 'A'){
                                                etat = 'D';
                                            }else if(etat == 'B'){
                                                etat = 'C';
                                            }else if(etat == 'D'){
                                                etat = 'A';
                                            }    
                                        }
                                        else{
                                            if(etat == 'A'){
                                                etat = 'B';
                                            }else if(etat == 'B'){
                                                etat = 'A';
                                            }else if(etat == 'D'){
                                                etat = 'C';
                                            }
                                        }
                                        
                                        partie += etat;
                                        if(etat != 'C'){
                                            partie += ",";
                                        }
                                        
                                    }//FIN DE PARTIE  
                                    games[i] = new String(partie);
                                    partie = "";
                                }//FIN DE TOUTES LES PARTIES
                                %>
                                <center><table id='tab' border=1 align='center' class="table table-striped table-fixed table-sm">
                                    <thead><tr>
                                        <th class="col-2">Partie</th>
                                        <th class="col-2">Nombre de Coups</th>
                                        <th class="col-8">Combinaison</th>
                                    </tr></thead>
                                <%
                                Connection conn=null;
                                Statement stmt=null;
                                int pp20coup =0;
                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    try {
                                        String jdbc="jdbc:mysql://localhost:3306/g9";
                                        String root= "g9";
                                        String mdp="g9";
                                        conn = DriverManager.getConnection(jdbc, root, mdp);
                                        stmt = conn.createStatement();
                                        
                                        int n;
                                        out.print("<tbody align='center'>");
                                        for(n = 0; n<games.length;n++){
                                            
                                            int nbcoups = games[n].length()-(games[n].length()/2);
                                            out.print(" <tr> <td align = 'center' class='col-2'> "+(n+1)
                                                    + "</td> <td align = 'center' class='col-2'> "+nbcoups+"</td></tr>"
                                                    + "</td> <td align = 'center' class='col-8'> "+(games[n])+"</td></tr>");
                                            if (nbcoups <=20){
                                                try{
                                                    String queryString = "INSERT INTO info_user(user_login,nb_coup,combinaisons) VALUES (?, ?,?)";
                                                    PreparedStatement pstatement = conn.prepareStatement(queryString);
                                                    pstatement.setString(1, session.getAttribute("login").toString());
                                                    pstatement.setString(2, Integer.toString(nbcoups));
                                                    pstatement.setString(3,games[n].toString() );
                                                    pstatement.executeUpdate();
                                                }catch(Exception e){out.print("Erreur de sauvegarde dans la base de donnée");}
                                            }else{
                                                pp20coup++;
                                            }

                                        }
                                        out.print("</tbody></table></center></div>");  
                                        if (pp20coup>0){
                                             out.print("<div class=\"row\"><div class=\"col-12\">"+pp20coup+" Partie(s) s'est(se sont) déroulée(s) en plus de 20 coups</div></div>");  
                                        }
                                    }catch(Exception e){out.print("Erreur de connection à la base de donnée<br>Imposible de sauvegarder les resultats");}
                                }catch(Exception e){out.print("Erreur de driver MySQL<br>");}
                            }else{
                                %>
                                  <div class="form-control-feedback alert alert-danger alert-dismissible fade show" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                    <span class="text-danger align-middle">
                                    <i class="fa fa-close"></i><strong> Erreur :</strong> Le nombre de partie doit être compris entre 5 et 10
                                    </span>
                                </div>  
                                <%
                            }   
                        }
                    %>
                </div>
            </div>
        </div>      
    </body>
    <div class="footer-copyright text-center py-3">© 2018-2019 <a href="https://www.uvsq.fr">UVSQ</a>, Mini projet JEE/JSP. </i>Maxime VINCENT, Driss NAIT BELKACEM</a>
    </div>
</html>
