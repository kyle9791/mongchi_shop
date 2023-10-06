package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
    private int cno; // 장바구니 번호
    private String orderId; // 주문번호 or 주문아이디
    private String emailId; // 회원 아이디
    private int pno; // 상품번호
    private int cnt; // 장바구니 개수
    private String addDate; // 장바구니 담은 날짜
    private ProductDTO productDTO;
}
