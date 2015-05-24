package com.ohanaFamily;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RemoveUserListServlet", urlPatterns = {"/RemoveUserList"})
public class RemoveUserListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            //connect to database
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            //query to find all users
            Query q = em.createNamedQuery("Users.findAll");
            //make list of users
            List<Users> users = q.getResultList();
            //set users in a request attribute
            request.setAttribute("AllUsers", users);
            //close entity manager
            em.close();
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/removeUser.jsp").forward(request, response);
            //exception handling
        } catch (IOException | ServletException ioe) {
            request.setAttribute("flash", ioe.getMessage());
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
