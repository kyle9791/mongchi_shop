package com.example.controller.cart;

import com.example.dto.CartDTO;
import com.example.dto.OrderDTO;
import com.example.service.CartService;
import com.example.service.OrderService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet("/shippingInfo")
public class shippingInfoController extends HttpServlet {
    private final OrderService ORDER_SERVICE = OrderService.INSTANCE;
    private final CartService CART_SERVICE = CartService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/shippingInfo(GET)...");

        HttpSession session = req.getSession();
        String orderId = (String) session.getAttribute("orderId");

        req.getRequestDispatcher("/WEB-INF/cart/shippingInfo.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 전달받은 주문 데이터 Service로 전달
        log.info("/shippingInfo(POST)...");
        HttpSession session = req.getSession();
        List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");

        OrderDTO orderDTO = new OrderDTO();
        try {
            BeanUtils.populate(orderDTO, req.getParameterMap());
            log.info("orderDTO: " + orderDTO);

            boolean isRegister = ORDER_SERVICE.registerOrder(orderDTO);
            if (isRegister) {
                int[] cnos = new int[cartDTOList.size()]; // 장바구니 번호 배열 생성
                int i = 0;
                for (CartDTO cartDTO : cartDTOList) {
                    cnos[i++] = cartDTO.getCno();
                }

                session.removeAttribute("cartDTOList");
                CART_SERVICE.removeCart(cnos);
                // 주문번호도 세션에서 삭제해야하나?
            }

            req.getRequestDispatcher("/WEB-INF/cart/thankCustomer.jsp").forward(req, resp);
        } catch (Exception e) {
            log.info(e.getMessage());
            throw new ServletException("shippingInfo(POST) error");
        }
    }
}