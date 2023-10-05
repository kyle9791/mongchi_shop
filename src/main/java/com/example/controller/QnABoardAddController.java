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
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;

@Log4j2
@WebServlet(name="qnaBoardAddController", value="/qnaBoard/add")
public class QnABoardAddController extends HttpServlet {
    private final QnABoardService qnaBoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/qnaBoard/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QnABoardDTO qnABoardDTO=new QnABoardDTO();
        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        try {
            BeanUtils.populate(qnABoardDTO, req.getParameterMap());

            log.info("/qnaBoard/add POST");
            log.info(qnABoardDTO);
            qnaBoardService.addQnABoard(qnABoardDTO);
        } catch(Exception e) {
            log.info(e.getMessage());
            throw new ServletException("ADD error");
        }

        resp.sendRedirect("../list.jsp");
    }
}
