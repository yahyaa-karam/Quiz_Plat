package com.quizappjee.dao;

import com.quizappjee.model.Reponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class ReponseDAO {

    private SessionFactory sessionFactory;

    public ReponseDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean ajouterReponse(Reponse reponse) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(reponse);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Reponse rechercherParId(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Reponse.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void createReponse(Reponse reponse) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.save(reponse);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Reponse> getReponsesByQuestion(int questionId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Reponse where question.id = :questionId", Reponse.class)
                    .setParameter("questionId", questionId).list();
        }
    }
}
