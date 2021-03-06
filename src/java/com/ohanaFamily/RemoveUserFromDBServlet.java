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

@WebServlet(name = "RemoveUserFromDBServlet", urlPatterns = {"/RemoveUserFromDB"})
public class RemoveUserFromDBServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get request parameter and parse the request string to type integer
        int id = Integer.parseInt(request.getParameter("id"));
        
        try {
            //connect to database
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("OhanaPU");
            EntityManager em = emf.createEntityManager();
            //find user by id
            Users user = em.find(Users.class, id);
            //transact removal of user
            em.getTransaction().begin();
            em.remove(user);
            em.getTransaction().commit();
            //close entity manager
            em.close();
            //set request attribute
            request.setAttribute("flash", "Removed Successfully");
            //forward to jsp
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
            //exception handling
        } catch (ServletException | IOException e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
