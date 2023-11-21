package com.example.webwhatforlunch.model;

public class DeliveryAddress {
    private int idAddress;
    private int idUser;
    private String recipientName;
    private String recipientPhone;
    private String detailedAddress;

    public DeliveryAddress() {
    }

    public DeliveryAddress(int idAddress, int idU, String recipientName, String recipientPhone, String detailedAddress) {
        this.idAddress = idAddress;
        this.idUser = idU;
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.detailedAddress = detailedAddress;
    }

    public DeliveryAddress(int idAddress, String recipientName, String recipientPhone, String detailedAddress) {
        this.idAddress = idAddress;
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.detailedAddress = detailedAddress;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientPhone() {
        return recipientPhone;
    }

    public void setRecipientPhone(String recipientPhone) {
        this.recipientPhone = recipientPhone;
    }

    public String getDetailedAddress() {
        return detailedAddress;
    }

    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }
}
