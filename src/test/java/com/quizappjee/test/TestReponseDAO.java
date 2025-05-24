import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import dao.ReponseDAO;
import models.Reponse;
import util.HibernateUtil;

public class TestReponseDAO {

    private ReponseDAO reponseDAO;

    @BeforeEach
    void setUp() {
        reponseDAO = new ReponseDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testAjouterReponse() {
        Reponse reponse = new Reponse("docker build", true);
        boolean added = reponseDAO.ajouterReponse(reponse);
        assertTrue(added);
    }

    @Test
    void testRechercherReponse() {
        Reponse reponse = reponseDAO.rechercherParId(1);
        assertNotNull(reponse);
    }
}
