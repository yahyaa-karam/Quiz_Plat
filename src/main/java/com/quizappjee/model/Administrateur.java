package com.quizappjee.model;

import javax.persistence.Entity;

@Entity
public class Administrateur extends Utilisateur {

    private int niveauacces;

    public int getNiveauacces() {
        return niveauacces;
    }

    public void setNiveauacces(int niveauacces) {
        this.niveauacces = niveauacces;
    }
}
