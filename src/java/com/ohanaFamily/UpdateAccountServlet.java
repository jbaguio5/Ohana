package com.ohanaFamily;

import java.io.IOException;
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

@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/UpdateAccount"})
public class UpdateAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get all request parameters and set to String of same name
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state1 = request.getParameter("state1");
        String zipcode = request.getParameter("zipcode");
        String phone = request.getParameter("phone");
        String secquestion = request.getParameter("secquestion");
        String secanswer = request.getParameter("secanswer");
        //set user to user that is currently in the Session
        Users user = (Users) request.getSession().getAttribute("user");
        //make sure passwords match
        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
            request.getRequestDispatcher("WEB-INF/userAccount.jsp").forward(request, response);
        }
        //check if password has been changed
        if (password.length() < 11) {
            //set request password to new string
            String passwordToHash = password;
            //get users salt
            String salt = user.getSalt();
            //hash change password and set to password
            password = getSecurePassword(passwordToHash, salt);
        }
        //set user attributes
        user.setPassword(password);
        user.setEmail(email);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setAddress(address);

        if (address2 != null) {
            user.setAddress2(address2);
        }

        user.setCity(city);
        user.setState1(state1);
        user.setZipcode(zipcode);

        if (phone != null) {
            user.setPhone(phone);
        }

        user.setSecquestion(secquestion);
        user.setSecanswer(secanswer);
        //connect to database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();

        try {
            //merge user attributes
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
            //close entity manager
            em.close();
            //forward to success jsp
            request.setAttribute("flash", "Update Successful!");
            request.getRequestDispatcher("WEB-INF/updateSuccess.jsp").forward(request, response);
            //exception handling
        } catch (ConstraintViolationException cve) {
            request.setAttribute("flash", cve.getConstraintViolations());
            request.getRequestDispatcher("WEB-INF/join.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/join.jsp").forward(request, response);
        } finally {
            em.close();
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
            //exception handling
        } catch (NoSuchAlgorithmException e) {
            return "Error";
        }
        return generatedPassword;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
