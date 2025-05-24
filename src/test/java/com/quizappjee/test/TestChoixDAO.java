import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import dao.ChoixDAO;
import models.Choix;
import util.HibernateUtil;

public class TestChoixDAO {

    private ChoixDAO choixDAO;

    @BeforeEach
    void setUp() {
        choixDAO = new ChoixDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testAjouterChoix() {
        Choix choix = new Choix("docker build", true);
        boolean result = choixDAO.ajouterChoix(choix);
        assertTrue(result);
    }

    @Test
    void testRechercherChoix() {
        Choix choix = choixDAO.rechercherParId(1);  // à adapter à ton ID réel
        assertNotNull(choix);
    }
}
