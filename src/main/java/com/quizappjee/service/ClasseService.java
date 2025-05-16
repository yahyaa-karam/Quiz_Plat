package com.quizappjee.service;

import com.quizappjee.dao.ClasseDAO;
import com.quizappjee.dao.UtilisateurDAO;
import com.quizappjee.model.Classe;
import com.quizappjee.model.Utilisateur;
import com.quizappjee.model.Quiz;
import com.quizappjee.model.Role;
import com.quizappjee.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class ClasseService {

    private ClasseDAO classeDAO;
    private UtilisateurDAO utilisateurDAO;

    public ClasseService(ClasseDAO classeDAO, UtilisateurDAO utilisateurDAO) {
        this.classeDAO = classeDAO;
        this.utilisateurDAO = utilisateurDAO;
    }

    public void createClasse(Classe classe) {
        classeDAO.create(classe);
    }

    public Classe getClasseById(int id) {
        return classeDAO.read(id);
    }

    public List<Classe> getAllClasses() {
        return classeDAO.readAll();
    }

    public void updateClasse(Classe classe) {
        classeDAO.update(classe);
    }

    public void deleteClasse(Classe classe) {
        // Retirer tous les étudiants avant la suppression
        List<Utilisateur> etudiants = utilisateurDAO.findEtudiantsByClasseId(classe.getId());
        for (Utilisateur etudiant : etudiants) {
            etudiant.setClasse(null);
            utilisateurDAO.update(etudiant);
        }
        classeDAO.delete(classe.getId());
    }

    public void assignQuizToClass(int classeId, Quiz quiz) {
        classeDAO.assignQuizToClass(classeId, quiz);
    }

    /**
     * Assigner des étudiants à une classe
     */
    public void assignStudentsToClass(int classeId, List<Integer> studentIds) {
        Transaction tx = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Classe classe = session.get(Classe.class, classeId);

            if (classe == null) {
                System.out.println("Classe non trouvée pour l'ID : " + classeId);
                tx.rollback();
                return;
            }

            List<Utilisateur> updatedEtudiants = new ArrayList<>();

            for (Integer studentId : studentIds) {
                Utilisateur etudiant = session.get(Utilisateur.class, studentId);

                if (etudiant != null && etudiant.getRole() == Role.ETUDIANT) {
                    etudiant.setClasse(classe);
                    session.update(etudiant);  // Mettre à jour le lien
                    updatedEtudiants.add(etudiant);
                }
            }

            // Mettre à jour la liste des étudiants dans la classe
            classe.setEtudiants(updatedEtudiants);
            session.update(classe);

            tx.commit();  // Très important, commit après toutes les opérations

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            System.err.println("Erreur dans assignStudentsToClass : " + e.getMessage());
        }
    }



}
