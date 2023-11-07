<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 24/10/2023
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/home/merchantHome.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
</head>
<body>

<div class="mySidenav">
    <p class="logo1"><span class="menu1">☰</span></p>
    <!-- <a href="#" class="icon-a"><i class="fa fa-user icons"></i> Account</a>
    <a href="#" class="icon-a"><i class="fa fa-home icons"></i> Home</a>
    <a href="#" class="icon-a"><i class="fa fa-gear icons"></i> Setting</a>
    <a href="#" class="icon-a"><i class="fa fa-sign-out icons"></i> Logout</a> -->
</div>
<div id="main">

    <div class="constructor">
        <div class="item item1">
            <p class="nav"> WhatForLunch?</p>

        </div>

        <div class="item item2">
            <form action="/products?action=search" method="post">
                <div class="search">
                    <div class="search-box">
                        <input type="text" class="search-input"/>
                        <button class="search-btn" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>


        <div class="item item3">
            <div class="notification-div">
                <hr class="hr"/>
            </div>
            <div class="profile">
                <img src="https://demoda.vn/wp-content/uploads/2022/09/avatar-facebook-doc-ff.jpg" class="pro-img"/>
                <p class="profile-name">${merchant1.restaurantName}<i class="fa fa-ellipsis-v dots"
                                                                      aria-hidden="true"></i></p>
                <div class="profile-div">
                    <%--          <p><i class="fa fa-user "><a href="/merchants?action=profile"> Profile</a></i></p>--%>
                    <%--          <p><i class="fa fa-cogs "><a href="/merchants?action=setting"> Settings</a></i></p>--%>
                    <p><i class="fa fa fa-sign-out "><a href="/users?action=home"> Log Out</a></i></p>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
    <br/>
    <div class="clearfix"></div>
    <br/>
    <div class="col-div-12">
        <div class="content-box">
            <p class="list"> Category Selling food
                <span>
          <button class="ip-add" type="submit"><a style="text-decoration: none" href="/products?action=create-product">+Add</a></button>
          <button class="ip-selectAll" type="submit"><a style="text-decoration: none"
                                                        href="/products?action=home-merchant">Select All</a></button>
        </span>
            </p>
            <br/>
            <table>
                <thead>
                <tr>
                    <th>Food</th>
                    <th>Price</th>
                    <th>Wait Time</th>
                    <th>Tags</th>
                    <th>View</th>
                    <th>Order</th>
                    <th>Note</th>
                    <th>Tools</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="list">
                    <tr>
                        <td class="food-item">
                            <img src="${list.productImg}">
                            <p>${list.productName}</p>
                        </td>
                        <td class="food-price">
                            <p>Price : ${list.price}</p>
                            <p>Sale : ${list.sale}</p>
                            <p>ServiceFee: ${list.serviceFee}</p>
                        </td>
                        <td>${list.waitTime}</td>
                        <td>${list.view}</td>
                        <td>${list.view}</td>
                        <td>${list.orders}</td>
                        <td>${list.note}</td>
                        <td style="text-align: center;">
                            <button class="ip-update" type="button"
                                    onclick="location.href='/products?action=update-product&id=${list.idProduct}'">
                                <i class="fa fa-pencil"></i>
                            </button>

                            <button class="ip-delete" type="button"
                                    onclick="location.href='/products?action=delete-product&id=${list.idProduct}'">
                                <i class="fa fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="clearfix"></div>
</div>
</body>

</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(".profile p").click(function () {
            $(".profile-div").toggle();

        });
        $(".noti-icon").click(function () {
            $(".notification-div").toggle();
        });

    });
</script>