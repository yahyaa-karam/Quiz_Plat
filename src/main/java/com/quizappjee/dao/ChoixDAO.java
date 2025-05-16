package com.quizappjee.dao;

import com.quizappjee.model.Choix;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class ChoixDAO {

    private SessionFactory sessionFactory;

    public ChoixDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(Choix choix) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.save(choix);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Choix> getChoicesByQuestionId(int questionId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Choix WHERE question.id = :questionId", Choix.class)
                    .setParameter("questionId", questionId)
                    .list();
        }
    }
    public List<Choix> findByQuestionId(int questionId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Choix WHERE question.id = :questionId", Choix.class)
                    .setParameter("questionId", questionId)
                    .list();
        }
    }

}
