package com.quizappjee.dao;

import com.quizappjee.model.Classe;
import com.quizappjee.model.Quiz;
import com.quizappjee.model.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;

import java.util.List;

public class ClasseDAO {

    private SessionFactory sessionFactory;

    public ClasseDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(Classe classe) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.save(classe);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public Classe read(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Classe.class, id);
        }
    }

    public List<Classe> readAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Classe", Classe.class).list();
        }
    }

    public void update(Classe classe) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();

            // Récupérer la classe existante
            Classe existingClasse = session.get(Classe.class, classe.getId());

            if (existingClasse != null) {
                // Détacher les anciens étudiants
                for (Utilisateur etudiant : existingClasse.getEtudiants()) {
                    etudiant.setClasse(null);
                    session.update(etudiant);
                }

                // Assigner les nouveaux étudiants
                for (Utilisateur etudiant : classe.getEtudiants()) {
                    etudiant.setClasse(classe);
                    session.update(etudiant);
                }

                // Mettre à jour la classe
                session.merge(classe);
            }

            tx.commit();

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }


    public void delete(int id) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            Classe classe = session.get(Classe.class, id);

            if (classe != null) {
                for (Utilisateur etudiant : classe.getEtudiants()) {
                    etudiant.setClasse(null);
                    session.update(etudiant);
                }
                session.delete(classe);
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    /**
     * Assigner un quiz à une classe
     */
    public void assignQuizToClass(int classeId, Quiz quiz) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            Classe classe = session.get(Classe.class, classeId);
            if (classe != null) {
                if (!classe.getQuizzes().contains(quiz)) {
                    classe.addQuiz(quiz);
                    session.update(classe);
                }
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
}
