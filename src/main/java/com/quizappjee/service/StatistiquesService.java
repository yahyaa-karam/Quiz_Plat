package com.quizappjee.service;

import com.quizappjee.dao.StatistiquesDAO;
import com.quizappjee.model.Statistiques;

import java.util.List;

public class StatistiquesService {

    private StatistiquesDAO statistiquesDAO = new StatistiquesDAO();

    public void createStatistiques(Statistiques statistiques) {
        statistiquesDAO.create(statistiques);
    }

    public Statistiques getStatistiquesById(int id) {
        return statistiquesDAO.read(id);
    }

    public List<Statistiques> getAllStatistiques() {
        return statistiquesDAO.readAll();
    }

    public void updateStatistiques(Statistiques statistiques) {
        statistiquesDAO.update(statistiques);
    }

    public void deleteStatistiques(int id) {
        statistiquesDAO.delete(id);
    }
}
