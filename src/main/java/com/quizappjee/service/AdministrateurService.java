package com.quizappjee.service;

import com.quizappjee.dao.AdministrateurDAO;
import com.quizappjee.model.Administrateur;

import java.util.List;

public class AdministrateurService {

    private final AdministrateurDAO administrateurDAO = new AdministrateurDAO();

    public void ajouterAdministrateur(Administrateur admin) {
        administrateurDAO.create(admin);
    }

    public Administrateur getAdministrateurById(int id) {
        return administrateurDAO.findById(id);
    }

    public List<Administrateur> getTousLesAdministrateurs() {
        return administrateurDAO.findAll();
    }

    public void modifierAdministrateur(Administrateur admin) {
        administrateurDAO.update(admin);
    }

    public void supprimerAdministrateur(Administrateur admin) {
        administrateurDAO.delete(admin);
    }
}
