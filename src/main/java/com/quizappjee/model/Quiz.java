package com.quizappjee.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String titre;
    private String categorie;
    private int duree;
    private String niveau;
    private boolean published = false;

    @ManyToOne
    @JoinColumn(name = "enseignant_id")
    private Utilisateur enseignant;

    @ManyToMany
    @JoinTable(
            name = "quiz_classe",
            joinColumns = @JoinColumn(name = "quiz_id"),
            inverseJoinColumns = @JoinColumn(name = "classe_id")
    )
    private List<Classe> classes;

    @OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Question> questions;

    // ✅ Constructeur utilisé dans les tests
    public Quiz(String titre, String categorie, int duree, String niveau) {
        this.titre = titre;
        this.categorie = categorie;
        this.duree = duree;
        this.niveau = niveau;
    }

    public Quiz() {}

    // Getters & Setters (inchangés) ...
    // (tu peux garder ceux que tu avais, ils sont corrects)
}
