<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 23/10/2023
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>WhatForLunch</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<style>
  @media screen and (max-width: 600px) {
    table#cart tbody td .form-control {
      width: 20%;
      display: inline !important;
    }

    .actions .btn {
      width: 36%;
      margin: 1.5em 0;
    }

    .actions .btn-info {
      float: left
    }

    .actions .btn-danger {
      float: right;
    }

    table#cart thead {
      display: none;
    }

    table#cart tbody td {
      display: block;
      padding: .6rem;
      min-width: 330px;
    }

    table#cart tbody tr td:first-child {
      background: #333;
      color: #fff;
    }

    table#cart tbody td:before {
      content: attr(data-th);
      font-weight: bold;
      display: inline-block;
      width: 8rem;
    }

    table#cart tfoot td {
      display: block;
    }

    table#cart tfoot td .btn {
      display: block;
    }
  }


  .header {
    /*display: flex;*/
    background-image: url("https://gofood.in/public/assets/webs/img/bg.png");
    background-repeat: no-repeat;
    background-size: cover;
    position: relative;
    background-color: rgb(255, 255, 255, 0.5) !important;
    padding-top: 11px;
    height: 95px;
  }

  .overlay {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.2);
    pointer-events: none;
  }
  .button-activity1{
    color: green;
    border: none;
    background-color: white;
  }
  .button-activity2{
    color: red;
    border: none;
    background-color: white;
  }
  .button-activity1:hover{
    background-color: green;
    color: white;
  }
  .button-activity2:hover{
    background-color: red;
    color: white;
  }

</style>
<body>

<div class="header container">
  <div class="overlay"></div>
  <div class="navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light"
         style="background-color: rgb(255,255,255,0) !important;">
      <div class="container-fluid">
        <a class="navbar-brand" href=""
           style="color: white; font-size: 20px; padding-top: 13px;padding-right: 950px">Trang
          chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <a class="navbar-brand" href=""
               style="color: white;font-size: 20px;padding-top: 16px">Đăng
              xuất</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</div>

<div class="container" style="padding-top: 37px">
  <h2>Danh sách đăng ký nhà hàng</h2>
  <form action="/admin?action=clickStatus" method="post">
    <table class="table" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em;margin-top: 30px">
      <tr>
        <th scope="col">MerchantId</th>
        <th scope="col">RestaurantName</th>
        <th scope="col">RestaurantEmail</th>
        <th scope="col">RestaurantPhone</th>
        <th scope="col">RestaurantAddress</th>
        <th scope="col">Status</th>
      </tr>
      <c:forEach items="${merchant}" var="merchantList">
        <tr style="height: 68.7px">
          <td>${merchantList.idMerchant}</td>
          <td>${merchantList.restaurantName}</td>
          <td>${merchantList.email}</td>
          <td>${merchantList.numberPhone}</td>
          <td>${merchantList.address}</td>
          <td>${merchantList.status}
            <div>
              <c:if test="${merchantList.status == 'wait'}">
                <button class="button-activity1" id="button1" type="submit" onclick="approveStatus(${merchantList.idUser})">&#10003;</button>
                <button class="button-activity2" id="button2" type="submit" onclick="declineStatus(${merchantList.idUser})">&#10005;</button>
              </c:if>
            </div>
          </td>
        </tr>
      </c:forEach>
      <input type="text" hidden="hidden" id="idUser" name="how" value="">
      <input type="text" hidden="hidden" id="active" name="active" value="">
    </table>
  </form>
</div>

<footer class="text-center text-lg-start bg-light text-muted">
  <section style="min-height: 80px" class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
  </section>
  <section class="" style="height: 243px">
    <div class="container text-center text-md-start mt-5">
      <div class="row mt-3">
        <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4" style="margin-left: 104px">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            <i class="fas fa-gem me-3"></i>CT CNHH 5 thành viên
          </h6>
          <p style="font-size: 16px">
            Here you can order all delicious Vietnamese dishes.
          </p>
        </div>
        <div class="col-md-2 col-lg-2 col-xl-2 text-left mb-4">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            Sản phẩm
          </h6>
          <p style="font-size: 16px">Thông tin</p>
          <p style="font-size: 16px">Trợ giúp</p>
        </div>
        <div class="col-md-3 col-lg-2 col-xl-2 text-left mb-4">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            Thành viên
          </h6>
          <p style="font-size: 16px">Ngoc Linh</p>
          <p style="font-size: 16px">Van Tuan</p>
          <p style="font-size: 16px">Cat Hai</p>
          <p style="font-size: 16px">Gia Minh</p>
          <p style="font-size: 16px">Minh Hieu</p>
        </div>
        <div class="col-md-4 col-lg-3 col-xl-3 text-left mb-md-0 mb-4">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            Liên hệ
          </h6>
          <p style="font-size: 16px">Hoài Đức - Hà Nội</p>
          <p style="font-size: 16px">
            WebWhatForLunch@gmail.com
          </p>
          <p style="font-size: 16px"> +84 88658023</p>
          <p style="font-size: 16px"> +84 38301773</p>
        </div>
      </div>
    </div>
  </section>
  <div class="text-center p-4" style="background-color: lightgray; height: 70px;font-size: 21px; text-align: center">
    © 2023 WebWhatForLunch
  </div>
</footer>

<script>
  function approveStatus(idUser) {
    document.getElementById("idUser").value = idUser;
    document.getElementById("active").value = 1;
  }

  function declineStatus(idUser) {
    document.getElementById("idUser").value = idUser;
    document.getElementById("active").value = 0;
  }
</script>
</body>
</html>