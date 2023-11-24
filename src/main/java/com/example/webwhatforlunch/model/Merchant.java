package com.example.webwhatforlunch.model;


public class Merchant {
    private int idUser;
    private String idMerchant;
    private String restaurantName;
    private String numberPhone;
    private String email;
    private String address;
    private String password;
    private String status;

    public Merchant(int idUser, String name, String email, String phoneNumber, String address) {
        this.idUser = idUser;
        this.restaurantName = name;
        this.email = email;
        this.numberPhone = phoneNumber;
        this.address = address;
    }

    public Merchant(int idUser, String idMerchant, String restaurantName, String numberPhone, String email, String address, String status) {
        this.idUser = idUser;
        this.idMerchant = idMerchant;
        this.restaurantName = restaurantName;
        this.numberPhone = numberPhone;
        this.email = email;
        this.address = address;
        this.status = status;
    }

    public Merchant() {
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

    public void setIdMerchant(String idMerchant) {
        this.idMerchant = idMerchant;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
