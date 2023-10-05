package dao;

import com.example.dao.QnABoardDAO;
import com.example.domain.QnABoardVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

@Log4j2
public class QnABoardDAOTests {
    private QnABoardDAO qnABoardDAO;

    @BeforeEach
    public void ready() { qnABoardDAO=new QnABoardDAO(); }

    @Test
    public void testInsertQnABoard() throws Exception {
        for(int i=1; i<=100; i++) {
            QnABoardVO qnABoardVO=QnABoardVO.builder()
                    .pcode("p126")
                    .emailId("ccc000")
                    .questionSubject("별로")
                    .questionContent("별로임")
                    .secreted(false)
                    .build();
            qnABoardDAO.insertQnABoard(qnABoardVO);
        }

    }

    @Test
    public void testUpdateQuestionBoard() throws Exception {
        QnABoardVO qnABoardVO=QnABoardVO.builder()
                .qno(4)
                .questionSubject("흠 별로")
                .questionContent("받은 지 이틀도 안 됐는데 벌써 고장남")
                .build();
        qnABoardDAO.updateQuestionBoard(qnABoardVO);
    }

    @Test
    public void testUpdateAnswerBoard() throws Exception {
        QnABoardVO qnABoardVO=QnABoardVO.builder()
                .qno(1)
                .answered(true)
                .answerContent("죄송합니다, 고객님. 파손 제품은 수거해 가고, 새로운 제품 보내 드리겠습니다.")
                .build();
        qnABoardDAO.updateAnswerBoard(qnABoardVO);
    }

    @Test
    public void testDeleteQnABoard() throws Exception {
        qnABoardDAO.deleteQnABoard(4);
    }

    @Test
    public void testSelectQnABoardByQno() throws Exception {
        String pcode="p123";
        int qno=1;
        QnABoardVO qnABoardVO=qnABoardDAO.selectQnABoardByQno(pcode, qno);
        System.out.println(qnABoardDAO.selectQnABoardByQno(pcode, qno));
    }


}
