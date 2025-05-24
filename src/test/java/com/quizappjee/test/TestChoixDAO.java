package com.quizappjee.test;

import com.quizappjee.dao.ChoixDAO;
import com.quizappjee.model.Choix;
import com.quizappjee.model.Question;
import com.quizappjee.util.HibernateUtil;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class TestChoixDAO {

    private ChoixDAO choixDAO;

    @BeforeEach
    void setUp() {
        choixDAO = new ChoixDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testAjouterChoix() {
        Question question = new Question();
        question.setId(1); // supposé exister

        Choix choix = new Choix();
        choix.setContenu("Option A");
        choix.setCorrect(true);
        choix.setQuestion(question);

        boolean added = choixDAO.ajouterChoix(choix);
        assertTrue(added);
    }

    @Test
    void testRechercherChoix() {
        Choix choix = choixDAO.rechercherParId(1);
        assertNotNull(choix);
    }
}
