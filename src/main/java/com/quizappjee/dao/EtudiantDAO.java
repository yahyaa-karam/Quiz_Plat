package com.quizappjee.dao;

import com.quizappjee.model.Etudiant;
import com.quizappjee.model.Role;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class EtudiantDAO implements GenericDAO<Etudiant> {

    @Override
    public void create(Etudiant etudiant) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(etudiant);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Etudiant> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Etudiant e WHERE e.role = :role", Etudiant.class)
                    .setParameter("role", Role.ETUDIANT)
                    .list();
        }
    }


    public Etudiant findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Etudiant.class, id);
        }
    }

    @Override
    public void update(Etudiant etudiant) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.update(etudiant);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Etudiant etudiant) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.delete(etudiant);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public Etudiant findByEmail(String email) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Etudiant WHERE email = :email", Etudiant.class)
                    .setParameter("email", email)
                    .uniqueResult();
        }
    }






}
