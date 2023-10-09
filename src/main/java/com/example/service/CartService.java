package com.example.service;

import com.example.dao.CartDAO;
import com.example.dao.ProductDAO;
import com.example.domain.CartVO;
import com.example.domain.ProductVO;
import com.example.dto.CartDTO;
import com.example.dto.ProductDTO;
import com.example.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public enum CartService {
    INSTANCE; // 싱글톤
    private CartDAO cartDAO;
    private ModelMapper modelMapper;

    CartService() {
        cartDAO = new CartDAO();
        modelMapper = MapperUtil.INSTANCE.getInstance();
    }

    public void addCart(CartDTO cartDTO) throws SQLException {
        log.info("addCart(CartDTO cartDTO)...");
        log.info("cartDTO : " + cartDTO);

        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);
        log.info("cartVO : " + cartVO);

        cartDAO.insertCart(cartVO);
    }
    public List<CartDTO> getCartByOrderId(String orderId) throws SQLException {
        log.info("getCartByOrderId(String orderId, String emailId)...");
        log.info("orderId : " + orderId);

        ProductDAO productDAO = new ProductDAO();
        List<CartVO> cartVOList = cartDAO.selectCartByOrderId(orderId);
        List<CartDTO> cartDTOList = new ArrayList<>();

        for (CartVO cartVO : cartVOList) {
            ProductVO productVO = productDAO.selectProductByPno(cartVO.getPno());
            ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);
            log.info("productDTO: " + productDTO);
            CartDTO cartDTO = modelMapper.map(cartVO, CartDTO.class);
            log.info("cartDTO: " + cartDTO);

            cartDTO.setProductDTO(productDTO);
            log.info("cartDTO(set): " + cartDTO);
            cartDTOList.add(cartDTO);
        }

        return cartDTOList;
    }

    public void removeCart(int[] cnos) throws SQLException {
        log.info("removeCart(int cno)...");
        log.info("cnos: " + cnos);

        for (int cno : cnos) {
            cartDAO.deleteCart(cno);
        }
    }

    public void modifyOrderId(String orderId, String emailId) throws SQLException {
        log.info("modifyOrderId(String orderId)...");
        log.info("orderId: " + orderId);

        cartDAO.updateOrderId(orderId, emailId);
    }
}

