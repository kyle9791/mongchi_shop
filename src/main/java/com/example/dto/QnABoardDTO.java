package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnABoardDTO {
    private int qno;    // qna 게시글 번호
    private String emailId;     // qna 작성자 아이디
    private String pcode;   // 상품 코드
    private String questionContent;     // 질문 내용
    private String questionDate;    // 질문 작성 날짜
    private String answerContent;   // 답변 내용
    private String answerDate;  // 답변 작성 날짜
    private boolean answered;   // 답변 여부
    private boolean secreted;     // 비밀글 여부
}
