package com.example.webwhatforlunch.service;

import java.sql.SQLException;

public interface AdminInterface {
    boolean checkAdmin(String adminEmail, String adminPassword) throws SQLException, ClassNotFoundException;

    void setStatusMerchant(int id) throws SQLException, ClassNotFoundException;
}
