package com.quizappjee.test;

import com.quizappjee.dao.StatistiquesDAO;
import com.quizappjee.model.Statistiques;

public class TestStatistiquesDAO {

    public static void main(String[] args) {
        StatistiquesDAO statistiquesDAO = new StatistiquesDAO();

        // CREATE
        Statistiques stats = new Statistiques();
        stats.setScore(85);
        statistiquesDAO.create(stats);

        // READ
        Statistiques fetchedStats = statistiquesDAO.read(1);
        System.out.println("Score : " + fetchedStats.getScore());

        // UPDATE
        fetchedStats.setScore(95);
        statistiquesDAO.update(fetchedStats);

        // DELETE
        statistiquesDAO.delete(fetchedStats.getId());
    }
}
