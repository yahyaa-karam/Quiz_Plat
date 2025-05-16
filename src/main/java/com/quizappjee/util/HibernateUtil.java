package com.quizappjee.util;

import com.quizappjee.model.*;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;

    static {
        try {
            Configuration config = new Configuration().configure("hibernate.cfg.xml");

            config.addAnnotatedClass(Utilisateur.class);
            config.addAnnotatedClass(Etudiant.class);
            config.addAnnotatedClass(Enseignant.class);
            config.addAnnotatedClass(Administrateur.class);
            config.addAnnotatedClass(Classe.class);
            config.addAnnotatedClass(Quiz.class);
            config.addAnnotatedClass(Question.class);
            config.addAnnotatedClass(Choix.class);
            config.addAnnotatedClass(Reponse.class);
            config.addAnnotatedClass(Statistiques.class);

            sessionFactory = config.buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Échec de la création de SessionFactory : " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        getSessionFactory().close();
    }
}
