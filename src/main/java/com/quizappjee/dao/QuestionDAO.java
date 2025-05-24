package com.quizappjee.dao;

import com.quizappjee.model.Question;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class QuestionDAO {

    private SessionFactory sessionFactory;

    public QuestionDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(Question question) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(question);
        tx.commit();
        session.close();
    }

    public List<Question> getQuestionsByQuizId(int quizId) {
        Session session = sessionFactory.openSession();
        List<Question> questions = session.createQuery("FROM Question WHERE quiz.id = :quizId", Question.class)
                .setParameter("quizId", quizId)
                .list();
        session.close();
        return questions;
    }

    public Question findById(int id) {
        Session session = sessionFactory.openSession();
        Question question = session.get(Question.class, id);
        session.close();
        return question;
    }

    public List<Question> findAllByQuizId(int quizId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Question WHERE quiz.id = :quizId", Question.class)
                    .setParameter("quizId", quizId)
                    .list();
        }
    }

    public boolean ajouterQuestion(Question q) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(q);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Question rechercherParId(int i) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Question.class, i);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}