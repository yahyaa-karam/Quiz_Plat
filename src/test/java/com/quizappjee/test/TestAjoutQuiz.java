package com.quizappjee.test;

import com.quizappjee.model.Quiz;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestAjoutQuiz {

    public static void main(String[] args) {

        // Configuration de la session Hibernate
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Quiz.class)
                .buildSessionFactory();

        Session session = factory.openSession();

        try {
            // Création d'un quiz
            Quiz quiz = new Quiz();
            quiz.setTitre("Quiz Java");
            quiz.setCategorie("Programmation");
            quiz.setDuree(30); // 30 minutes
            quiz.setNiveau("Facile");

            // Début de la transaction
            session.beginTransaction();

            // Enregistrement du quiz
            session.save(quiz);

            // Commit de la transaction
            session.getTransaction().commit();

            System.out.println("Quiz ajouté avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
