package com.quizappjee.dao;

import com.quizappjee.model.Session;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class SessionDAO implements GenericDAO<Session> {

    @Override
    public void create(Session sessionObj) {
        Transaction tx = null;
        try (org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(sessionObj);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public Session findById(int id) {
        try (org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Session.class, id);
        }
    }

    @Override
    public List<Session> findAll() {
        try (org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Session", Session.class).list();
        }
    }

    @Override
    public void update(Session sessionObj) {
        Transaction tx = null;
        try (org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.update(sessionObj);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Session sessionObj) {
        Transaction tx = null;
        try (org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.delete(sessionObj);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
}
