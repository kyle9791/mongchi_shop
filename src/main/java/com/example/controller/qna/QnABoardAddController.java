package com.example.controller.qna;

import com.example.dto.MemberDTO;
import com.example.dto.QnABoardDTO;
import com.example.service.QnABoardService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebServlet("/qnaBoard/add")
public class QnABoardAddController extends HttpServlet {
    private final QnABoardService qnaBoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/qnaBoard/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QnABoardDTO qnABoardDTO = new QnABoardDTO();
        int pno = Integer.parseInt(req.getParameter("pno"));
        HttpSession session=req.getSession();
        MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
        String emailId=memberDTO.getEmailId();

        try {
            BeanUtils.populate(qnABoardDTO, req.getParameterMap());
            qnABoardDTO.setEmailId(emailId);
            log.info("/qnaBoard/add POST");
            log.info(qnABoardDTO);
            qnaBoardService.addQnABoard(qnABoardDTO);
        } catch(Exception e) {
            log.info(e.getMessage());
            throw new ServletException("ADD error");
        }

        resp.sendRedirect("/qnaBoard/qnaList?pno=" + pno);
    }
}
