package com.ohanaFamily;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

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
        String secanswer = request.getParameter("secanswer");

        if (username.length() < 4 || username.length() > 10
                || password.length() < 4 || password.length() > 10) {
            request.setAttribute("flash", "Username must be between 4 and 10 characters.");
            request.getRequestDispatcher("join.jsp").forward(request, response);
        }
        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
            request.getRequestDispatcher("join.jsp").forward(request, response);
        }

        Users user = new Users();
        user.setUsername(username);
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

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();

            request.setAttribute("flash", "Registration Successful!");
            request.getRequestDispatcher("regSuccess.jsp").forward(request, response);

        }catch (ConstraintViolationException cve) {
            request.setAttribute("flash", cve.getConstraintViolations());
            request.getRequestDispatcher("join.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("join.jsp").forward(request, response);

        } finally {
            em.close();
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

}
