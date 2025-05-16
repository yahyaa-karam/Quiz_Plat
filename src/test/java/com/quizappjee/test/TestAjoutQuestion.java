package com.quizappjee.test;

import com.quizappjee.model.Question;
import com.quizappjee.model.Type;
import com.quizappjee.model.Quiz;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestAjoutQuestion {

    public static void main(String[] args) {

        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Question.class)
                .addAnnotatedClass(Quiz.class)
                .buildSessionFactory();

        Session session = factory.openSession();

        try {
            session.beginTransaction();

            Quiz quiz = session.get(Quiz.class, 1);  // Assure-toi que ce quiz existe

            if (quiz != null) {
                Question question = new Question();
                question.setContenu("Quelle est la capitale du Maroc ?");
                question.setType(Type.QCM);
                question.setQuiz(quiz);

                session.save(question);
                session.getTransaction().commit();

                System.out.println("Question ajoutée avec succès !");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
