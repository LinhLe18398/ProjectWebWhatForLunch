package com.example.webwhatforlunch.model;

import java.util.List;

public class Bill {
    private int idBill;
    private int idUser;
    private String timeOrder;
    private String deliveryTime;
    private String restaurantName;
    private String restaurantAddress;
    private String recipientName;
    private String recipientAddress;
    private String recipientPhone;
    private List<Product> productList;
    private int sale;
    private int serviceFee;
    private int total;


    public Bill(int idBill, String timeOrder, String deliveryTime, String restaurantName, String restaurantAddress, String recipientName, String recipientAddress, String recipientPhone, List<Product> productList, int sale, int serviceFee, int total) {
        this.idBill = idBill;
        this.timeOrder = timeOrder;
        this.deliveryTime = deliveryTime;
        this.restaurantName = restaurantName;
        this.restaurantAddress = restaurantAddress;
        this.recipientName = recipientName;
        this.recipientAddress = recipientAddress;
        this.recipientPhone = recipientPhone;
        this.productList = productList;
        this.sale = sale;
        this.serviceFee = serviceFee;
        this.total = total;
    }

    public Bill(int idBill, int idUserDB, String idMerchant, String recipientName, String recipientPhone, String recipientEmail, String recipientAddress, String paymentMethod, String billStatus, String timeOrder, String restaurantName, String restaurantAddress, List<Product> product) {
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public String getTimeOrder() {
        return timeOrder;
    }

    public void setTimeOrder(String timeOrder) {
        this.timeOrder = timeOrder;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getRestaurantAddress() {
        return restaurantAddress;
    }

    public void setRestaurantAddress(String restaurantAddress) {
        this.restaurantAddress = restaurantAddress;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress;
    }

    public String getRecipientPhone() {
        return recipientPhone;
    }

    public void setRecipientPhone(String recipientPhone) {
        this.recipientPhone = recipientPhone;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(int serviceFee) {
        this.serviceFee = serviceFee;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
