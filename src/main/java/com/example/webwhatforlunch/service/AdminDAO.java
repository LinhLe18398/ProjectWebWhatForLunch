package com.example.webwhatforlunch.service;

import java.sql.*;

public class AdminDAO implements AdminInterface{
    private String username = "root";

    private String password = "";




    private String jdbcURL = "jdbc:mysql://localhost:3306/WebWhatForLunch";

    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, username, password);
        return connection;
    }

    @Override
    public boolean checkAdmin(String adminEmail, String adminPassword) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        String query = "{call LOGIN(?,?)}";
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setString(1, adminEmail);
        callableStatement.setString(2, adminPassword);
        ResultSet resultSet = callableStatement.executeQuery();
        if (resultSet.next()) {
            return true;
        } else {
            return false;
        }
    }
    @Override
    public void setStatusMerchant(int id, int number) throws SQLException, ClassNotFoundException {
        Connection connection = getConnection();
        String query = "{call ACCEPT_USER_TO_MERCHANT(?,?)}";
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setInt(1, id);
        callableStatement.setInt(2, number);
        callableStatement.executeUpdate();
    }

}
