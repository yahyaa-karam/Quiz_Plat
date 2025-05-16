package com.quizappjee.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import com.quizappjee.model.Utilisateur;

public class TestConnexionHibernate {
    public static void main(String[] args) {
        try {
            SessionFactory factory = new Configuration()
                    .configure("hibernate.cfg.xml")
                    .addAnnotatedClass(Utilisateur.class)
                    .buildSessionFactory();


            Session session = factory.openSession();

            session.beginTransaction();

            System.out.println("Connexion à la base réussie !");

            session.getTransaction().commit();
            session.close();
            factory.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Échec de la connexion !");
        }
    }
}
