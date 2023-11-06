package com.example.webwhatforlunch.service;

import com.example.webwhatforlunch.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements ProductInterface{
    private String username = "root";
    private String password = "1111";
    private String jdbcURL = "jdbc:mysql://localhost:3306/WebWhatForLunch";

    private final String GET_PRODUCT_BY_ID_MERCHANT_AND_NAME_PRODUCT = "{CALL SEARCH_MERCHANT_PRODUCT(?,?)}";
    private final String CREATE_PRODUCT_QUERY = "{CALL CREATE_NEW_PRODUCT(?,?,?,?,?,?,?,?)}";
    private final String UPDATE_PRODUCT_QUERY = "{CALL UPDATE_PRODUCT_BY_ID(?,?,?,?,?,?,?,?)}";
    private final String DELETE_PRODUCT_QUERY = "{CALL DELETE_PRODUCT_BY_ID(?)}";
    private final String GET_ALL_PRODUCT_BY_ID_MERCHANT = "{CALL GET_ALL_PRODUCT_BY_ID_MERCHANT(?)}";
    private final String GET_PRODUCT_BY_ID = "{CALL GET_PRODUCT_BY_ID(?)}";
    private final String SEARCH_BY_NAME = "{CALL SEARCH_PRODUCT_BY_NAME(?)}";
    private final String SEARCH_PRODUCT_BY_TAG = "{CALL SEARCH_PRODUCT_BY_TAG(?)}";

    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, username, password);
        return connection;
    }
    @Override
    public Product getProductById(String productId) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_PRODUCT_BY_ID);
        callableStatement.setString(1, productId);
        Product product = null;
        ResultSet rs = callableStatement.executeQuery();

        if (rs.next()) {
            String idProduct = rs.getString("idProduct");
            String idMerchant = rs.getString("idMerchant");
            String productName = rs.getString("productName");
            String productImg = rs.getString("productImg");
            int waitTime = rs.getInt("waitTime");
            int price = rs.getInt("price");
            String note = rs.getString("note");
            int sale = rs.getInt("sale");
            int serviceFee = rs.getInt("serviceFee");
            int view = rs.getInt("view");
            int orders = rs.getInt("orders");
            product = new Product(idProduct, idMerchant, productName, productImg, waitTime, price, note, sale,serviceFee,view,orders);
        }
        return product;
    }


    @Override
    public Product findProductByName(String idMerchant, String nameProduct) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_PRODUCT_BY_ID_MERCHANT_AND_NAME_PRODUCT);
        return null;
    }

    @Override
    public void createProduct(Product product) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(CREATE_PRODUCT_QUERY);
        callableStatement.setString(1, product.getIdMerchant());
        callableStatement.setString(2, product.getProductName());
        callableStatement.setString(3, product.getProductImg());
        callableStatement.setInt(4, product.getWaitTime());
        callableStatement.setDouble(5, product.getPrice());
        callableStatement.setString(6, product.getNote());
        callableStatement.setDouble(7, product.getSale());
        callableStatement.setDouble(8, product.getServiceFee());
        callableStatement.executeQuery();
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(UPDATE_PRODUCT_QUERY);
        callableStatement.setString(1,product.getIdProduct());
        callableStatement.setString(2,product.getProductName());
        callableStatement.setString(3,product.getProductImg());
        callableStatement.setInt(4,product.getWaitTime());
        callableStatement.setDouble(5,product.getPrice());
        callableStatement.setString(6,product.getNote());
        callableStatement.setDouble(7,product.getSale());
        callableStatement.setDouble(8,product.getServiceFee());
        callableStatement.executeUpdate();
        return true;
    }

    @Override
    public boolean deleteProduct(String idProduct) throws SQLException, ClassNotFoundException {
        boolean rowUpdated;
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(DELETE_PRODUCT_QUERY);
        callableStatement.setString(1, idProduct);

        rowUpdated = callableStatement.executeUpdate() > 0;

        return true;
    }

    @Override
    public List<Product> getAllProductByIdMerchant(String idMerchant) throws SQLException, ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(GET_ALL_PRODUCT_BY_ID_MERCHANT);
        callableStatement.setString(1, idMerchant);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            String idProduct = resultSet.getString("idProduct");
            String productName = resultSet.getString("productName");
            String productImg = resultSet.getString("productImg");
            int waitTime = resultSet.getInt("waitTime");
            double price = resultSet.getDouble("price");
            String note = resultSet.getString("note");
            double sale = resultSet.getDouble("sale");
            double serviceFee = resultSet.getDouble("serviceFee");
            int view = resultSet.getInt("view");
            int orders = resultSet.getInt("orders");
            productList.add(new Product(idProduct, productName, productImg, waitTime, price, note, sale, serviceFee, view, orders));
        }
        return productList;
    }

    @Override
    public List<Product> searchProductByName(String idMerchant, String keyword) throws SQLException, ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall("{call SEARCH_MERCHANT_PRODUCT(?,?)}");
        callableStatement.setString(1, idMerchant);
        callableStatement.setString(2, keyword);
        ResultSet resultSet = callableStatement.executeQuery();

        while (resultSet.next()) {
            String idProduct = resultSet.getString("idProduct");
            String productName = resultSet.getString("productName");
            String productImg = resultSet.getString("productImg");
            int waitTime = resultSet.getInt("waitTime");
            double price = resultSet.getDouble("price");
            String note = resultSet.getString("note");
            double sale = resultSet.getDouble("sale");
            double serviceFee = resultSet.getDouble("serviceFee");
            int view = resultSet.getInt("view");
            int orders = resultSet.getInt("orders");
            productList.add(new Product(idProduct, productName, productImg, waitTime, price, note, sale, serviceFee, view, orders));
        }
        return productList;
    }

    public List<Product> searchProductByName(String name) throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<Product>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(SEARCH_BY_NAME);
        callableStatement.setString(1, name);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            String idProduct = resultSet.getString("idProduct");
            String productName = resultSet.getString("productName");
            String productImg = resultSet.getString("productImg");
            int waitTime = resultSet.getInt("waitTime");
            double price = resultSet.getDouble("price");
            double sale = resultSet.getDouble("sale");
            String address = resultSet.getString("address");
            products.add(new Product(idProduct, productName, productImg, waitTime,price,sale,address));
        }
        return products;
    }

    public List<Product> searchProductByTag(String tag) throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<Product>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(SEARCH_PRODUCT_BY_TAG);
        callableStatement.setString(1, tag);
        ResultSet resultSet = callableStatement.executeQuery();

        while (resultSet.next()) {
            String idProduct = resultSet.getString("idProduct");
            String productName = resultSet.getString("productName");
            String productImg = resultSet.getString("productImg");
            int waitTime = resultSet.getInt("waitTime");
            double price = resultSet.getDouble("price");
            double sale = resultSet.getDouble("sale");
            String address = resultSet.getString("restaurantAddress");
            products.add(new Product(idProduct, productName, productImg, waitTime, price, sale,address));
        }
        return products;
    }
}
