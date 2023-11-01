
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
  <link href="/home/merchantHome.css" type="text/css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Document</title>
</head>
<body>
<div id="mySidenav" class="sidenav">
  <p class="logo">M-SoftTech <span class="menu">☰</span></p>
  <p class="logo1"> <span class="menu1">☰</span></p>
</div>
<div id="main">
  <div class="head">
    <div class="col-div-6">
      <p class="nav"> Dashboard</p>
    </div>
    <div class="col-div-6">
      <div class="profile">
        <img src="/Login_Register/thaothan.jpg" class="pro-img" />
        <p><i class="fa fa-ellipsis-v dots" aria-hidden="true"></i></p>
        <div class="profile-div">
          <p><i class="fa fa-user" ><a style="text-decoration: none;" href="#"> Profile</a></i></p>
          <p><i class="fa fa-power-off"><a style="text-decoration: none;" href="#"> Log Out</a></i></p>
          <p><a style="text-decoration: none;" href="/users?action=home">&#8592; switch user</a></p>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>

  <div class="clearfix"></div>
  <br />

  <div class="col-div-12">
    <div class="box">
      <form action="/products?action=search" method="post">
        <div class="s007">
          <div class="icon-wrap">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="20" height="20" viewBox="0 0 20 20">
              <path
                      d="M18.869 19.162l-5.943-6.484c1.339-1.401 2.075-3.233 2.075-5.178 0-2.003-0.78-3.887-2.197-5.303s-3.3-2.197-5.303-2.197-3.887 0.78-5.303 2.197-2.197 3.3-2.197 5.303 0.78 3.887 2.197 5.303 3.3 2.197 5.303 2.197c1.726 0 3.362-0.579 4.688-1.645l5.943 6.483c0.099 0.108 0.233 0.162 0.369 0.162 0.121 0 0.242-0.043 0.338-0.131 0.204-0.187 0.217-0.503 0.031-0.706zM1 7.5c0-3.584 2.916-6.5 6.5-6.5s6.5 2.916 6.5 6.5-2.916 6.5-6.5 6.5-6.5-2.916-6.5-6.5z">
              </path>
            </svg>
          </div>
          <input type="text" id="search" name="search" placeholder="Search..." />
          <button type="submit" class="btn-search" >Search</button>
        </div>
      </form>
    </div>
  </div>

  <div class="clearfix"></div><br />
  <div class="col-div-12">
    <div class="content-box">
      <p> Category Selling food
        <span>
                        <button class="ip-add" type="submit" ><a style="text-decoration: none" href="/products?action=create-product">+Add</a></button>
                        <button class="ip-selectAll" type="submit"><a style="text-decoration: none" href="/products?action=home-merchant">Select All</a></button>
                </span>
      </p>
      <br />
      <table>
        <thead>
        <tr>
          <th>Món ăn</th>
          <th>Thời gian chờ</th>
          <th>Giá</th>
          <th>Mức hạ giá</th>
          <th>Phí dịch vụ</th>
          <th>Lượt xem</th>
          <th>Số đơn</th>
          <th>Note</th>
          <th>Tools</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="list">
          <tr>
            <td>
              <img width="100" src="${list.productImg}" alt="${list.getProductName()}">
              <p style="font-size: 10px">${list.getProductName()}</p>
            </td>
            <td>${list.waitTime}</td>
            <td>${list.price}</td>
            <td>${list.sale}</td>
            <td>${list.serviceFee}</td>
            <td>${list.view}</td>
            <td>${list.orders}</td>
            <td>${list.note}</td>
            <td style="text-align: center;">
              <button class="ip-update" type="submit" ><a style="text-decoration: none" href="/products?action=update-product&id=${list.idProduct}">Update</a></button>
              <button class="ip-delete" type="submit"><a style="text-decoration: none" href="/products?action=delete-product&id=${list.idProduct}">Delete</a></button>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</html>
<script>

  $(".menu").click(function () {
    $("#mySidenav").css('width', '70px');
    $("#main").css('margin-left', '70px');
    $(".logo").css('display', 'none');
    $(".logo1").css('display', 'block');
    $(".logo span").css('visibility', 'visible');
    $(".logo span").css('margin-left', '-10px');
    $(".icon-a").css('visibility', 'hidden');
    $(".icon-a").css('height', '25px');
    $(".icons").css('visibility', 'visible');
    $(".icons").css('margin-left', '-8px');
    $(".menu1").css('display', 'block');
    $(".menu").css('display', 'none');
  });

  $(".menu1").click(function () {
    $("#mySidenav").css('width', '300px');
    $("#main").css('margin-left', '300px');
    $(".logo").css('visibility', 'visible');
    $(".logo").css('display', 'block');
    $(".icon-a").css('visibility', 'visible');
    $(".icons").css('visibility', 'visible');
    $(".menu").css('display', 'block');
    $(".menu1").css('display', 'none');
  });

  $(document).ready(function () {
    $(".profile p").click(function () {
      $(".profile-div").toggle();

    });
    $(".noti-icon").click(function () {
      $(".notification-div").toggle();
    });

  });
</script>