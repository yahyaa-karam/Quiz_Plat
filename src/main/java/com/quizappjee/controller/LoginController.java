package com.quizappjee.controller;

import com.quizappjee.dao.UtilisateurDAO;
import com.quizappjee.model.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String mdp = request.getParameter("mdp");

        Utilisateur user = utilisateurDAO.findByEmailAndPassword(email, mdp);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            switch (user.getRole()) {
                case ETUDIANT:
                    request.getRequestDispatcher("/WEB-INF/views/etudiant/home.jsp").forward(request, response);
                    break;
                case ENSEIGNANT:
                    request.getRequestDispatcher("/WEB-INF/views/enseignant/home.jsp").forward(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("error", "Email ou mot de passe invalide !");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }
}
