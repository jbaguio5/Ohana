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

@WebServlet(name = "RemoveProductListServlet", urlPatterns = {"/RemoveProductList"})
public class RemoveProductListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            //connect to database
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            //query to find all products in database
            Query q = em.createNamedQuery("Products.findAll");
            //make list of products
            List<Products> prods = q.getResultList();
            //set products in a request attribute
            request.setAttribute("AllProducts", prods);
            //close entity manager
            em.close();
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/removeProduct.jsp").forward(request, response);
            //exception handling
        } catch (IOException | ServletException ioe) {
            request.setAttribute("flash", ioe.getMessage());
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
        }
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
