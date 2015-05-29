package com.ohanaFamily;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get all request parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //connect to database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();

        try {
            //look up user in the database and set parameter username
            Users user = (Users) em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            //set request password to passwordTOHash and get users salt
            String passwordToHash = password;
            String salt = user.getSalt();
            //hash request password
            String securePassword = getSecurePassword(passwordToHash, salt);
            //compare hashes and validate the password
            if (!user.getPassword().equals(securePassword)) {
                throw new Exception("Access Denied");
            }
            //set user in HTTPSession
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("userid", user.getUserid());
            //close entity manager
            em.close();
            //redirect to admin page if user is "admin"
            if (username.equals("admin")) {
                request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("WEB-INF/loginSuccess.jsp").forward(request, response);
            }
            //exception handling
        } catch (NoResultException nre) {
            request.setAttribute("flash", "Username does not exist!");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        } catch (ServletException | IOException se) {
            request.setAttribute("flash", se.getMessage());
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }

    private static String getSecurePassword(String passwordToHash, String salt) {
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
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            return e.getMessage();
        }
        return generatedPassword;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}
