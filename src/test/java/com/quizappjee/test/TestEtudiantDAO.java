package com.quizappjee.test;

import com.quizappjee.dao.EtudiantDAO;
import com.quizappjee.model.Etudiant;
import com.quizappjee.model.Role;

public class TestEtudiantDAO {
    public static void main(String[] args) {
        EtudiantDAO dao = new EtudiantDAO();

        Etudiant e = new Etudiant();
        e.setNom("Aliae");
        e.setPrenom("Chahbar");
        e.setEmail("aliae.chahbar@emsi-edu.ma");
        e.setMdp("azerty123");
        e.setMatricule("EMSI2025");
        e.setRole(Role.ETUDIANT);

        dao.create(e);

        System.out.println("Étudiant ajouté !");
    }
}
