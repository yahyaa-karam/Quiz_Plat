package com.quizappjee.test;

import com.quizappjee.model.Quiz;
import com.quizappjee.service.QuizService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestHibernate {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Quiz.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try {
            // Créer un objet Quiz
            Quiz quiz = new Quiz();
            quiz.setTitre("Java Hibernate - Quiz 1");

            // Démarrer la transaction
            session.beginTransaction();

            // Sauvegarder le Quiz
            session.save(quiz);

            // Commit
            session.getTransaction().commit();

            System.out.println("✔️ Quiz créé avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            factory.close();
        }
    }
}
