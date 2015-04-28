/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ohanaFamily;

import java.io.IOException;
import java.util.List;
import javax.persistence.Entity;
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

/**
 *
 * @author Java
 */
@WebServlet(name = "ImageServlet", urlPatterns = {"/ImageServlet"})
public class ImageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            Query q = em.createNamedQuery("Products.findAll");
            List<Products> images = q.getResultList();
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] image = em.find(Products.class, id).getPicture();
                response.setContentType("image/jpeg");
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
