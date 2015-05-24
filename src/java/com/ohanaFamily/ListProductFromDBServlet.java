package com.ohanaFamily;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "ListProductFromDBServlet", urlPatterns = {"/ListProductFromDB"})
public class ListProductFromDBServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            //connect to database
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            //query to find all products in database
            Products prod = (Products) em.createNamedQuery("Products.findById")
                    .setParameter("id", id)
                    .getSingleResult();
            //make list of products
            //set products in a request attribute
            request.setAttribute("prod", prod);
            //close entity manager
            em.close();
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/updateProduct.jsp").forward(request, response);
            //exception handling
        } catch (IOException | ServletException ioe) {
            request.setAttribute("flash", ioe.getMessage());
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
