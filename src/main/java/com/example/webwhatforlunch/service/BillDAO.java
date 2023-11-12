package com.example.webwhatforlunch.service;

import com.example.webwhatforlunch.model.Bill;
import com.example.webwhatforlunch.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class BillDAO {

    private String username = "root";

    private String password = "1111";

    private String jdbcURL = "jdbc:mysql://localhost:3306/WebWhatForLunch";

    private static final String GET_BILL_USER = "GET_BILL_USER(?)";
    private static final String GET_PRODUCT_IN_BILL = "GET_PRODUCT_IN_BILL(?)";

    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, username, password);
        return connection;
    }
    public List<Bill> getBillUser (int idUser) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        List<Bill> billList = new ArrayList<Bill>();
        CallableStatement callableStatement = connection.prepareCall(GET_BILL_USER);
        callableStatement.setInt(1, idUser);
        ResultSet rs = callableStatement.executeQuery();
        while (rs.next()) {
            int idBill = rs.getInt("idBill");
            int idUserDB = rs.getInt("idUser");
            String idMerchant = rs.getString("idMerchant");
            String recipientName =  rs.getString("recipientName");
            String recipientPhone = rs.getString("recipientPhone");
            String recipientEmail = rs.getString("recipientEmail");
            String recipientAddress = rs.getString("recipientAddress");
            String paymentMethod = rs.getString("paymentMethod");
            String billStatus = rs.getString("billStatus");
            String timeOrder = rs.getString("timeOrder");
            String restaurantName = rs.getString("restaurantName");
            String restaurantAddress = rs.getString("restaurantAddress");
            List<Product> product = getProductListInBill(connection,idBill);
            Bill bill = new Bill(idBill, idUserDB, idMerchant, recipientName, recipientPhone, recipientEmail, recipientAddress, paymentMethod, billStatus, timeOrder, restaurantName, restaurantAddress, product);
            billList.add(bill);
        }
        return billList;
    }

    public List<Product> getProductListInBill(Connection connection,int idBill) throws SQLException {
        CallableStatement callableStatement = connection.prepareCall(GET_PRODUCT_IN_BILL);
        callableStatement.setInt(1,idBill);
        ResultSet rs = callableStatement.executeQuery();
        List<Product> productList = new ArrayList<>();
        while (rs.next()) {
            String idProduct = rs.getString("idProduct");
            String productImg = rs.getString("productIgm");
            String productName = rs.getString("productName");
            String note = rs.getString("note");
            int waitTime = rs.getInt("waitTime");
            int price = rs.getInt("price");
            int sale = rs.getInt("sale");
            int serviceFee = rs.getInt("serviceFee");
            int quantity = rs.getInt("quantity");
            Product product = new Product(idProduct, productName, productImg, waitTime, price, note, sale, serviceFee, quantity);
            productList.add(product);
        }
        return productList;
    }
}
