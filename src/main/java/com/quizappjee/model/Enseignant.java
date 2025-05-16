package com.quizappjee.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Enseignant extends Utilisateur {

    private String matiere;

    @ManyToMany
    @JoinTable(name = "enseignant_classe",
            joinColumns = @JoinColumn(name = "enseignant_id"),
            inverseJoinColumns = @JoinColumn(name = "classe_id"))
    private List<Classe> listedclasses;

    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    public List<Classe> getListedclasses() {
        return listedclasses;
    }

    public void setListedclasses(List<Classe> listedclasses) {
        this.listedclasses = listedclasses;
    }
}
