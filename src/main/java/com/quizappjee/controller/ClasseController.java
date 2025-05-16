package com.quizappjee.controller;

import com.quizappjee.dao.ClasseDAO;
import com.quizappjee.dao.UtilisateurDAO;
import com.quizappjee.dao.QuizDAO;
import com.quizappjee.model.Classe;
import com.quizappjee.model.Utilisateur;
import com.quizappjee.model.Quiz;
import com.quizappjee.service.ClasseService;
import com.quizappjee.service.QuizService;
import com.quizappjee.util.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/classe")
public class ClasseController extends HttpServlet {

    private ClasseService classeService;
    private UtilisateurDAO utilisateurDAO;
    private QuizService quizService;

    @Override
    public void init() {
        // Initialisation des DAO
        ClasseDAO classeDAO = new ClasseDAO(HibernateUtil.getSessionFactory());
        utilisateurDAO = new UtilisateurDAO();
        QuizDAO quizDAO = new QuizDAO(HibernateUtil.getSessionFactory());

        // Initialisation des services
        quizService = new QuizService(quizDAO);
        classeService = new ClasseService(classeDAO, utilisateurDAO);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "create":
                req.setAttribute("etudiants", utilisateurDAO.findAllEtudiants());
                req.setAttribute("quizzes", quizService.getAllQuizzes());
                req.getRequestDispatcher("/WEB-INF/views/createClasse.jsp").forward(req, resp);
                break;

            case "edit":
                int classeId = Integer.parseInt(req.getParameter("id"));
                Classe classe = classeService.getClasseById(classeId);

                if (classe != null) {
                    req.setAttribute("classe", classe);
                    req.setAttribute("etudiants", utilisateurDAO.findAllEtudiants());
                    req.setAttribute("quizzes", quizService.getAllQuizzes());
                    req.getRequestDispatcher("/WEB-INF/views/editClasse.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/classe?action=list");
                }
                break;


            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                Classe classeToDelete = classeService.getClasseById(deleteId);
                if (classeToDelete != null) {
                    classeService.deleteClasse(classeToDelete);
                }
                resp.sendRedirect(req.getContextPath() + "/classe?action=list");
                break;

            case "assignQuiz":
                int classId = Integer.parseInt(req.getParameter("id"));
                Classe assignClasse = classeService.getClasseById(classId);

                req.setAttribute("classe", assignClasse);
                req.setAttribute("quizzes", quizService.getAllQuizzes());
                req.getRequestDispatcher("/WEB-INF/views/assignQuiz.jsp").forward(req, resp);
                break;

            case "list":
            default:
                req.setAttribute("classes", classeService.getAllClasses());
                req.getRequestDispatcher("/WEB-INF/views/manageClasses.jsp").forward(req, resp);
                break;
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String nom = req.getParameter("nom");
        String[] etudiantIds = req.getParameterValues("etudiantIds");
        String[] quizIds = req.getParameterValues("quizIds");

        List<Integer> studentIds = new ArrayList<>();
        if (etudiantIds != null) {
            for (String id : etudiantIds) {
                studentIds.add(Integer.parseInt(id));
            }
        }

        switch (action) {

            case "add":
                Classe newClasse = new Classe();
                newClasse.setNom(nom);
                classeService.createClasse(newClasse);
                classeService.assignStudentsToClass(newClasse.getId(), studentIds);
                break;

            case "update":
                int classeId = Integer.parseInt(req.getParameter("id"));
                Classe classeToUpdate = classeService.getClasseById(classeId);

                if (classeToUpdate != null) {
                    classeToUpdate.setNom(nom);
                    classeService.updateClasse(classeToUpdate);
                    classeService.assignStudentsToClass(classeId, studentIds);
                }
                break;
        }

        resp.sendRedirect(req.getContextPath() + "/classe");
    }
}
