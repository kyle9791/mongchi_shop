package service;

import com.example.dto.QnABoardDTO;
import com.example.service.QnABoardService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

@Log4j2
public class QnABoardServiceTests {
    private QnABoardService qnABoardService;

    @BeforeEach
    public void ready() { qnABoardService=QnABoardService.INSTANCE; }

    @Test
    public void testGetQnABoardByQno() throws Exception {
        int pno=1111;
        int qno=1;
        log.info(qnABoardService.getQnABoardByQno(pno, qno));
    }

//    @Test
//    public void testGetQnABoardByPcode() throws Exception {
//        int pno=1111;
//        int startRow=11;
//        int pageSize=10;
//        List<QnABoardDTO> qnABoardDTOList=qnABoardService.getQnABoardByPcode(pno, startRow, pageSize);
//        for(QnABoardDTO qnABoardDTO:qnABoardDTOList) {
//            log.info(qnABoardDTO);
//        }
//    }

    @Test
    public void testAddQnABoard() throws Exception {
        QnABoardDTO qnABoardDTO=QnABoardDTO.builder()
                .emailId("zzz123")
                .pno(1111)
                .questionContent("안뇽하세요")
                .productName("흠")
                .build();
        qnABoardService.addQnABoard(qnABoardDTO);
    }

    @Test
    public void testModifyQuestionBoard() throws Exception {
        QnABoardDTO qnABoardDTO=QnABoardDTO.builder()
                .qno(5)
                .questionContent("헤헤")
                .build();
        qnABoardService.modifyQuestionBoard(qnABoardDTO);
    }

    @Test
    public void testModifyAnswerBoard() throws Exception {
        QnABoardDTO qnABoardDTO=QnABoardDTO.builder()
                .qno(5)
                .answered(true)
                .answerContent("아아아아아아")
                .build();
        qnABoardService.modifyAnswerBoard(qnABoardDTO);
    }

    @Test
    public void testRemoveQnABoard() throws Exception {
        qnABoardService.removeQnABoard(5);
    }

}
