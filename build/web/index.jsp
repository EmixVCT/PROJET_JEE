<%-- 
    Document   : index
    Created on : 12 mars 2019, 08:54:17
    Author     : mvincent
--%>

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
    </head>
    <body>
        <%
        session = request.getSession();
        if ( session.getAttribute("login") != null && session.getAttribute("droit") != null ){
            if (session.getAttribute("droit").toString().equals("admin")){
                response.sendRedirect("stat.jsp"); 
            }
            else if (session.getAttribute("droit").toString().equals("user")){
                response.sendRedirect("accueil.jsp"); 
            }
        }

        int n = 0;

        if (request.getParameter("id") != null && request.getParameter("pwd") != null) {
            n+=1;
            
            Connection conn=null;
            Statement stmt=null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                try {
                    String jdbc="jdbc:mysql://localhost:3306/g9";
                    String root= "g9";
                    String mdp="g9";
                    conn = DriverManager.getConnection(jdbc, root, mdp);
                    stmt = conn.createStatement();
                

                    try {
                        String login = request.getParameter("id");
                        String  pwd = request.getParameter("pwd");
                        String sel="SELECT login,mdp,droit from utilisateur where login = ? and mdp = ?;";

                        PreparedStatement st = conn.prepareStatement(sel);
                        st.setString(1, login);
                        st.setString(2, pwd);
                        ResultSet res = st.executeQuery();

                        while (res.next()){
                            n += 1;
                            String log = res.getString("login");
                            String mot = res.getString("mdp");
                            String drt = res.getString("droit"); 
                            session.setAttribute("login", log);
                            session.setAttribute("droit", drt);
                            if (drt.equals("admin")){
                                response.sendRedirect("stat.jsp");
                            }else if (drt.equals("user")){
                                response.sendRedirect("accueil.jsp");
                            }else{
                                out.print("Erreur de droit ! ");
                            }
                        }     

                

                    } catch(Exception e) {out.print("Erreur lors de l'acces a la base de données: " + e);out.print("<br>"); }
                
                } catch(Exception e){out.print("Impossible de ce connecter a la base de donnée<br>");}
                
            }
            catch(Exception e){out.print("Erreur Base de donnée");}
        }   
        %>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xs-2 col-sm-9 col-md-7 col-lg-5">
                    <div class="panel panel-default connexion">	
                        <img class='img mb-1'alt='logo UVSQ site Vélizy' src="./images/uvsq_iut_velizy_CMJN.jpg" /> 

                        <form action='index.jsp' method='POST'>
                            <div class="form-group">
                                <input class="form-control" placeholder="Identifiant" name="id" type="text" required/>
                            </div>

                            <div class="form-group">
                                <input class="form-control" placeholder="Mot de passe" name="pwd" type="password" value="" required/>
                            </div>

                            <div class='input-group'>
                                <input name='connection' class="btn btn-lg btn-outline-secondary btn-block" type="submit" value="Se connecter">
                            </div>
                            <%
                            if (n == 1) {
                                %>
                                <div class="form-control-feedback alert alert-danger alert-dismissible fade show" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>

                                    <span class="text-danger align-middle">
                                    <i class="fa fa-close"></i><strong> Erreur :</strong> Identifiant ou mot de passe incorrect !
                                    </span>
                                </div> 
                                <%
                                n = 0;
                            }
                            %>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <div class="footer-copyright text-center py-3">© 2018-2019 <a href="https://www.uvsq.fr">UVSQ</a>, Mini projet JEE/JSP. </i>Maxime VINCENT, Driss NAIT BELKACEM</a>
    </div>
</html> 
