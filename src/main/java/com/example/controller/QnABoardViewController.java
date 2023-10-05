package com.example.controller;

import com.example.dto.QnABoardDTO;
import com.example.service.QnABoardService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
@WebServlet(name="qnaBoardViewController", value="/qnaBoard/view")
public class QnABoardViewController extends HttpServlet {

    private final QnABoardService qnABoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pcode=req.getParameter("pcode");
        int qno=Integer.parseInt(req.getParameter("qno"));
        try {
            QnABoardDTO qnABoardDTO=qnABoardService.getQnABoardByQno(pcode, qno);
            req.setAttribute("qnABoardDTO", qnABoardDTO);
            req.getRequestDispatcher("/WEB-INF/qnaBoard/view.jsp").forward(req, resp);
        } catch(Exception e) {
            log.info(e.getMessage());
            throw new ServletException("VIEW error");
        }
    }
}
