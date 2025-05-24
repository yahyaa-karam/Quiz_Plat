import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import dao.QuestionDAO;
import models.Question;
import util.HibernateUtil;

public class TestQuestionDAO {

    private QuestionDAO questionDAO;

    @BeforeEach
    void init() {
        questionDAO = new QuestionDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testAjouterQuestion() {
        Question q = new Question("Qu'est-ce que Docker ?", "QCM");
        boolean ajoutOk = questionDAO.ajouterQuestion(q);
        assertTrue(ajoutOk);
    }

    @Test
    void testRechercherQuestion() {
        Question q = questionDAO.rechercherParId(1); // adapter l'ID
        assertNotNull(q);
    }
}
