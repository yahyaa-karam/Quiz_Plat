package com.quizappjee.dao;

import com.quizappjee.model.Reponse;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ReponseDAO {

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
