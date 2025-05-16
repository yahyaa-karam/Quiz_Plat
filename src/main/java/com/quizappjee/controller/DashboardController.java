package com.quizappjee.controller;

import com.quizappjee.model.Role;
import com.quizappjee.model.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/home")
public class DashboardController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user != null && user.getRole() == Role.ENSEIGNANT) {
            request.getRequestDispatcher("/WEB-INF/views/enseignant/home.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}

