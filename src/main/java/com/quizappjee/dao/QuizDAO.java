package com.quizappjee.dao;

import com.quizappjee.model.Quiz;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import java.util.List;

public class QuizDAO {

    private SessionFactory sessionFactory;

    public QuizDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(Quiz quiz) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.save(quiz);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }


    public List<Quiz> readAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Quiz", Quiz.class).list();
        }
    }

    public Quiz findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Quiz.class, id);
        }
    }


    public List<Quiz> getQuizzesByEnseignantId(int enseignantId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Quiz WHERE enseignant.id = :enseignantId", Quiz.class)
                    .setParameter("enseignantId", enseignantId)
                    .list();
        }
    }

    public void update(Quiz quiz) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.update(quiz);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public void delete(int quizId) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            Quiz quiz = session.get(Quiz.class, quizId);
            if (quiz != null) {
                session.delete(quiz);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
    public Quiz getQuizWithQuestions(int quizId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                            "SELECT q FROM Quiz q LEFT JOIN FETCH q.questions WHERE q.id = :id", Quiz.class)
                    .setParameter("id", quizId)
                    .uniqueResult();
        }
    }



}
