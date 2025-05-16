package com.quizappjee.controller;

import com.quizappjee.dao.EnseignantDAO;
import com.quizappjee.model.Enseignant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/enseignants")
public class EnseignantController extends HttpServlet {

    private EnseignantDAO enseignantDAO;

    @Override
    public void init() {
        enseignantDAO = new EnseignantDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Enseignant> enseignants = enseignantDAO.findAll();
        request.setAttribute("enseignants", enseignants);

        request.getRequestDispatcher("/WEB-INF/views/enseignants.jsp").forward(request, response);
    }
}
