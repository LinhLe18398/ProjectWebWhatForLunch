<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phamh
  Date: 11/14/2023
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Bill</title>
</head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/home/detailBill.css" type="text/css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>Document</title>
</head>

<body>

<div class="mySidenav">
    <p class="logo1"><span class="menu1">☰</span></p>
    <a href="#" class="icon-a" id="a" onclick="listClick(this.id)"><i class="fa fa-utensils icons"></i> Quản lí sản phẩm</a>
    <a href="#" class="icon-a" id="b" onclick="listClick(this.id)"><i class="fa fa-dolly-flatbed icons"></i> Quản lí đơn</a>
    <a href="#" class="icon-a" id="c" onclick="listClick(this.id)"><i class="fa fa-eye icons"></i> Xem thông tin chi
        tiết</a>
    <a href="#" class="icon-a"><i class="fa fa-sign-out icons"></i> Logout</a>
</div>
<div id="main">

    <div class="constructor">
        <div class="item item1">
            <p class="nav"> What For Lunch?</p>

        </div>

        <div class="item item2">
        </div>


        <div class="item item3">
            <div class="notification-div">
                <hr class="hr"/>
            </div>
            <div class="profile">
                <img src="https://demoda.vn/wp-content/uploads/2022/09/avatar-facebook-doc-ff.jpg"
                     class="pro-img"/>
                <p class="profile-name"><i class="fa fa-ellipsis-v dots" aria-hidden="true"></i></p>
                <div class="profile-div">
                    <p><i class="fa fa-user "><a href="/merchants?action=profile"> Profile</a></i></p>
                    <p><i class="fa fa-cogs "><a href="/merchants?action=setting"> Settings</a></i></p>
                    <p><i class="fa fa fa-sign-out "><a href="/users?action=home"> Log Out</a></i></p>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div><br/>

    <div class="cb box">
        <div class="col-div-12">
            <div class="content-box">
                <div class="form-detail">
                    <div class="detail-return">
                        <a href="/bill?action=bill-merchant" id="d"><i class="fa fa-chevron-left icons"></i> Trở lại</a>
                    </div>

                    <div class="detail-status">
                        <input type="hidden" id="inputStatus" value="<c:out value="${bill.getBillStatus()}"/>">
                        <ul id="my-ul" class="progressbar">
                            <li>Chờ nhận hàng</li>
                            <li>Đang chế biến</li>
                            <li>Đã nhận món</li>
                            <li>Đang giao</li>
                            <li>Đã hoàn thành</li>
                        </ul>
                    </div>

                    <hr>

                    <div class="detail-cancel-order">
                        <button class="dt-cancel-order" id="dt-cancel-button"
                                type="submit"><a id="dt-cancel-a" style="text-decoration: none"href="/products?action=home-merchant">Huỷ đơn hàng</a></button>
                    </div>

                    <hr>

                    <div class="detail-time-address">
                        <div class="detail-address">
                            <h2>Địa chỉ nhận hàng</h2>
                            <p><c:out value="${bill.getRecipientName()}" /></p>
                            <span class="detail-sp">(+84)<c:out value="${bill.getRecipientPhone()}" /></span><br>
                            <span class="detail-sp"><c:out value="${bill.getRecipientAddress()}" /></span>
                        </div>
                        <div class="detail-time">
                            <h2>Thời gian nhận hàng</h2>
                            <span>Thời gian đặt</span><span class="detail-sp time"><c:out value="${bill.getTimeOrder()}" /></span><br>
                            <span>Thời gian dự kiến </span><span class="detail-sp time"><c:out value="${bill.getDeliveryTime()}"/></span>
                        </div>
                    </div>

                    <hr>


                    <div class="detail-orders">
                        <h3 class="detail-h3">MÃ ĐƠN HÀNG. <c:out value="${bill.getIdBill()}" /></h3>
                        <hr>
                        <c:forEach items="${billProduct}" var="billProduct">
                        <div class="detail-order">
                            <img src="${billProduct.getProductImg()}">
                            <div class="infor-product">
                                <h3>${billProduct.getProductName()}</h3>
                                <p>${billProduct.getNote()}</p>
                                <p>x ${billProduct.getQuantity()}</p>
                            </div>
                            <div class="price-product">
                                <span class="price-sale">₫${billProduct.getSale()}</span>
                                <span class="price-simple">₫${billProduct.getPrice()}</span>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="detail-money-bill">
                        <div class="detair-summary">
                            <div class="order-item">
                                <span class="item-label">Tổng tiền hàng:</span>
                                <span class="item-value"><c:out value="${bill.getTotalPrice()}" /></span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phí giao hàng:</span>
                                <span class="item-value"><c:out value="0"/></span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phí dịch vụ:</span>
                                <span class="item-value"><c:out value="${bill.getTotalService()}" /></span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Giảm giá:</span>
                                <span class="item-value"><c:out value="${bill.getTotalSale()}" /></span>
                            </div>
                        </div>
                        <div class="detail-total">
                            <div class="order-item">
                                <h3 class="item-label">Thành tiền:</h3>
                                <h3 class="item-value"><c:out value="${bill.getFinalTotal()}"/></h3>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phương thức thanh toán:</span>
                                <span class="item-value"><c:out value="${bill.getPaymentMethod()}"/></span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<div class="clearfix"></div>
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
        if (liElement == "Chờ nhận hàng" && status == "Huỷ") {
            li.innerHTML = "Huỷ";

            break;
        }

        if (liElement == status) {
            li.classList.remove("complete");
            li.classList.add("active");
            break;
        }
    }


    let aElement = document.getElementById("dt-cancel-a");
    let buttonElement = document.getElementById("dt-cancel-button");
    if (status == "Huỷ") {
        aElement.innerHTML = "Đơn hàng đã huỷ";
        buttonElement.disabled = true;
        aElement.disabled = true;
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



</script>

</html>
