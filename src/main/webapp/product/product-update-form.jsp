<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 28/10/2023
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WhatForLunch</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

</head>
<style>
    /*@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");*/
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
    }

    body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        background-image: url("https://static.vecteezy.com/system/resources/previews/016/030/491/non_2x/top-view-of-traditional-korean-food-on-a-table-illustration-delicious-korean-bbq-grill-with-all-small-side-dishes-set-beef-and-pork-korean-barbecue-asian-food-background-vector.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }

    .container {
        position: relative;
        max-width: 700px;
        width: 100%;
        background: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    .container header {
        font-size: 1.5rem;
        color: #333;
        font-weight: 500;
        text-align: center;
    }

    .container .form {
        margin-top: 30px;
    }

    .form .input-box {
        width: 100%;
        margin-top: 20px;
    }

    .input-box label {
        color: #333;
    }

    .form :where(.input-box input, .select-box) {
        position: relative;
        height: 50px;
        width: 100%;
        outline: none;
        font-size: 1rem;
        color: #707070;
        margin-top: 8px;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 0 15px;
    }

    .input-box input:focus {
        box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
    }

    .form .column {
        display: flex;
        column-gap: 15px;
    }

    .form .gender-box {
        margin-top: 20px;
    }

    .gender-box h3 {
        color: #333;
        font-size: 1rem;
        font-weight: 400;
        margin-bottom: 8px;
    }

    .form :where(.gender-option, .gender) {
        display: flex;
        align-items: center;
        column-gap: 50px;
        flex-wrap: wrap;
    }

    .form .gender {
        column-gap: 5px;
    }

    .overlay {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.1);
        pointer-events: none;
    }

    .gender input {
        accent-color: rgb(130, 106, 251);
    }

    .form :where(.gender input, .gender label) {
        cursor: pointer;
    }

    .gender label {
        color: #707070;
    }

    .address :where(input, .select-box) {
        margin-top: 15px;
    }

    .select-box select {
        height: 100%;
        width: 100%;
        outline: none;
        border: none;
        color: #707070;
        font-size: 1rem;
    }

    .form button {
        height: 55px;
        width: 100%;
        color: #fff;
        font-size: 1rem;
        font-weight: 400;
        margin-top: 30px;
        border: none;
        cursor: pointer;
        transition: all 0.2s ease;
        background: rgb(130, 106, 251);
    }

    .form button:hover {
        background: rgb(88, 56, 250);
    }

    /*Responsive*/
    @media screen and (max-width: 500px) {
        .form .column {
            flex-wrap: wrap;
        }

        .form :where(.gender-option, .gender) {
            row-gap: 15px;
        }
    }
</style>
<body>
<div class="overlay"></div>
<section class="container">
    <header>Sửa món ăn</header>
    <form action="/products?action=update-product" method="post" class="form">
        <input type="hidden" name="product_id" value="${product.getIdProduct()}">
        <div class="input-box">
            <label>Tên món ăn</label>
            <input id="product_name" name="product_name"
                   required="" value="${product.getProductName()}" type="text">
        </div>

        <div class="input-box">
            <label>Ảnh</label>
            <input name="product_image"
                   required="" value="${product.getProductImg()}" type="text"/>
        </div>

        <div class="column">
            <div class="input-box">
                <label>Thời gian</label>
                <input name="product_waiTime" value="${product.getWaitTime()}"
                       required="" type="number"/>
            </div>
            <div class="input-box">
                <label>Giá tiền</label>
                <input id="product_price" name="product_price"
                       value="${product.getPrice()}" type="number"/>
            </div>
        </div>
        <div class="input-box address">
            <label>Ghi chú</label>
            <input id="product_description" name="product_note" value="${product.getNote()}"/>
        </div>
        <div class="column">
            <div class="input-box">
                <label>Tiền giảm giá</label>
                <input id="sale" name="product_sale"
                       required="" value="${product.getSale()}" type="number"/>
            </div>
            <div class="input-box">
                <label>Tiền dịch vụ</label>
                <input  id="stock_alert" name="product_serviceFee"
                        required=""  value="${product.getServiceFee()}" type="text"/>
            </div>
        </div>
        <button>Sửa món ăn</button>
        <a href="/products?action=home-merchant" style="text-decoration: none;width: 100%;margin-top: 3px"
           class="btn btn-outline-primary">Trở về</a>
    </form>
</section>
</body>
</html>