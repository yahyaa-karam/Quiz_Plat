package com.quizappjee.controller;

import com.quizappjee.dao.EtudiantDAO;
import com.quizappjee.dao.EnseignantDAO;
import com.quizappjee.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/signup")
public class SignupController extends HttpServlet {

    private final EtudiantDAO etudiantDAO = new EtudiantDAO();
    private final EnseignantDAO enseignantDAO = new EnseignantDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role = request.getParameter("role");
        request.setAttribute("role", role);
        request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String mdp = request.getParameter("mdp");
        String roleStr = request.getParameter("role");
        String matricule = request.getParameter("matricule");
        String matiere = request.getParameter("matiere");

        try {
            Role role = Role.valueOf(roleStr.trim().toUpperCase());

            if (role == Role.ETUDIANT) {
                Etudiant etudiant = new Etudiant();
                etudiant.setNom(nom);
                etudiant.setPrenom(prenom);
                etudiant.setEmail(email);
                etudiant.setMdp(mdp);
                etudiant.setRole(role);
                etudiant.setMatricule(matricule);
                etudiantDAO.create(etudiant);
            } else if (role == Role.ENSEIGNANT) {
                Enseignant enseignant = new Enseignant();
                enseignant.setNom(nom);
                enseignant.setPrenom(prenom);
                enseignant.setEmail(email);
                enseignant.setMdp(mdp);
                enseignant.setRole(role);
                enseignant.setMatiere(matiere);
                enseignantDAO.create(enseignant);
            }

            response.sendRedirect("login?signupSuccess=true");

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "⚠️ Rôle invalide : " + roleStr);
            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
        }
    }

}
