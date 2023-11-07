package com.example.webwhatforlunch.model;


public class Product {
    String idProduct;
    String idMerchant;
    String productName;
    String productImg;
    int waitTime;
    double price;
    String note;
    double sale;
    double serviceFee;
    int view;
    int orders;
    String address;
    String restaurantName;

    public Product(String idProduct,String productName,String productImg,int waitTime,double price, String note,double sale) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
    }


    public Product(String idProduct, String idMerchant, String productName, String productImg, int waitTime, double price, String note, double sale, double serviceFee, int view, int orders) {
        this.idProduct = idProduct;
        this.idMerchant = idMerchant;
        this.productName = productName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
        this.serviceFee = serviceFee;
        this.view = view;
        this.orders = orders;
    }

    // this method for user interface
    public Product(String idProduct,String idMerchant, String productName,String restaurantName, String productImg, int waitTime, double price, double sale, String address) {
        this.idProduct = idProduct;
        this.idMerchant = idMerchant;
        this.productName = productName;
        this.restaurantName = restaurantName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.sale = sale;
        this.address = address;
    }

    // this method for merchant update product
    public Product (String idProduct, String productName, String productImg, int waitTime, double price, String note, double sale, double serviceFee){
        this.idProduct = idProduct;
        this.productName = productName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
        this.serviceFee = serviceFee;
    }
    // this method get data for merchant view
    public Product(String idProduct, String productName, String productImg, int waitTime, double price, String note, double sale, double serviceFee, int view, int orders) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
        this.serviceFee = serviceFee;
        this.view = view;
        this.orders = orders;
    }


    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getIdMerchant() {
        return idMerchant;
    }

    public void setIdMerchant(String idMerchant) {
        this.idMerchant = idMerchant;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getWaitTime() {
        return waitTime;
    }

    public void setWaitTime(int waitTime) {
        this.waitTime = waitTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public double getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(double serviceFee) {
        this.serviceFee = serviceFee;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getOrders() {
        return orders;
    }

    public void setOrders(int orders) {
        this.orders = orders;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }
}
