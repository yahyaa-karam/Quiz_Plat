package com.quizappjee.test;

import com.quizappjee.model.Choix;
import com.quizappjee.model.Question;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestAjoutChoix {

    public static void main(String[] args) {

        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Choix.class)
                .addAnnotatedClass(Question.class)
                .buildSessionFactory();

        Session session = factory.openSession();

        try {
            session.beginTransaction();

            Question question = session.get(Question.class, 1);

            if (question != null) {
                Choix choix1 = new Choix();
                choix1.setContenu("Rabat");
                choix1.setEstCorrect(false);
                choix1.setQuestion(question);

                Choix choix2 = new Choix();
                choix2.setContenu("Casablanca");
                choix2.setEstCorrect(true);
                choix2.setQuestion(question);

                session.save(choix1);
                session.save(choix2);

                session.getTransaction().commit();
                System.out.println("Choix ajoutés avec succès !");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
