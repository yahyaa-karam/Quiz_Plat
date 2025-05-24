package com.quizappjee.test;

import com.quizappjee.dao.ReponseDAO;
import com.quizappjee.model.Reponse;
import com.quizappjee.util.HibernateUtil;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class TestReponseDAO {

    private ReponseDAO reponseDAO;

    @BeforeEach
    void setUp() {
        reponseDAO = new ReponseDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testAjouterReponse() {
        Reponse reponse = new Reponse("docker build", true);
        boolean added = reponseDAO.ajouterReponse(reponse);
        assertTrue(added);
    }

    @Test
    void testRechercherReponse() {
        Reponse reponse = reponseDAO.rechercherParId(1);
        assertNotNull(reponse);
    }
}
