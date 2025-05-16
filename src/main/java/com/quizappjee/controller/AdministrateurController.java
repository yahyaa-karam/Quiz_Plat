package com.quizappjee.controller;

import com.quizappjee.dao.AdministrateurDAO;
import com.quizappjee.model.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdministrateurController", value = "/administrateurs")
public class AdministrateurController extends HttpServlet {

    private AdministrateurDAO administrateurDAO;

    @Override
    public void init() {
        administrateurDAO = new AdministrateurDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Administrateur> admins = administrateurDAO.findAll();
        request.setAttribute("administrateurs", admins);
        request.getRequestDispatcher("/WEB-INF/views/administrateurs.jsp").forward(request, response);
    }
}
