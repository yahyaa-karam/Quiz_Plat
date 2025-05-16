package com.quizappjee.controller;

import com.quizappjee.dao.ClasseDAO;
import com.quizappjee.dao.QuizDAO;
import com.quizappjee.model.Classe;
import com.quizappjee.model.Quiz;
import com.quizappjee.model.Role;
import com.quizappjee.model.Utilisateur;
import com.quizappjee.service.QuizService;
import com.quizappjee.util.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/quiz")
public class QuizController extends HttpServlet {

    private QuizService quizService;
    private ClasseDAO classeDAO;

    @Override
    public void init() {
        quizService = new QuizService(new QuizDAO(HibernateUtil.getSessionFactory()));
        classeDAO = new ClasseDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        if (user == null || user.getRole() != Role.ENSEIGNANT) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (action == null) action = "list";

        switch (action) {
            case "create":
                List<Classe> classes = classeDAO.readAll();
                req.setAttribute("classes", classes);
                req.getRequestDispatcher("/WEB-INF/views/createQuiz.jsp").forward(req, resp);
                break;

            case "edit":
                int quizId = Integer.parseInt(req.getParameter("id"));
                Quiz quiz = quizService.getQuizById(quizId);
                req.setAttribute("quiz", quiz);
                req.getRequestDispatcher("/WEB-INF/views/editQuiz.jsp").forward(req, resp);
                break;

            case "view":
                try {
                    int quizIdView = Integer.parseInt(req.getParameter("id"));
                    Quiz quizToView = quizService.getQuizWithQuestions(quizIdView);

                    if (quizToView != null) {
                        req.setAttribute("quiz", quizToView);
                        req.setAttribute("questions", quizToView.getQuestions());
                        req.getRequestDispatcher("/WEB-INF/views/quizDetails.jsp").forward(req, resp);
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/quiz?action=list");
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    resp.sendRedirect(req.getContextPath() + "/quiz?action=list");
                }
                break;


            case "delete":
                quizId = Integer.parseInt(req.getParameter("id"));
                quizService.deleteQuiz(quizId);
                resp.sendRedirect(req.getContextPath() + "/quiz?action=list");
                break;

            case "publish":
                quizId = Integer.parseInt(req.getParameter("id"));
                quizService.publishQuiz(quizId);
                resp.sendRedirect(req.getContextPath() + "/quiz?action=list");
                break;

            case "list":
            default:
                List<Quiz> quizzes = quizService.getQuizzesByEnseignantId(user.getId());
                req.setAttribute("quizzes", quizzes);
                req.getRequestDispatcher("/WEB-INF/views/viewQuizzes.jsp").forward(req, resp);
        }
    }




    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        if (user == null || user.getRole() != Role.ENSEIGNANT) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        switch (action) {
            case "edit":
                int quizId = Integer.parseInt(req.getParameter("id"));
                String titre = req.getParameter("titre");
                String categorie = req.getParameter("categorie");
                int duree = Integer.parseInt(req.getParameter("duree"));
                String niveau = req.getParameter("niveau");

                Quiz quiz = quizService.getQuizById(quizId);
                if (quiz != null) {
                    quiz.setTitre(titre);
                    quiz.setCategorie(categorie);
                    quiz.setDuree(duree);
                    quiz.setNiveau(niveau);
                    quizService.updateQuiz(quiz);
                }

                resp.sendRedirect(req.getContextPath() + "/quiz?action=list");
                break;

            case "create":
                titre = req.getParameter("titre");
                categorie = req.getParameter("categorie");
                duree = Integer.parseInt(req.getParameter("duree"));
                niveau = req.getParameter("niveau");
                String[] classeIds = req.getParameterValues("classeIds");

                Quiz newQuiz = new Quiz();
                newQuiz.setTitre(titre);
                newQuiz.setCategorie(categorie);
                newQuiz.setDuree(duree);
                newQuiz.setNiveau(niveau);
                newQuiz.setEnseignant(user);

                List<Classe> classes = new ArrayList<>();
                if (classeIds != null) {
                    for (String id : classeIds) {
                        Classe classe = classeDAO.read(Integer.parseInt(id));
                        classes.add(classe);
                    }
                }
                newQuiz.setClasses(classes);
                quizService.createQuiz(newQuiz);

                resp.sendRedirect(req.getContextPath() + "/question?quizId=" + newQuiz.getId());
                break;
        }
    }

}
