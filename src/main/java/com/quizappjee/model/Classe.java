package com.quizappjee.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Classe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nom;

    @OneToMany(mappedBy = "classe", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Utilisateur> etudiants = new ArrayList<>();

    @ManyToMany
    @JoinTable(
            name = "classe_quiz",
            joinColumns = @JoinColumn(name = "classe_id"),
            inverseJoinColumns = @JoinColumn(name = "quiz_id")
    )
    private List<Quiz> quizzes = new ArrayList<>();

    // Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public List<Utilisateur> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(List<Utilisateur> etudiants) {
        this.etudiants = etudiants;
    }

    public List<Quiz> getQuizzes() {
        return quizzes;
    }

    public void setQuizzes(List<Quiz> quizzes) {
        this.quizzes = quizzes;
    }

    // Méthodes de gestion des quizzes
    public void addQuiz(Quiz quiz) {
        if (!quizzes.contains(quiz)) {
            quizzes.add(quiz);
            quiz.getClasses().add(this);
        }
    }

    public void removeQuiz(Quiz quiz) {
        if (quizzes.contains(quiz)) {
            quizzes.remove(quiz);
            quiz.getClasses().remove(this);
        }
    }

    /**
     * Ajouter un étudiant à la classe
     */
    public void addEtudiant(Utilisateur etudiant) {
        if (etudiant.getRole() == Role.ETUDIANT) {
            etudiants.add(etudiant);
            etudiant.setClasse(this);
        }
    }

    /**
     * Retirer un étudiant de la classe
     */
    public void removeEtudiant(Utilisateur etudiant) {
        if (etudiants.contains(etudiant)) {
            etudiants.remove(etudiant);
            etudiant.setClasse(null);
        }
    }
}
