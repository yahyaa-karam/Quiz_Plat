package com.quizappjee.service;

import com.quizappjee.dao.QuizDAO;
import com.quizappjee.model.Quiz;

import java.util.List;

public class QuizService {

    private QuizDAO quizDAO;

    public QuizService(QuizDAO quizDAO) {
        this.quizDAO = quizDAO;
    }

    public void createQuiz(Quiz quiz) {
        quizDAO.create(quiz);
    }


    public List<Quiz> getAllQuizzes() {
        return quizDAO.readAll();
    }

    public Quiz getQuizById(int id) {
        return quizDAO.findById(id);
    }
    public List<Quiz> getQuizzesByEnseignantId(int enseignantId) {
        return quizDAO.getQuizzesByEnseignantId(enseignantId);
    }
    public void updateQuiz(Quiz quiz) {
        quizDAO.update(quiz);
    }

    public void deleteQuiz(int quizId) {
        quizDAO.delete(quizId);
    }

    public Quiz getQuizWithQuestions(int quizId) {
        return quizDAO.getQuizWithQuestions(quizId);
    }

    public void publishQuiz(int quizID) {
        Quiz quiz = quizDAO.findById(quizID);
        if (quiz != null) {
            quiz.setPublished(true);
            quizDAO.update(quiz);
        }
    }



}
