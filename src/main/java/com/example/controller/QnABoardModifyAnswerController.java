package com.example.controller;

import com.example.dto.QnABoardDTO;
import com.example.service.QnABoardService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
@WebServlet(name="qnaBoardModifyAnswerController", value="/qnaBoard/modifyAnswer")
public class QnABoardModifyAnswerController extends HttpServlet {
    private final QnABoardService qnABoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int qno=Integer.parseInt(req.getParameter("qno"));
        String pcode=req.getParameter("pcode");
        try {
            QnABoardDTO qnABoardDTO=qnABoardService.getQnABoardByQno(pcode, qno);
            req.setAttribute("qnABoardDTO", qnABoardDTO);
            req.getRequestDispatcher("/WEB-INF/qnaBoard/modify.jsp").forward(req, resp);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new ServletException("QnABoardService GET error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QnABoardDTO qnABoardDTO=new QnABoardDTO();
        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        try {
            log.info("/qnaBoard/modifyAnswer POST");
            BeanUtils.populate(qnABoardDTO, req.getParameterMap());
            log.info(qnABoardDTO);
            qnABoardService.modifyAnswerBoard(qnABoardDTO);
        } catch(Exception e) {
            log.info(e.getMessage());
            throw new ServletException("QnABoardModifyAnswerController POST error");
        }

        resp.sendRedirect("../list.jsp");
    }
}
