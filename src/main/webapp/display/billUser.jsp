<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 13/11/2023
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>&#128722; Thanh Toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>


<style>
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


    ::placeholder {
        color: rgb(128, 128, 128);
    }

    #button-group {
        padding: 10px 0px;
        margin-bottom: 10px;
        text-align: center;
    }

    .group-button {
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        display: inline;
        font-family: "sans-serif";
        font-weight: bold;
        font-size: 20px;
        color: darkslategray;

    }

    .group-button.active {
        color: orange;
        border-bottom: 2px solid orange;
    }

    .overlay {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.5);
        pointer-events: none;
    }


</style>
</head>
<body>

<div class="header container">
    <div class="overlay"></div>
    <div class="navbar" style="margin-left: 600px">
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
             style="background-color: rgb(255,255,255,0) !important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="/users?action=home" style="color: white; font-size: 20px">Trang
                    chủ</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
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
                               style="color: white; font-size: 20px">
                                ${user.name}
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

<%--<div class="container" id="button-group"--%>
<%--     style="margin-top: 30px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px">--%>

<%--    <div class="group-button" onclick="changeColor(0)">Tất cả</div>--%>
<%--    <div class="group-button" onclick="changeColor(1)">Chờ nhận hàng</div>--%>
<%--    <div class="group-button" onclick="changeColor(2)">Đang chế biến</div>--%>
<%--    <div class="group-button" onclick="changeColor(3)">Đã nhận món</div>--%>
<%--    <div class="group-button" onclick="changeColor(4)">Đang giao</div>--%>
<%--    <div class="group-button" onclick="changeColor(5)">Đã hoàn thành</div>--%>
<%--    <div class="group-button" onclick="changeColor(6)">Huỷ</div>--%>
<%--</div>--%>


<%--<div class="search" style="margin-top: 30px; ">--%>
<%--    <div class="container"--%>
<%--         style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px">--%>
<%--        <input type="search"--%>
<%--               style="width: 1320px; height: 50px; border: thin solid grey;margin-left: -15px ; background-color: #f4f4f4 "--%>
<%--               placeholder="&#128269; Bạn có thể tìm kiếm theo tên Cửa hàng, Id đơn hàng hoặc tên Món ăn">--%>
<%--    </div>--%>

<%--</div>--%>
<form method="post" action="/bill?action=event-bill-from-user">
    <c:forEach items="${listBillUser}" var="listBillUser">
        <div class="bill container"
             style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px;  width: auto; margin-top: 30px">
            <div class="header-bill">
                <div style="background-color: orangered; width: 70px;padding-top: 1px ;margin-top: 15px; float: left; height: 25px; margin-left: 30px">
                    <p style="color: white; font-size: 14px; text-align: center">Yêu thích</p>
                </div>
                <div style="margin-top: 15px; float: left; margin-left: 30px">
                    <p style="font-weight: bold;">${listBillUser.getRestaurantName()}</p>
                </div>
                <div style="background-color: orangered; width: 70px ;margin-top: 15px; float: left; height: 25px; margin-left: 30px">
                    <p style="color: white; font-size: 14px; text-align: center">Chat</p>
                </div>
                <div style="justify-content: flex-end; padding-top: 15px; padding-right:25px;display: flex; height: 25px; margin-left: 30px">
                    <p p style="color: red; font-size: 30px; ">${listBillUser.getBillStatus()}</p>
                </div>
            </div>
            <hr style="margin-top:35px; color: black;">
            <c:forEach items="${listBillUser.productList}" var="product">
                <div class="content-bill" style="margin-top: 20px; display: flex">
                    <div class="image-bill" style="float: left">
                        <img style="width: 160px; height: 134px;" src="${product.getProductImg()}" alt="">
                    </div>
                    <div style="float: left; margin-left: 20px; margin-top: 20px">
                        <p style="font-size: 20px">${product.getProductName()}</p>
                        <p style="font-size: 20px; color: grey">Phân loại đồ ăn: ${product.getNote()}</p>
                        <p style="font-size: 18px">X ${product.getQuantity()}</p>
                        <p class="price"
                           style="font-size: 20px;margin-top: -44px ;margin-left: 900px; color: grey; text-decoration-line: line-through">${product.getPrice()}</p>
                        <p class="price"
                           style="font-size: 20px;margin-top: -44px ;margin-left: 1000px; color: orangered">${product.getPrice()-product.getSale()}</p>
                    </div>
                </div>
            </c:forEach>
            <hr style="color: black">

            <div class="footer-bill">
                <div style="display: flex; justify-content: flex-end; padding-top: 15px; padding-right:25px; height: 25px;">
                    <p style="font-size: 20px; margin-left: 10px">Thành tiền: </p>
                    <p class="price"
                       style="display:inline; font-size: 25px; font-weight: bold; color: orangered">${listBillUser.getFinalTotal()}</p>
                </div>
                <div>
                    <p style="justify-content:flex-start; color: grey; font-size: 18px">Đặt ngày ${listBillUser.getTimeOrder()}</p>
                    <div style="display: flex; justify-content: flex-end; text-align: center; padding-bottom: 10px; ">
                        <c:choose>
                            <c:when test="${listBillUser.getBillStatus() == 'Chờ nhận hàng'}">
                                <button style="display: inline; height: 45px; width: 190px; color: orangered"
                                        type="submit" class="btn btn-outline-dark"
                                        onclick="cancelBill(${listBillUser.getIdBill()})">Huỷ đơn</button>
                            </c:when>

                            <c:when test="${listBillUser.getBillStatus() == 'Huỷ' || listBillUser.getBillStatus() == 'Đã hoàn thành' }">
                                <button style="display: inline;  height: 45px; width: 190px; color: orangered"
                                        type="submit" class="btn btn-outline-dark">Mua lại</button>
                            </c:when>

                            <c:otherwise>
                                <button style="display: inline;  height: 45px; width: 190px; color: orangered"
                                        type="submit" class="btn btn-outline-dark" disabled>Đang giao</button>
                            </c:otherwise>
                        </c:choose>

                        <button style="display: inline; color: orangered; margin-left: 22px;height: 45px; width: 190px"
                                type="submit" class="btn btn-outline-dark" onclick="showDetailBill(${listBillUser.getIdBill()})">Xem chi tiết đơn</button>
                        <button style="display: inline; color: orangered; margin-left: 22px; ;height: 45px; width: 190px"
                                type="submit" class="btn btn-outline-dark">Liên hệ cửa hàng</button>
                    </div>

                </div>

            </div>
        </div>
    </c:forEach>
    <input type="text" hidden="hidden" id="idBill" name="idBill" value="">
    <input type="text" hidden="hidden" id="active" name="active" value="">
</form>


</body>

<script>
    function changeColor(buttonIndex) {
        var buttons = document.getElementsByClassName('group-button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].classList.remove('active');
        }

        buttons[buttonIndex].classList.add('active');
    }

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber + "₫";
    }

    function cancelBill(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 3;
    }

    function showDetailBill(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 4;
    }
</script>
</html>
