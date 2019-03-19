/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Erreur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mvincent
 */
public class Erreur404 extends HttpServlet {

    
    private void processError(HttpServletRequest request,
        HttpServletResponse response) throws IOException {
        // Analyze the servlet exception
        Throwable throwable = (Throwable) request
                        .getAttribute("javax.servlet.error.exception");
        Integer statusCode = (Integer) request
                        .getAttribute("javax.servlet.error.status_code");
        String servletName = (String) request
                        .getAttribute("javax.servlet.error.servlet_name");
        if (servletName == null) {
                servletName = "Unknown";
        }
        String requestUri = (String) request
                        .getAttribute("javax.servlet.error.request_uri");
        if (requestUri == null) {
                requestUri = "Unknown";
        }

        // Set response content type
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.write("<html>\n" +
                "    <head>\n" +
                "        <meta charset=\"UTF-8\">\n" +
                "        <link rel=\"icon\" type=\"image/jpg\" href=\"../images/icon.jpg\" />\n" +
                "        <title>Mini projet jsp</title>\n" +
                "\n" +
                "        <meta name=\"description\" content=\"Mini projet jsp\">\n" +
                "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
                "\n" +
                "        <!-- Bootstrap CSS -->\n" +
                "        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\n" +
                "        <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\">\n" +
                "\n" +
                "        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n" +
                "        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script>\n" +
                "        <script src=\"./scripts/action.js\"></script>\n" +
                "        \n" +
                "    </head>\n" +
                "    <body><div class=\"jumbotrom\">\n" +
                "         <img alt='logo UVSQ site Vélizy' src=\"./images/uvsq_iut_velizy_CMJN.jpg\" width=\"250px\"/> \n" +
                "     </div><div id='contenue' class='container-fluid'>");
        
        
        out.write("<h4>Erreur "+statusCode+"</h4>");
        out.write("<strong>La page </strong>: "+requestUri + "<strong> n'existe pas.</strong>");
        

        out.write("<br><br>");
        out.write("<a href=\"index.jsp\">Page d'accueil</a>");
        out.write("</div></body></html>");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processError(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processError(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
