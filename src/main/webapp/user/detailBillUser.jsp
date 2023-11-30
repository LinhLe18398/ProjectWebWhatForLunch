<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phamh
  Date: 11/20/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhatForLunch</title>
    <link href="/user/detailBillUser.css" type="text/css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div class="header container">
    <div class="overlay"></div>
    <div class="navbar">
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
             style="background-color: rgb(255,255,255,0) !important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="/users?action=home" style="color: white; font-size: 20px">Trang chủ</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 620px">
                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: white; font-size: 20px">
                                Nhà hàng
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/users?action=comfirmpassword">Chuyển sang
                                    nhà hàng của tôi</a></li>
                            </ul>
                        </li>


                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: white; font-size: 20px">${user.name}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông
                                    tin</a></li>
                                <li><a class="dropdown-item" href="/users?action=merchant">Đăng ký quán</a>
                                </li>
                                <li><a class="dropdown-item" href="/display/billUser.jsp">Đơn đã đặt</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li><a class="dropdown-item" href="/users?action=logout">Đăng xuất</a></li>

                            </ul>
                        </li>

                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link" href="/products?action=cart" role="button" aria-expanded="false"
                               style="color: white; font-size: 19px">
                                Giỏ hàng
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="bill container"
     style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px;  width: auto; margin-top: 30px">
    <div class="header-bill">
        <div class="detail-return">
            <a href="/bill?action=bill-user" id="d"><i class="fa fa-chevron-left icons"></i> Trở lại</a>
        </div>

        <div class="detail-status">
            <input type="hidden" id="inputStatus" value="<c:out value="${billUser.getBillStatus()}"/>">
            <ul id="my-ul" class="progressbar">
                <li>Chờ nhận hàng</li>
                <li>Đang chế biến</li>
                <li>Đã nhận món</li>
                <li>Đang giao</li>
                <li>Đã hoàn thành</li>
            </ul>
        </div>
    </div>
</div>

<div class="bill container"
     style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px;  width: auto; margin-top: 30px">
    <div class="header-bill">
        <div class="detail-time-address">
            <div class="detail-address">
                <h2>Địa chỉ nhận hàng</h2>
                <p style="font-size: 20px"><c:out value="${billUser.getRecipientName()}"/></p>
                <span class="detail-sp" id="phoneNumber"><c:out value="${billUser.getRecipientPhone()}"/></span><br>
                <span class="detail-sp"><c:out value="${billUser.getRecipientAddress()}"/></span>
            </div>
            <div class="detail-time">
                <h2>Thời gian nhận hàng</h2>
                <span class="detail-tm">Thời gian đặt</span>&emsp;
                &emsp;&nbsp;<span class="detail-sp-tm" id="timeStart"><c:out value="${billUser.getTimeOrder()}"/></span><br>
                <span class="detail-tm">Thời gian dự kiến </span>
                <span class="detail-sp-tm" id="timeEnd"><c:out value="${billUser.getTimeWait()}"/></span>
            </div>
        </div>
    </div>
</div>

<div class="bill container"
     style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px;  width: auto; margin-top: 30px">
    <div class="header-bill">
        <div style="background-color: orangered; width: 70px;padding-top: 1px ;margin-top: 15px; float: left; height: 25px; margin-left: 30px">
            <p style="color: white; font-size: 14px; text-align: center">Nhà hàng</p>
        </div>
        <div style="margin-top: 15px; float: left; margin-left: 30px">
            <p style="font-weight: bold;">${billUser.getRestaurantName()}</p>
        </div>
        <div style="background-color: orangered; width: 70px ;margin-top: 15px; float: left; height: 25px; margin-left: 30px">
            <p style="color: white; font-size: 14px; text-align: center">Phục vụ</p>
        </div>
        <div style="justify-content: flex-end; padding-top: 15px; padding-right:25px;display: flex; height: 25px; margin-left: 30px">
            <p p style="color: red; font-size: 30px; ">${billUser.getBillStatus()}</p>
        </div>
    </div>
    <hr style="margin-top:35px; color: black;">
    <c:forEach items="${billUser.getProductList()}" var="listProduct">
        <div class="content-bill" style="margin-top: 20px; display: flex">
            <div class="image-bill" style="float: left">
                <img style="width: 160px; height: 134px;" src="${listProduct.getProductImg()}" alt="">
            </div>
            <div style="float: left; margin-left: 20px; margin-top: 20px">
                <p style="font-size: 20px">${listProduct.getProductName()}</p>
                <p style="font-size: 20px; color: grey">Phân loại đồ ăn: ${listProduct.getNote()}</p>
                <p style="font-size: 18px">X ${listProduct.getQuantity()}</p>
                <p class="price"
                   style="font-size: 20px;margin-top: -44px ;margin-left: 945px; color: grey; text-decoration-line: line-through">${listProduct.getPrice()}</p>
                <p class="price"
                   style="font-size: 20px;margin-top: -41px ;margin-left: 1030px; color: orangered">${listProduct.getPrice()-listProduct.getSale()}</p>
            </div>
        </div>
    </c:forEach>
    <hr style="color: black">

    <div class="footer-bill">
        <div class="detail-summary">
            <div class="order-item">
                <span class="item-label">Tổng tiền hàng:</span>
                <span class="item-value price"><c:out value="${billUser.getTotalPrice()}"/></span>
            </div>
            <div class="order-item">
                <span class="item-label">Phí giao hàng:</span>
                <span class="item-value price"><c:out value="0"/></span>
            </div>
            <div class="order-item">
                <span class="item-label">Phí dịch vụ:</span>
                <span class="item-value price"><c:out value="${billUser.getTotalService()}"/></span>
            </div>
            <div class="order-item">
                <span class="item-label">Giảm giá:</span>
                <span class="item-value price"><c:out value="${billUser.getTotalSale()}"/></span>
            </div>
        </div>
        <div class="detail-total">
            <div class="order-item">
                <p class="item-label">Thành tiền:</p>
                <p class="item-value price"><c:out value="${billUser.getFinalTotal()}"/></p>
            </div>
            <div class="order-item">
                <span class="item-label">Phương thức thanh toán: </span>
                <span class="item-value"><c:out value="${billUser.getPaymentMethod()}"/></span>
            </div>
        </div>
    </div>
</div>



</body>
<script>
    $(document).ready(function () {
        $(".profile p").click(function () {
            $(".profile-div").toggle();

        });
        $(".noti-icon").click(function () {
            $(".notification-div").toggle();
        });
    });

    let liElements = document.querySelectorAll("#my-ul li");
    let status = document.getElementById("inputStatus").value;
    for (let i = 0; i < liElements.length; i++) {
        let li = liElements[i];
        let liElement = li.textContent;
        li.classList.add("complete");
        if (liElement == "Chờ nhận hàng" &&
            (status == "Nhà hàng từ chối đơn" || status == "Khách hàng huỷ đơn")) {
            if (status == "Khách hàng huỷ đơn") {
                li.innerHTML = "Đơn đã huỷ";
                li.style.color = "red";
            } else {
                li.innerHTML = status;

            }
            break;
        }

        if (liElement == status) {
            li.classList.remove("complete");
            li.classList.add("active");
            break;
        }
    }

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber+"₫";
    }

    function approveStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 2;
        location.reload();
    }

    //Xử lí đối tượng DOM
    function formatNumberPhone() {
        let numberElement = document.getElementById("phoneNumber");
        let number = numberElement.textContent;
        let del_number = number.replace('84', '');
        numberElement.textContent = "(+84)" + del_number;
    }

    formatNumberPhone();

    //Tính thời gian giao hàng dự kiến
    function formatTimeDelivery() {
        const timeStart = document.getElementById("timeStart");
        const timeEnd = document.getElementById("timeEnd");
        const timeString = timeStart.textContent.replace(" ", "T");
        const time = new Date(timeString);
        time.setMinutes(time.getMinutes() + Number(timeEnd.textContent));
        time.setHours(time.getHours() + 7);
        const updatedTimeString = time.toISOString().replace("T", " ").replace(".000Z", "");
        timeEnd.textContent = updatedTimeString;
    }

    formatTimeDelivery();

    function declineStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 0;
    }
</script>
</html>