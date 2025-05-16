package com.quizappjee.service;

import com.quizappjee.dao.EnseignantDAO;
import com.quizappjee.model.Enseignant;

import java.util.List;

public class EnseignantService {

    private final EnseignantDAO enseignantDAO = new EnseignantDAO();

    public void ajouterEnseignant(Enseignant enseignant) {
        enseignantDAO.create(enseignant);
    }

    public Enseignant getEnseignantById(int id) {
        return enseignantDAO.findById(id);
    }

    public List<Enseignant> getTousLesEnseignants() {
        return enseignantDAO.findAll();
    }

    public void modifierEnseignant(Enseignant enseignant) {
        enseignantDAO.update(enseignant);
    }

    public void supprimerEnseignant(Enseignant enseignant) {
        enseignantDAO.delete(enseignant);
    }
}
