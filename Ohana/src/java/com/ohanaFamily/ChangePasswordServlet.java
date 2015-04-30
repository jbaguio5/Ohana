package com.ohanaFamily;

import java.io.IOException;
import java.io.PrintWriter;
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
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPass = request.getParameter("confirmNewPass");

        try {
            if (newPassword.length() < 4 || newPassword.length() > 10) {
                throw new Exception("Passwords must be between 4-10 characters.");
            }

            if (!newPassword.equals(confirmNewPass)) {
                request.setAttribute("flash", "Passwords don't match.");
                request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("forgotPass.jsp").forward(request, response);

        }

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();

        Users user = (Users) em.createNamedQuery("Users.findByUsername")
                .setParameter("username", username)
                .getSingleResult();
        request.setAttribute("user", user);

        try {
            user.setPassword(newPassword);
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();

            request.setAttribute("flash", "Password Change Successful!");
            request.getRequestDispatcher("changePassSuccess.jsp").forward(request, response);
        } catch (ConstraintViolationException cve) {
            request.setAttribute("flash", cve.getConstraintViolations());
            request.getRequestDispatcher("forgotPass.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("forgotPass.jsp").forward(request, response);

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
