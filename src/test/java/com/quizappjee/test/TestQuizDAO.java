import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import dao.QuizDAO;
import models.Quiz;
import util.HibernateUtil;

public class TestQuizDAO {

    private QuizDAO quizDAO;

    @BeforeEach
    void setUp() {
        quizDAO = new QuizDAO(HibernateUtil.getSessionFactory());
    }

    @Test
    void testCreerQuiz() {
        Quiz quiz = new Quiz("Docker Basics", "Informatique", 30, "Facile");
        boolean created = quizDAO.ajouterQuiz(quiz);
        assertTrue(created);
    }

    @Test
    void testTrouverQuiz() {
        Quiz quiz = quizDAO.rechercherParId(1);
        assertNotNull(quiz);
    }
}
