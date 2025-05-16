package com.quizappjee.service;

import com.quizappjee.dao.EtudiantDAO;
import com.quizappjee.model.Etudiant;

import java.util.List;

public class EtudiantService {

    private final EtudiantDAO etudiantDAO = new EtudiantDAO();

    public void ajouterEtudiant(Etudiant etudiant) {
        etudiantDAO.create(etudiant);
    }

    public Etudiant getEtudiantById(int id) {
        return etudiantDAO.findById(id);
    }

    public List<Etudiant> getTousLesEtudiants() {
        return etudiantDAO.findAll();
    }

    public void modifierEtudiant(Etudiant etudiant) {
        etudiantDAO.update(etudiant);
    }

    public void supprimerEtudiant(Etudiant etudiant) {
        etudiantDAO.delete(etudiant);
    }
    public boolean estEmailDisponible(String email) {
        return etudiantDAO.findByEmail(email) == null;
    }

}
