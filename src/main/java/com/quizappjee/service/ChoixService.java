package com.quizappjee.service;

import com.quizappjee.dao.ChoixDAO;
import com.quizappjee.model.Choix;

import java.util.List;

public class ChoixService {

    private ChoixDAO choixDAO;

    public ChoixService(ChoixDAO choixDAO) {
        this.choixDAO = choixDAO;
    }

    public void createChoix(Choix choix) {
        choixDAO.create(choix);
    }

    public List<Choix> getChoicesByQuestionId(int questionId) {
        return choixDAO.findByQuestionId(questionId);
    }

}
