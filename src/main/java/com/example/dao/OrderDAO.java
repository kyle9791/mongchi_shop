package com.example.dao;

import com.example.domain.OrderVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // 주문 생성
    public boolean insertOrder(OrderVO orderVO) throws SQLException {
        String sql = "INSERT INTO orders (orderId, emailId, orderName, orderDate, totalAmount, zipCode, address01, address02, orderStatus)" +
                " VALUES (?, ?, ?, now(), ?, ?, ?, ?, ?)";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, orderVO.getOrderId());
        preparedStatement.setString(2, orderVO.getEmailId());
        preparedStatement.setString(3, orderVO.getOrderName());
        preparedStatement.setInt(4, orderVO.getTotalAmount());
        preparedStatement.setString(5, orderVO.getZipCode());
        preparedStatement.setString(6, orderVO.getAddress01());
        preparedStatement.setString(7, orderVO.getAddress02());
        preparedStatement.setString(8, orderVO.getOrderStatus());
        int rowsAffected = preparedStatement.executeUpdate();
        return rowsAffected > 0;
    }

    // 주문 조회
    public OrderVO selectOrderByOno(int ono) throws SQLException {
        String sql = "SELECT * FROM orders WHERE ono = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, ono);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            OrderVO order = OrderVO.builder()
                    .ono(resultSet.getInt("ono"))
                    .orderId(resultSet.getString("order_id"))
                    .emailId(resultSet.getString("emailId"))
                    .orderDate(resultSet.getString("orderDate"))
                    .totalAmount(resultSet.getInt("totalAmount"))
                    .zipCode(resultSet.getString("zipCode"))
                    .address01(resultSet.getString("address01"))
                    .address02(resultSet.getString("address02"))
                    .orderStatus(resultSet.getString("orderStatus"))
                    .build();
            return order;
        }
        return null;
    }

    // 주문 목록 조회
    public List<OrderVO> selectOrderByEmailId(String emailId) throws SQLException {
        List<OrderVO> orderVOList = new ArrayList<>();
        String sql = "SELECT * FROM orders where emailId = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, emailId);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            OrderVO orderVO = OrderVO.builder()
                    .ono(resultSet.getInt("ono"))
                    .orderId(resultSet.getString("order_id"))
                    .emailId(resultSet.getString("emailId"))
                    .orderDate(resultSet.getString("orderDate"))
                    .totalAmount(resultSet.getInt("totalAmount"))
                    .zipCode(resultSet.getString("zipCode"))
                    .address01(resultSet.getString("address01"))
                    .address02(resultSet.getString("address02"))
                    .orderStatus(resultSet.getString("orderStatus"))
                    .build();
            orderVOList.add(orderVO);
        }

        return orderVOList;
    }

    // 주문 업데이트
//    public boolean updateOrder(OrderVO order) {
//        String sql = "UPDATE orders SET customer_id = ?, order_date = ?, total_amount = ?, shipping_address = ?, order_status = ? WHERE order_id = ?";
//        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//            preparedStatement.setInt(1, order.getCustomerId());
//            preparedStatement.setTimestamp(2, order.getOrderDate());
//            preparedStatement.setBigDecimal(3, order.getTotalAmount());
//            preparedStatement.setString(4, order.getShippingAddress());
//            preparedStatement.setString(5, order.getOrderStatus());
//            preparedStatement.setInt(6, order.getOrderId());
//            int rowsAffected = preparedStatement.executeUpdate();
//            return rowsAffected > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

    // 주문 삭제
    public boolean deleteOrder(int ono) throws SQLException {
        String sql = "DELETE FROM orders WHERE ono = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, ono);
        int rowsAffected = preparedStatement.executeUpdate();

        return rowsAffected > 0;
    }
}

