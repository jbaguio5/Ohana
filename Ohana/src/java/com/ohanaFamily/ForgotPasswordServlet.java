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
        //get request parameter and set to String of same name
        String username = request.getParameter("username");
        //connect to database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        try {
            //look up user by username
            Users user = (Users) em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            //set user attribute for user
            request.setAttribute("user", user);
            //close entity manager
            em.close();
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/forgotPass2.jsp").forward(request, response);
            //exception handling
        } catch (NoResultException nre) {
            request.setAttribute("flash", "Username does not exist!");
            request.getRequestDispatcher("WEB-INF/forgotPass.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/forgotPass.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}
