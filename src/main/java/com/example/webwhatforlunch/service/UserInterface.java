package com.example.webwhatforlunch.service;

import com.example.webwhatforlunch.model.Merchant;
import com.example.webwhatforlunch.model.Product;
import com.example.webwhatforlunch.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserInterface {
    void createUser(User user) throws SQLException, ClassNotFoundException;
    User checkLoginUser(String username, String password) throws SQLException, ClassNotFoundException;
    Merchant checkLoginMerchant(int id, String password) throws SQLException, ClassNotFoundException;
    User findUserById(int id) throws SQLException, ClassNotFoundException;
    boolean updateUser(User user) throws SQLException, ClassNotFoundException;
    void requestUserToMerchant(Merchant merchant) throws SQLException, ClassNotFoundException;
    List<Product> get_All_Product() throws SQLException, ClassNotFoundException;
}
