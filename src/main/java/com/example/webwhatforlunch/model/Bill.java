package com.example.webwhatforlunch.model;

import java.util.List;

public class Bill {
    private int idBill;
    private int idUser;
    private final String idMerchant;
    private String timeOrder;
    private String deliveryTime;
    private String restaurantName;
    private String restaurantAddress;
    private String recipientName;
    private String recipientAddress;
    private String recipientPhone;
    private final String billStatus;
    private final String paymentMethod;
    private List<Product> productList;
    private int sale;
    private int serviceFee;

    public Bill(int idBill, int idUserDB, String idMerchant, String recipientName, String recipientPhone, String recipientAddress, String paymentMethod, String billStatus, String timeOrder, String restaurantName, String restaurantAddress, List<Product> productList) {
        this.idBill = idBill;
        this.idUser = idUserDB;
        this.idMerchant = idMerchant;
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.recipientAddress = recipientAddress;
        this.paymentMethod = paymentMethod;
        this.billStatus = billStatus;
        this.timeOrder = timeOrder;
        this.restaurantName = restaurantName;
        this.restaurantAddress = restaurantAddress;
        this.productList = productList;
    }
    @Override
    public String toString() {
        String toString = "";
        toString += idBill + "/" + idUser + "/" + idMerchant + "/" + recipientName + "/" + recipientPhone + "/" + recipientAddress + "/" + billStatus + "/" + timeOrder + "/" + restaurantName + "/" + restaurantAddress;
        for (Product product : productList) {
            toString += "/" + product.toString();
        }
        return toString;
    }


    public int getTotalPrice() {
        int total = 0;
        for (Product product : productList) {
            total += product.getPrice() * product.getQuantity();
        }
        return total;
    }

    public int getTotalSale() {  //Tổng giảm giá
        int totalSale = 0;
        for (Product product : productList) {
            totalSale += product.getSale() * product.getQuantity();
        }
        return totalSale;
    }

    public int GetTotalQuantity() { //Tổng số lượng sản phẩm
        int totalProduct = 0;
        for (Product product : productList) {
            totalProduct += product.getQuantity();
        }
        return totalProduct;
    }

    public int getTotalService() {  //Tổng dịch vụ
        int totalService = 0;
        for (Product product : productList) {
            totalService += product.getServiceFee() * product.getQuantity();
        }
        return totalService;
    }

    public int getTimeWait() {
        int totalWaitTime = 0;
        for (Product product : productList) {
            totalWaitTime += product.getWaitTime();
        }
        return totalWaitTime;
    }
    public int getFinalTotal() { //Tổng tiền phải trả
        return getTotalPrice() + getTotalService() - getTotalSale();
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

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getIdMerchant() {
        return idMerchant;
    }

    public String getBillStatus() {
        return billStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }
}
