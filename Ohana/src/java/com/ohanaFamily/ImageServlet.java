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
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            Query q = em.createNamedQuery("Products.findAll");
            List<Products> images = q.getResultList();
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] image = em.find(Products.class, id).getPicture();
                String picType = em.find(Products.class, id).getPictype();
                response.setContentType(picType);
                try (ServletOutputStream out = response.getOutputStream()) {
                    out.write(image);
                }
            } catch (IOException ioe) {
                request.setAttribute("flash", ioe.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            request.setAttribute("ProductImages", images);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } catch (IOException ioe) {
            request.setAttribute("flash", ioe.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
