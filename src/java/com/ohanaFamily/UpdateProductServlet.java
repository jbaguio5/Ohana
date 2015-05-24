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
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProduct"})
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //<editor-fold defaultstate="collapsed" desc="Get all request parameters and set them to type String of same name">
        int id = Integer.parseInt(request.getParameter("id"));
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
//</editor-fold>

        //<editor-fold defaultstate="collapsed" desc="Set all attributes to new Product">
        //connect to database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        Products product = (Products) em.createNamedQuery("Products.findById")
                .setParameter("id", id).getSingleResult();
        //set user attribute for user
        request.setAttribute("prod", product);
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
//</editor-fold>

        try {
            //transact product
            em.getTransaction().begin();
            em.merge(product);
            em.getTransaction().commit();
            //close entity manager
            em.close();
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
            //exception handling
        } catch (ServletException | IOException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private byte[] readImage(InputStream imgdata) throws IOException {
        //get outputstream
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        //create new byte[]
        byte[] buffer = new byte[0xFFFF];
        //write to outputstream
        for (int len; (len = imgdata.read(buffer)) != -1;) {
            os.write(buffer, 0, len);
        }
        //flush outputstream
        os.flush();
        return os.toByteArray();
    }
}
