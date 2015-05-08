package com.ohanaFamily;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/ChangePassword"})
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get all request parameters and set them to type String of same name
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPass = request.getParameter("confirmNewPass");

        try {
            //make sure password is at least 4-10 chars in length
            if (newPassword.length() < 4 || newPassword.length() > 10) {
                throw new Exception("Passwords must be between 4-10 characters.");
            }
            //make sure passwords match
            if (!newPassword.equals(confirmNewPass)) {
                request.setAttribute("flash", "Passwords don't match.");
                request.getRequestDispatcher("WEB-INF/forgotPass.jsp").forward(request, response);
            }
            //exception handling
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/forgotPass.jsp").forward(request, response);
        }
        //connect to database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        //look up user and set to request attribute
        Users user = (Users) em.createNamedQuery("Users.findByUsername")
                .setParameter("username", username)
                .getSingleResult();
        request.setAttribute("user", user);
        
        try {
            //set request password to passwordToHash and get users salt
            String passwordToHash = newPassword;
            String salt = user.getSalt();
            //hash request password
            String securePassword = getSecurePassword(passwordToHash, salt);
            //set user password attribute
            user.setPassword(securePassword);
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
            //forward to success jsp
            request.setAttribute("flash", "Password Change Successful!");
            request.getRequestDispatcher("WEB-INF/changePassSuccess.jsp").forward(request, response);
            //exception handling
        } catch (ConstraintViolationException cve) {
            request.setAttribute("flash", cve.getConstraintViolations());
            request.getRequestDispatcher("WEB-INF/forgotPass.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/forgotPass.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }
    
    private static String getSecurePassword(String passwordToHash, String salt)
    {
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(salt.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest(passwordToHash.getBytes());
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e) {
            return e.getMessage();
        }
        return generatedPassword;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
