package com.quizappjee.dao;

import com.quizappjee.model.Etudiant;
import com.quizappjee.model.Role;
import com.quizappjee.model.Utilisateur;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAO {

    /**
     * Récupérer un utilisateur par son ID
     */
    public Utilisateur findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Utilisateur.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Mettre à jour un utilisateur
     */
    public void update(Utilisateur utilisateur) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.update(utilisateur);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    /**
     * Récupérer tous les étudiants (Role = ETUDIANT)
     */
    public List<Etudiant> findAllEtudiants() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Etudiant", Etudiant.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }







    /**
     * Récupérer les étudiants assignés à une classe spécifique
     */
    public List<Utilisateur> findEtudiantsByClasseId(int classeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                            "FROM Utilisateur WHERE role = :role AND classe.id = :classeId", Utilisateur.class)
                    .setParameter("role", Role.ETUDIANT)
                    .setParameter("classeId", classeId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Récupérer un utilisateur par email et mot de passe (pour le login)
     */
    public Utilisateur findByEmailAndPassword(String email, String mdp) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Utilisateur WHERE email = :email AND mdp = :mdp", Utilisateur.class)
                    .setParameter("email", email)
                    .setParameter("mdp", mdp)
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
