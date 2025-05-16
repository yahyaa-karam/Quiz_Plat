package com.quizappjee.controller;

import com.quizappjee.dao.EtudiantDAO;
import com.quizappjee.model.Etudiant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/etudiants")
public class EtudiantController extends HttpServlet {
    private final EtudiantDAO etudiantDAO = new EtudiantDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Etudiant> etudiants = etudiantDAO.findAll();
        req.setAttribute("etudiants", etudiants);
        req.getRequestDispatcher("/WEB-INF/views/etudiants.jsp").forward(req, resp);
    }
}
