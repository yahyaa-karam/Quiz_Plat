package com.quizappjee.service;

import com.quizappjee.dao.ReponseDAO;
import com.quizappjee.model.Question;
import com.quizappjee.model.Reponse;
import com.quizappjee.model.Etudiant;
import com.quizappjee.util.HibernateUtil;

import java.util.List;

public class ReponseService {

    private ReponseDAO reponseDAO = new ReponseDAO(HibernateUtil.getSessionFactory());


    public void saveReponse(String contenu, Question question, Etudiant etudiant, boolean estCorrect) {
        Reponse reponse = new Reponse();
        reponse.setContenu(contenu);
        reponse.setQuestion(question);
        reponse.setEtudiant(etudiant);
        reponse.setEstCorrect(estCorrect);

        reponseDAO.createReponse(reponse);
    }

    public List<Reponse> getReponsesByQuestion(int questionId) {
        return reponseDAO.getReponsesByQuestion(questionId);
    }
}
