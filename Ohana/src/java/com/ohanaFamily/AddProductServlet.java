/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ohanaFamily;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Java
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProduct"})
@MultipartConfig
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String paypalValue = request.getParameter("paypalValue");
        String feature1 = request.getParameter("feature1");
        String feature2 = request.getParameter("feature2");
        String feature3 = request.getParameter("feature3");
        String dimensions = request.getParameter("dimensions");
        Double price = Double.parseDouble(request.getParameter("price"));
        String prodType = request.getParameter("prodType");
        Part filePart = request.getPart("picture");

        Products product = new Products();
        product.setDescription(description);
        product.setContent(content);
        product.setPaypalvalue(paypalValue);
        product.setFeature1(feature1);

        if (feature2 != null) {
            product.setFeature2(feature2);
        }

        if (feature3 != null) {
            product.setFeature3(feature3);
        }

        product.setDimensions(dimensions);
        product.setPrice(price);
        product.setProductType(prodType);

        String fileName = filePart.getSubmittedFileName();
        String filetype = filePart.getContentType();
        if (!filetype.contains("image")) {
            request.setAttribute("flash", "The uploaded file is not an image!");
        }
        InputStream imgdata = filePart.getInputStream();
        byte[] pixels = readImage(imgdata);
        
        product.setPicture(pixels);
        product.setPictype(filetype);

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(product);
            em.getTransaction().commit();
            
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
        }

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

    private byte[] readImage(InputStream imgdata) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        byte[] buffer = new byte[0xFFFF];
        for (int len; (len = imgdata.read(buffer)) != -1;) {
            os.write(buffer, 0, len);
        }
        os.flush();
        return os.toByteArray();
    }
}
