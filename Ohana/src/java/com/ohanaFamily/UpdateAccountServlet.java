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
import javax.validation.ConstraintViolationException;

@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/UpdateAccount"})
public class UpdateAccountServlet extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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

        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
            request.getRequestDispatcher("userAccount.jsp").forward(request, response);
        }

        Users user = (Users)request.getSession().getAttribute("user");
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
            em.merge(user);
            em.getTransaction().commit();

            request.setAttribute("flash", "Update Successful!");
            request.getRequestDispatcher("updateSuccess.jsp").forward(request, response);

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
