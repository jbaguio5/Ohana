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
        //get request parameters and set to String of same name
        String username  = request.getParameter("username");
        String secanswer = request.getParameter("secanswer");
        //connect to database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
        EntityManager em = emf.createEntityManager();
        try {
            //look up user and set parameter
            Users user = (Users)em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            //make sure Security Answer matches to value in database
            if (!user.getSecanswer().equals(secanswer)) {
                request.setAttribute("user", user);
                throw new Exception("Wrong Answer");               
            }
            //set attribute for user
            request.setAttribute("user", user);
            request.setAttribute("userid", user.getUserid());
            //close entity manager
            em.close();
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/passReset.jsp").forward(request, response);
            //exception handling
        } catch (ServletException | IOException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/forgotPass2.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/forgotPass2.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}