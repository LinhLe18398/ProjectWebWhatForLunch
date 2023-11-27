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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>WhatForLunch</title>
</head>

<body>

<div class="mySidenav">
    <p class="logo1"><span class="menu1">☰</span></p>
    <a href="#" class="icon-a" id="a" onclick="listClick(this.id)"><i class="fa fa-utensils icons"></i> Quản lí sản phẩm</a>
    <a href="#" class="icon-a" id="b" onclick="listClick(this.id)"><i class="fa fa-dolly-flatbed icons"></i> Quản lí đơn</a>
</div>
<div id="main">

    <div class="constructor">
        <div class="item item1">
            <p class="nav" style="color: black">What For Lunch</p>

        </div>

        <div class="item item2">
            <form action="/products?action=search" method="post">
                <div class="ab box search">
                    <div class="search-box">
                        <input type="text" name="keyword" class="search-input" placeholder="Tìm kiếm món ăn"/>
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

    <div class="ab box">
        <div class="col-div-12">
            <div class="content-box">
                <p class="list"> Mặt Hàng
                    <span>
                            <button class="ip-add" type="submit"><a style="text-decoration: none"
                                                                    href="/products?action=create-product">+Thêm</a></button>
                            <button class="ip-selectAll" type="submit"><a style="text-decoration: none"
                                                                          href="/products?action=home-merchant">Quay lại</a></button>
                    </span>
                </p>
                <br/>
                <table>
                    <thead>
                    <tr>
                        <th>Món ăn</th>
                        <th>Ảnh</th>
                        <th>Giá tiền</th>
                        <th>Thời gian chờ</th>
                        <th>Tags</th>
                        <th>Lượt xem</th>
                        <th>Số đơn</th>
                        <th>Ghi chú</th>
                        <th style="width: 120px; text-align: center;">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${productList}" var="list">
                        <tr>
                            <td>${list.productName}</td>
                            <td><img style="width: 100px; height: 100px;" src="${list.productImg}"></td>
                            <td>
                                Giá sản phẩm:&nbsp;<span class="price">${list.price}</span><br>
                                Mức giảm giá:&ensp;<span class="price">${list.sale}</span><br>
                                Phí dịch vụ:&ensp;&emsp;<span class="price">${list.serviceFee}</span>
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

    <div class="bb box">
        <div class="col-div-12">
            <div class="content-box">
                <div id="button-group">
                    <div class="group-button" onclick="changeColor(0)">Tất cả</div>
                    <div class="group-button" onclick="changeColor(1)">Chờ nhận hàng</div>
                    <div class="group-button" onclick="changeColor(2)">Đang chế biến</div>
                    <div class="group-button" onclick="changeColor(3)">Đã nhận món</div>
                    <div class="group-button" onclick="changeColor(4)">Đang giao</div>
                    <div class="group-button" onclick="changeColor(5)">Đã hoàn thành</div>
                    <div class="group-button" onclick="changeColor(6)">Huỷ</div>
                </div>

                <hr>

                <div>
                    <form method="post" action="/bill?action=search-bill">
                        <div class="form-group">
                            <div class="form-search-one">

                                <input type="number" name="idBill" placeholder="Mã đơn hàng">
                                <input type="number" name="numberPhone" placeholder="Số điện thoại">
                                <input type="text" name="nameUser" placeholder="Tên khách hàng">
                            </div>
                            <div class="form-search-two">
                                <div class="form-input-four">
                                    <input class="search-sp" type="text" name="filter" placeholder="Thông tin bất kì đơn hàng">
                                    <i class="fa fa-search"></i>
                                </div>
                                <button class="sp-search reset" type="submit">Tìm kiếm</button>
                                <button class="sp-return" type="submit">Đặt lại</button>
                            </div>

                        </div>
                    </form>
                </div>

                <hr>

                <p class="list" id="sum-order"></p>

                <br/>
                <form method="post" action="/bill?action=status-bill"/>
                <table id="table-order">
                    <thead>
                    <tr>
                        <th>Thời gian đặt</th>
                        <th>Người đặt</th>
                        <th>Tổng món</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái đơn</th>
                        <th style=" text-align: center;">Thao tác đơn</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${billList}" var="billList">
                        <tr>
                            <td>${billList.getTimeOrder()}</td>
                            <td>${billList.getRecipientName()}</td>
                            <td>${billList.GetTotalQuantity()}</td>
                            <td class="price">${billList.getFinalTotal()}</td>
                            <td>${billList.getBillStatus()}</td>
                            <td style=" text-align: center;">
                                <div>
                                    <c:choose>
                                        <c:when test="${billList.getBillStatus() == 'Chờ nhận hàng'}">
                                            <button class="ip-delete" type="submit" onclick="declineStatus(${billList.idBill})">
                                                <i class="fa fa-x"></i>
                                            </button>
                                            <button class="ip-update" type="submit" onclick="approveStatus(${billList.idBill})">
                                                <i class="fa fa-check"></i>
                                            </button>
                                            <button class="ip-view" type="submit" onclick="showDetail(${billList.idBill})">
                                                <i class="fa fa-eye"></i>
                                            </button>
                                        </c:when>

                                        <c:otherwise>
                                            <button class="ip-view" type="submit" onclick="showDetail(${billList.idBill})">
                                                <i class="fa fa-eye"></i>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                </div>

                            </td>
                        </tr>
                    </c:forEach>
                    <input type="text" hidden="hidden" id="idBill" name="idBill" value="">
                    <input type="text" hidden="hidden" id="active" name="active" value="">
                    </tbody>
                </table>
                </form>
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
            case "Đã hoàn thành":
                cell.style.color = "green";
                break;
            case "Huỷ":
                cell.style.color = "red";
                break;
            default:
                cell.style.color = "orange";
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

    }
    function approveStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 1;
    }
    function showDetail(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 2;
    }
</script>

</html>