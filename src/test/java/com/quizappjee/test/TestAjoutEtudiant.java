package com.quizappjee.test;

import com.quizappjee.model.Etudiant;
import com.quizappjee.model.Role;
import com.quizappjee.model.Utilisateur;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestAjoutEtudiant {

    public static void main(String[] args) {

        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Utilisateur.class)
                .addAnnotatedClass(Etudiant.class)
                .buildSessionFactory();

        Session session = factory.openSession();

        try {
            // Création de l'objet étudiant
            Etudiant etudiant = new Etudiant();
            etudiant.setNom("Chahbar");
            etudiant.setPrenom("Aliae");
            etudiant.setEmail("aliae.chahbar@emsi-edu.ma");
            etudiant.setMdp("motDePasseSecurisé123");
            etudiant.setMatricule("EMSI2025");
            etudiant.setRole(Role.ETUDIANT);

            session.beginTransaction();

            session.save(etudiant);

            session.getTransaction().commit();

            System.out.println("Étudiant inséré avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
