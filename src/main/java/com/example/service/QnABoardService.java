package com.example.service;

import com.example.dao.QnABoardDAO;
import com.example.domain.QnABoardVO;
import com.example.dto.QnABoardDTO;
import com.example.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;
import org.modelmapper.ModelMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public enum QnABoardService {
    INSTANCE;
    private QnABoardDAO qnABoardDAO;
    private ModelMapper modelMapper;

    QnABoardService() {
        qnABoardDAO=new QnABoardDAO();
        modelMapper= MapperUtil.INSTANCE.getInstance();
    }

    public QnABoardDTO getQnABoardByQno(String pcode, int qno) throws Exception {
        QnABoardVO qnABoardVO=qnABoardDAO.selectQnABoardByQno(pcode, qno);
        QnABoardDTO qnABoardDTO=modelMapper.map(qnABoardVO, QnABoardDTO.class);
        return qnABoardDTO;
    }

    public int getAllQnAListCount(String pcode) throws Exception {
        // 전체 qna수 가져오기
        int cnt=qnABoardDAO.getQnAListCount(pcode);
        log.info("service cnt"+cnt);
        return cnt;
    }

    public List<QnABoardDTO> getQnABoardByPcode(String pcode, int currentPage, int limit) throws Exception {

        List<QnABoardVO> qnABoardVOList=qnABoardDAO.selectQnAByPcode(pcode, currentPage, limit);
        List<QnABoardDTO> qnABoardDTOList=new ArrayList<>();


        for(QnABoardVO vo:qnABoardVOList) {
            qnABoardDTOList.add(modelMapper.map(vo, QnABoardDTO.class));
        }
        return qnABoardDTOList;
    }

    public void addQnABoard(QnABoardDTO qnaBoardDTO) throws Exception {
        QnABoardVO qnABoardVO=modelMapper.map(qnaBoardDTO, QnABoardVO.class);
        qnABoardDAO.insertQnABoard(qnABoardVO);
    }

    public void modifyQuestionBoard(QnABoardDTO qnaBoardDTO) throws Exception {
        QnABoardVO qnABoardVO=modelMapper.map(qnaBoardDTO, QnABoardVO.class);
        qnABoardDAO.updateQuestionBoard(qnABoardVO);
    }

    public void modifyAnswerBoard(QnABoardDTO qnaBoardDTO) throws Exception {
        QnABoardVO qnABoardVO=modelMapper.map(qnaBoardDTO, QnABoardVO.class);
        qnABoardDAO.updateAnswerBoard(qnABoardVO);
    }

    public void removeQnABoard(int qno) throws Exception {
        qnABoardDAO.deleteQnABoard(qno);
    }



}
