package com.quizappjee.test;

import com.quizappjee.dao.QuizDAO;
import com.quizappjee.model.Quiz;
import com.quizappjee.util.HibernateUtil;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class TestQuizDAO {

    private QuizDAO quizDAO;

    @BeforeEach
    void setUp() {
        quizDAO = new QuizDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testCreerQuiz() {
        Quiz quiz = new Quiz("Docker Basics", "Informatique", 30, "Facile");
        boolean created = quizDAO.ajouterQuiz(quiz);
        assertTrue(created);
    }

    @Test
    void testTrouverQuiz() {
        Quiz quiz = quizDAO.rechercherParId(1);
        assertNotNull(quiz);
    }
}
