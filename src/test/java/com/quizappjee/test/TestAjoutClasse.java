package com.quizappjee.test;

import com.quizappjee.model.Classe;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestAjoutClasse {

    public static void main(String[] args) {

        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Classe.class)
                .buildSessionFactory();

        Session session = factory.openSession();

        try {
            // Création de l'objet Classe
            Classe classe = new Classe();
            classe.setNom("4ème Année Informatique");

            // Début de la transaction
            session.beginTransaction();

            // Enregistrer la classe
            session.save(classe);

            // Commit de la transaction
            session.getTransaction().commit();

            System.out.println("Classe insérée avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
