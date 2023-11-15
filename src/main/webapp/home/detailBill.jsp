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
            <form action="/products?action=search" method="post">
                <div class="ab box search">
                    <div class="search-box">
                        <input type="text" name="keyword" class="search-input "/>
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

    <div class="clearfix"></div>
    <br/>
    <div class="clearfix"></div>
    <br/>


    <div class="cb box">
        <div class="col-div-12">
            <div class="content-box">
                <div class="form-detail">
                    <div class="detail-return">
                        <a href="#" id="d" onclick="listClick(this.id)"><i class="fa fa-chevron-left icons"></i> Trở lại</a>
                    </div>

                    <div class="detail-status">
                        <ul class="progressbar">
                            <li class="complete">Chờ nhận hàng</li>
                            <li class="complete">Đang chế biến</li>
                            <li class="complete">Đã nhận món</li>
                            <li class="complete">Đang giao</li>
                            <li class="active">Đã hoàn thành</li>
                        </ul>
                    </div>

                    <hr>

                    <div class="detail-cancel-order">
                        <button class="dt-cancel-order"
                                type="submit"><a style="text-decoration: none"href="/products?action=home-merchant">Huỷ đơn hàng</a></button>
                    </div>

                    <hr>
                    <c:set value="${bill.getRecipientName}"/>
                    <div class="detail-time-address">
                        <div class="detail-address">
                            <h2>Địa chỉ nhận hàng</h2>
                            <p></p>
                            <span class="detail-sp">(+84)Số điện thoại</span><br>
                            <span class="detail-sp">Địa chỉ</span>
                        </div>
                        <div class="detail-time">
                            <h2>Thời gian nhận hàng</h2>
                            <p>Thời gian đặt</p><span class="detail-sp time">Thời gian đặt</span>
                            <p>Thời dự kiến </p><span class="detail-sp time">Thời gian dự kiến</span>
                        </div>
                    </div>

                    <hr>


                    <div class="detail-orders">
                        <h3 class="detail-h3">MÃ ĐƠN HÀNG.</h3>
                        <hr>
                        <div class="detail-order">
                            <img src="#">
                            <div class="infor-product">
                                <h3>Tên sản phẩm</h3>
                                <p>Phân loại hàng</p>
                                <p>x Số lượng</p>
                            </div>
                            <div class="price-product">
                                <span class="price-sale">₫Giá gốc</span>
                                <span class="price-simple">₫Đơn giá</span>
                            </div>
                        </div>

                    </div>
                    <div class="detail-money-bill">
                        <div class="detair-summary">
                            <div class="order-item">
                                <span class="item-label">Tổng tiền hàng:</span>
                                <span class="item-value">1,000,000 VND</span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phí giao hàng:</span>
                                <span class="item-value">50,000 VND</span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phí dịch vụ:</span>
                                <span class="item-value">20,000 VND</span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Giảm giá:</span>
                                <span class="item-value">-100,000 VND</span>
                            </div>
                        </div>
                        <div class="detail-total">
                            <div class="order-item">
                                <h3 class="item-label">Thành tiền:</h3>
                                <h3 class="item-value">-100,000 VND</h3>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phương thức thanh toán:</span>
                                <span class="item-value">50,000 VND</span>
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


    function listClick(id) {
        var idDiv = id;
        var myElement = document.getElementsByClassName("box");
        for (var i = 0; i < myElement.length; i++) {
            myElement[i].style.display = "none";
        }
        myElement = document.getElementsByClassName(idDiv + "b");
        for (var i = 0; i < myElement.length; i++) {
            myElement[i].style.display = "flex";
        }

    }

    function changeColor(buttonIndex) {
        var buttons = document.getElementsByClassName('group-button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].classList.remove('active');
        }

        buttons[buttonIndex].classList.add('active');

        // Lấy thẻ tbody
        var tbody = document.querySelector("#table-order tbody");
        var rows = tbody.getElementsByTagName("tr");
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            row.style.display = "none";
        }

        var trList = document.querySelectorAll("#table-order tr");

        var sumOrder = trList.length - 1;

        for (var i = 1; i < trList.length; i++) {
            var tr = trList[i];
            var td = tr.querySelector("#table-order tbody td:nth-child(5)");
            var cellValue = td.textContent;

            tr.style.display = "";


            if (buttonIndex == 0) {
                tr.style.display = "";
            }

            if (buttonIndex == 1 && cellValue !== "Chờ nhận hàng") {
                tr.style.display = "none";
                sumOrder--;
            }

            if (buttonIndex == 2 && cellValue !== "Đang chế biến") {
                tr.style.display = "none";
                sumOrder--;
            }

            if (buttonIndex == 3 && cellValue !== "Đã nhận món") {
                tr.style.display = "none";
                sumOrder--;
            }

            if (buttonIndex == 4 && cellValue !== "Đang giao") {
                tr.style.display = "none";
                sumOrder--;
            }

            if (buttonIndex == 5 && cellValue !== "Đã hoàn thành") {
                tr.style.display = "none";
                sumOrder--;
            }

            if (buttonIndex == 6 && cellValue !== "Huỷ") {
                tr.style.display = "none";
                sumOrder--;
            }

            document.getElementById("sum-order").textContent = sumOrder + " Đơn hàng";
        }


    }


    var statusCells = document.querySelectorAll("#table-order tbody td:nth-child(5)");
    statusCells.forEach(function (cell) {
        var status = cell.textContent.trim();
        switch (status) {
            case "Chờ nhận hàng":
                cell.style.color = "brown";
                break;
            case "Đang chế biến":
                cell.style.color = "orange";
                break;
            case "Đã nhận món":
                cell.style.color = "purple";
                break;
            case "Đang giao":
                cell.style.color = "blue";
                break;
            case "Đã hoàn thành":
                cell.style.color = "green";
                break;
            case "Huỷ":
                cell.style.color = "red";
                break;
        }
    });

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber+"₫";
    }
    function declineStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 0;
        location.reload();
    }
    function approveStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 1;
        location.reload();
    }
</script>

</html>
