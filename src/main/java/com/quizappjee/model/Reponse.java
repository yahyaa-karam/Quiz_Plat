package com.quizappjee.model;

import javax.persistence.*;

@Entity
public class Reponse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "question_id")
    private Question question;

    @ManyToOne
    @JoinColumn(name = "etudiant_id")
    private Etudiant etudiant;

    private String contenu;

    private boolean estCorrect;

    // ✅ Constructeur utilisé dans les tests
    public Reponse(String contenu, boolean estCorrect) {
        this.contenu = contenu;
        this.estCorrect = estCorrect;
    }

    public Reponse() {}

    // Getters & Setters (inchangés)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Question getQuestion() { return question; }
    public void setQuestion(Question question) { this.question = question; }

    public Etudiant getEtudiant() { return etudiant; }
    public void setEtudiant(Etudiant etudiant) { this.etudiant = etudiant; }

    public String getContenu() { return contenu; }
    public void setContenu(String contenu) { this.contenu = contenu; }

    public boolean isEstCorrect() { return estCorrect; }
    public void setEstCorrect(boolean estCorrect) { this.estCorrect = estCorrect; }
}
