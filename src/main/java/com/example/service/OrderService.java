package com.example.service;

import com.example.dao.OrderDAO;
import com.example.domain.OrderVO;
import com.example.dto.OrderDTO;
import com.example.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public enum OrderService {
    INSTANCE; // 싱글톤
    private OrderDAO orderDAO;
    private ModelMapper modelMapper;

    OrderService() {
        orderDAO = new OrderDAO();
        modelMapper = MapperUtil.INSTANCE.getInstance();
    }

    public boolean registerOrder(OrderDTO orderDTO) throws SQLException {
        log.info("registerOrder(OrderDTO orderDTO)...");
        log.info("orderDTO : " + orderDTO);

        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        log.info("orderVO : " + orderVO);

        boolean isRegister = orderDAO.insertOrder(orderVO);
        return isRegister;
    }

    public OrderDTO getOrderByOno(int ono) throws SQLException {
        log.info("getOrderByOno(int ono)...");
        log.info("ono: " + ono);

        OrderVO orderVO = orderDAO.selectOrderByOno(ono);
        OrderDTO orderDTO = modelMapper.map(orderVO, OrderDTO.class);
        return orderDTO;
    }

    public List<OrderDTO> getOrderByEmailId(String emailId) throws SQLException {
        log.info("getOrderByEmailId(String emailId)...");
        log.info("emailId : " + emailId);

        List<OrderVO> orderVOList = orderDAO.selectOrderByEmailId(emailId);
        List<OrderDTO> orderDTOList = new ArrayList<>();
        for (OrderVO orderVO : orderVOList) {
            OrderDTO orderDTO = modelMapper.map(orderVO, OrderDTO.class);
            orderDTOList.add(orderDTO);
        }

        return orderDTOList;
    }

    public void removeOrder(int ono) throws SQLException {
        log.info("removeOrder(int ono)...");
        log.info("ono: " + ono);

        orderDAO.deleteOrder(ono);
    }
}
