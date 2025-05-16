package com.quizappjee.test;

import com.quizappjee.model.Classe;
import com.quizappjee.model.Quiz;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.List;

public class TestAssocierQuizClasse {

    public static void main(String[] args) {

        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Quiz.class)
                .addAnnotatedClass(Classe.class)
                .buildSessionFactory();

        Session session = factory.openSession();

        try {
            session.beginTransaction();

            // Récupère des classes existantes
            Classe classe1 = session.get(Classe.class, 1); // Assure-toi que ces IDs existent en base
            Classe classe2 = session.get(Classe.class, 2);

            List<Classe> classes = new ArrayList<>();
            classes.add(classe1);
            classes.add(classe2);

            // Crée un nouveau quiz
            Quiz quiz = new Quiz();
            quiz.setTitre("Quiz POO");
            quiz.setCategorie("Java");
            quiz.setDuree(45);
            quiz.setNiveau("Intermédiaire");
            quiz.setClasses(classes); // Association des classes

            // Sauvegarde du quiz
            session.save(quiz);

            session.getTransaction().commit();

            System.out.println("Quiz associé aux classes avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
