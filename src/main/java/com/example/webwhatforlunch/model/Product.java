package com.example.webwhatforlunch.model;


public class Product {
    String idProduct;
    String idMerchant;
    String productName;
    String productImg;
    int waitTime;
    int price;
    String note;
    int sale;
    int serviceFee;
    int view;
    int orders;
    String address;
    String restaurantName;
    int quantity;

    public Product(String idProduct, String productName, String productImg, int waitTime, int price, String note, int sale) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
    }
    //controller create new product
    public Product(String productName, String productImg, int waitTime, int price, String note, int sale, int serviceFee, String idMerchant) {
        this.productName = productName;
        this.productImg = productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
        this.serviceFee = serviceFee;
        this.idMerchant = idMerchant;
    }


    public Product(String idProduct, String idMerchant, String productName, String productImg, int waitTime, int price, String note, int sale, int serviceFee, int view, int orders) {
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
    public Product(String idProduct,String idMerchant, String productName, String restaurantName, String productImg, int waitTime, int price, int sale, String address) {
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
    public Product (String idProduct, String productName, String productImg, int waitTime, int price, String note, int sale, int serviceFee){
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
    public Product(String idProduct, String productName, String productImg, int waitTime, int price, String note, int sale, int serviceFee, int view, int orders) {
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

    public Product(String idProduct, String productName, String productImg, int price, String note, int quantity) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.productImg = productImg;
        this.price = price;
        this.note = note;
        this.quantity = quantity;
     }

    public Product(String idProduct, String productName, String productImg, int waitTime, int price, String note, int sale, int serviceFee, int quantity) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.productImg =  productImg;
        this.waitTime = waitTime;
        this.price = price;
        this.note = note;
        this.sale = sale;
        this.serviceFee = serviceFee;
        this.quantity = quantity;
    }

    public Product(String idProduct, String idMerchant, String productName, String productImg, int price, String note, int quantity) {
        this.idProduct = idProduct;
        this.idMerchant = idMerchant;
        this.productName = productName;
        this.productImg = productImg;
        this.price = price;
        this.note = note;
        this.quantity = quantity;
    }


    @Override
    public String toString() {
        return idProduct + "/" + productName + "/" + waitTime + "/" + price + "/" + note + "/" + sale + "/" + serviceFee + "/" + quantity;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
