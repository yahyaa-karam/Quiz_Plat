package com.quizappjee.controller;

import com.quizappjee.dao.QuestionDAO;
import com.quizappjee.dao.QuizDAO;
import com.quizappjee.model.Question;
import com.quizappjee.model.Type;
import com.quizappjee.model.Quiz;
import com.quizappjee.service.QuestionService;
import com.quizappjee.util.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/question")
public class QuestionController extends HttpServlet {

    private QuestionService questionService;
    private QuizDAO quizDAO;

    @Override
    public void init() {
        questionService = new QuestionService(new QuestionDAO(HibernateUtil.getSessionFactory()));
        quizDAO = new QuizDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String quizIdParam = req.getParameter("quizId");

        if (quizIdParam != null) {
            int quizId = Integer.parseInt(quizIdParam);
            Quiz quiz = quizDAO.findById(quizId);

            if (quiz != null) {
                List<Question> questions = questionService.getQuestionsByQuizId(quizId);
                req.setAttribute("quiz", quiz);
                req.setAttribute("questions", questions);
            }
        }

        req.getRequestDispatcher("/WEB-INF/views/addQuestion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int quizId = Integer.parseInt(req.getParameter("quizId"));
        String contenu = req.getParameter("contenu");
        Type type = Type.valueOf(req.getParameter("type"));

        Quiz quiz = quizDAO.findById(quizId);

        Question question = new Question();
        question.setContenu(contenu);
        question.setType(type);
        question.setQuiz(quiz);

        questionService.createQuestion(question);

        // Redirection logique
        if (type == Type.QCM) {
            resp.sendRedirect(req.getContextPath() + "/choix?questionId=" + question.getId());
        } else {
            resp.sendRedirect(req.getContextPath() + "/question?quizId=" + quizId + "&message=Question ajoutée !");
        }
    }

}
