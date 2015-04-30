package com.ohanaFamily;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ForgotPasswordServlet2", urlPatterns = {"/ForgotPassword2"})
public class ForgotPasswordServlet2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username  = request.getParameter("username");
        String secanswer = request.getParameter("secanswer");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        try {
            Users user = (Users)em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            
            if (!user.getSecanswer().equals(secanswer)) {
                request.setAttribute("user", user);
                throw new Exception("Wrong Answer");               
            }
            
            request.setAttribute("user", user);
            request.setAttribute("userid", user.getUserid());
            request.getRequestDispatcher("passReset.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("forgotPass2.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}