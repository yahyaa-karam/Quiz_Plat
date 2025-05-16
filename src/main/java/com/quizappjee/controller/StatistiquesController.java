package com.quizappjee.controller;

import com.quizappjee.model.Statistiques;
import com.quizappjee.service.StatistiquesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@WebServlet("/statistiques")
public class StatistiquesController extends HttpServlet {

    private StatistiquesService statistiquesService = new StatistiquesService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                List<Statistiques> stats = statistiquesService.getAllStatistiques();
                request.setAttribute("stats", stats);
                request.getRequestDispatcher("statistiquesList.jsp").forward(request, response);
                break;

            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                statistiquesService.deleteStatistiques(id);
                response.sendRedirect("statistiques?action=list");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String scoreParam = request.getParameter("score");

        Statistiques stats = new Statistiques();
        stats.setScore(Integer.parseInt(scoreParam));

        if (idParam == null || idParam.isEmpty()) {
            statistiquesService.createStatistiques(stats);
        } else {
            stats.setId(Integer.parseInt(idParam));
            statistiquesService.updateStatistiques(stats);
        }

        response.sendRedirect("statistiques?action=list");
    }
}
