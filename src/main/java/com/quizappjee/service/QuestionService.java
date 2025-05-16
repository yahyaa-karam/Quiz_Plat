package com.quizappjee.service;

import com.quizappjee.dao.QuestionDAO;
import com.quizappjee.model.Question;

import java.util.List;

public class QuestionService {

    private QuestionDAO questionDAO;

    public QuestionService(QuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }

    public void createQuestion(Question question) {
        questionDAO.create(question);
    }

    // Méthode à ajouter dans QuestionService
    public List<Question> getQuestionsByQuizId(int quizId) {
        return questionDAO.findAllByQuizId(quizId);
    }


}
