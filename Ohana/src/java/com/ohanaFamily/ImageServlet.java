package com.ohanaFamily;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ImageServlet", urlPatterns = {"/Image"})
public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //connect to database
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            //query for all products
            Query q = em.createNamedQuery("Products.findAll");
            //make list of products
            List<Products> images = q.getResultList();
            try {
                //set request parameter id to type integer of same name
                int id = Integer.parseInt(request.getParameter("id"));
                //get picture from product and set to byte[] image
                byte[] image = em.find(Products.class, id).getPicture();
                //get picture type from product and set to string picType
                String picType = em.find(Products.class, id).getPictype();
                //set picType to response
                response.setContentType(picType);
                //write image to output stream
                ServletOutputStream out = response.getOutputStream();
                out.write(image);
                //exception handling
            } catch (NumberFormatException | IOException e) {
                request.setAttribute("flash", e.getMessage());
                request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
            }
            //close entity manager
            em.close();
            //set request attribute with image
            request.setAttribute("ProductImages", images);
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/products.jsp").forward(request, response);
            //exception handling
        } catch (IOException | ServletException ioe) {
            request.setAttribute("flash", ioe.getMessage());
            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
