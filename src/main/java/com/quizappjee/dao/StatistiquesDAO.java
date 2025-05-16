package com.quizappjee.dao;

import com.quizappjee.model.Statistiques;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.quizappjee.util.HibernateUtil;

import java.util.List;

public class StatistiquesDAO {

    public void create(Statistiques statistiques) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(statistiques);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Statistiques read(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Statistiques.class, id);
        }
    }

    public List<Statistiques> readAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Statistiques> query = session.createQuery("from Statistiques", Statistiques.class);
            return query.list();
        }
    }

    public void update(Statistiques statistiques) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(statistiques);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Statistiques statistiques = session.get(Statistiques.class, id);
            if (statistiques != null) {
                session.delete(statistiques);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
