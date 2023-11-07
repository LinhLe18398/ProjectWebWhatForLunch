package com.example.webwhatforlunch.service;

import com.example.webwhatforlunch.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductInterface {
    Product findProductByName(String idMerchant, String nameProduct) throws SQLException, ClassNotFoundException;
    void createProduct(Product product) throws SQLException, ClassNotFoundException;
    boolean updateProduct(Product product) throws SQLException, ClassNotFoundException;
    boolean deleteProduct(String idProduct) throws SQLException, ClassNotFoundException;
    Product getProductById(String idProduct) throws SQLException, ClassNotFoundException;
    List<Product> getAllProductByIdMerchant(String idMerchant) throws SQLException, ClassNotFoundException;
    List<Product> searchProductByName(String idMerchant,String keyword) throws SQLException, ClassNotFoundException;
    void addProductToCart(int idUser, String idProduct) throws SQLException, ClassNotFoundException;
    List<Product> getAllProductByIdUser(int idUser) throws SQLException, ClassNotFoundException;
    void updateQuantityProduct(int idUser, String idProduct, int isAdd) throws SQLException, ClassNotFoundException;
}
