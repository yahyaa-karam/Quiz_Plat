package com.quizappjee.model;

import javax.persistence.*;

@Entity
public class Etudiant extends Utilisateur {

    private String matricule;

    @ManyToOne
    @JoinColumn(name = "classe_id")
    private Classe classe;

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public Classe getClasse() {
        return classe;
    }

    public void setClasse(Classe classe) {
        this.classe = classe;
    }
}
