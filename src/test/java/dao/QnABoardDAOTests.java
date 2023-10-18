package dao;

import com.example.dao.QnABoardDAO;
import com.example.domain.QnABoardVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

@Log4j2
public class QnABoardDAOTests {
    private QnABoardDAO qnABoardDAO;

    @BeforeEach
    public void ready() { qnABoardDAO=new QnABoardDAO(); }

    @Test
    public void testInsertQnABoard() throws Exception {
        for(int i=1; i<=100; i++) {
            QnABoardVO qnABoardVO=QnABoardVO.builder()
                    .pno(1111)
                    .emailId("aaa000")
                    .questionContent("별로")
                    .productName("흠")
                    .secreted(false)
                    .build();
            qnABoardDAO.insertQnABoard(qnABoardVO);
        }

    }

    @Test
    public void testUpdateQuestionBoard() throws Exception {
        QnABoardVO qnABoardVO=QnABoardVO.builder()
                .qno(4)
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
        qnABoardDAO.insertAnswerBoard(qnABoardVO);
    }

    @Test
    public void testDeleteQnABoard() throws Exception {
        qnABoardDAO.deleteQnABoard(4);
    }

    @Test
    public void testUpdateAnswer() throws Exception {
        QnABoardVO qnABoardVO=QnABoardVO.builder()
                .qno(133)
                .build();
        qnABoardDAO.updateAnswerBoard(qnABoardVO);
    }

    @Test
    public void testSelectQnABoardByQno() throws Exception {
        int pno=1111;
        int qno=1;
        QnABoardVO qnABoardVO=qnABoardDAO.selectQnABoardByQno(pno, qno);
        System.out.println(qnABoardDAO.selectQnABoardByQno(pno, qno));
    }


}
