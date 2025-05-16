package com.quizappjee.controller;

import com.quizappjee.dao.ChoixDAO;
import com.quizappjee.dao.QuestionDAO;
import com.quizappjee.model.Choix;
import com.quizappjee.model.Question;
import com.quizappjee.service.ChoixService;
import com.quizappjee.util.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/choix")
public class ChoixController extends HttpServlet {

    private ChoixService choixService;
    private QuestionDAO questionDAO;

    @Override
    public void init() {
        choixService = new ChoixService(new ChoixDAO(HibernateUtil.getSessionFactory()));
        questionDAO = new QuestionDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String questionIdParam = req.getParameter("questionId");

        if (questionIdParam != null) {
            int questionId = Integer.parseInt(questionIdParam);
            Question question = questionDAO.findById(questionId);

            if (question != null) {
                List<Choix> choixList = choixService.getChoicesByQuestionId(questionId);
                req.setAttribute("question", question);
                req.setAttribute("choixList", choixList);
            }
        }

        req.getRequestDispatcher("/WEB-INF/views/addChoix.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int questionId = Integer.parseInt(req.getParameter("questionId"));
        String contenu = req.getParameter("contenu");
        boolean estCorrect = req.getParameter("estCorrect") != null;

        Question question = questionDAO.findById(questionId);

        Choix choix = new Choix();
        choix.setContenu(contenu);
        choix.setEstCorrect(estCorrect);
        choix.setQuestion(question);

        choixService.createChoix(choix);

        resp.sendRedirect(req.getContextPath() + "/choix?questionId=" + questionId + "&message=Choix ajouté !");
    }

}
