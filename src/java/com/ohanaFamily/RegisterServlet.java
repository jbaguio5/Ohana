package com.ohanaFamily;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //<editor-fold desc="gather all request parameters and set to Strings of same name" defaultstate="collasped">
            String username = request.getParameter("username");
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
            String secanswer = request.getParameter("secanswer");//</editor-fold>

            //make sure password is at least 4-10 chars in length
            if (username.length() < 4 || username.length() > 10
                    || password.length() < 4 || password.length() > 10) {
                request.setAttribute("flash", "Username must be between 4 and 10 characters.");
                request.getRequestDispatcher("WEB-INF/join.jsp").forward(request, response);
            }     
            //make sure the passwords match
            if (!password.equals(password2)) {
                request.setAttribute("flash", "Passwords don't match.");
                request.getRequestDispatcher("WEB-INF/join.jsp").forward(request, response);
            }

            //set password to passwordToHash and generate salt
            String passwordToHash = password;
            String salt = getSalt();
            //hash password and salt
            String securePassword = getSecurePassword(passwordToHash, salt);
            
            //<editor-fold desc="Create new User and set attributes" defaultstate="collasped">
            Users user = new Users();
            user.setUsername(username);
            user.setPassword(securePassword);
            user.setSalt(salt);
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
            user.setSecanswer(secanswer);//</editor-fold>
            
            //connect to database
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            //transact attributes into new row in database
            try {
                em.getTransaction().begin();
                em.persist(user);
                em.getTransaction().commit();
                //set flash and forward to succuss jsp
                request.setAttribute("flash", "Registration Successful!");
                request.getRequestDispatcher("WEB-INF/regSuccess.jsp").forward(request, response);
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
            //exception handling
        } catch (NoSuchAlgorithmException | NoSuchProviderException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/join.jsp").forward(request, response);

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
            return "Error";
        }
        return generatedPassword;
    }

    private static String getSalt() throws NoSuchAlgorithmException, NoSuchProviderException {
        //Java SecureRandom generator using SHA1 PRNG SUN
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "SUN");
        //Create array for salt
        byte[] salt = new byte[16];
        //Get a random salt
        sr.nextBytes(salt);
        //return salt
        return salt.toString();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
