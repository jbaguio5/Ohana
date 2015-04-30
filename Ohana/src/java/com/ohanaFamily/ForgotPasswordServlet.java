package com.ohanaFamily;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/ForgotPassword"})
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        try {
           Users user = (Users) em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            
            request.setAttribute("user", user);
            request.getRequestDispatcher("forgotPass2.jsp").forward(request, response);
        } catch (NoResultException nre) {
            request.setAttribute("flash", "Username does not exist!");
            request.getRequestDispatcher("fotgotPass.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}
