package com.quizappjee.dao;

import com.quizappjee.model.Reponse;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ReponseDAO {

    public boolean ajouterReponse(Reponse reponse) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
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
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Reponse.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void createReponse(Reponse reponse) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(reponse);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Reponse> getReponsesByQuestion(int questionId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Reponse where question.id = :questionId", Reponse.class)
                    .setParameter("questionId", questionId).list();
        }
    }
}
