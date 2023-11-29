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
    <link href="/merchant/billMerchant.css" type="text/css" rel="stylesheet"/>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>Merchant Home</title>

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


        .overlay {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.3);
            pointer-events: none;
        }
    </style>
</head>

<body>
<div class="header container">
    <div class="overlay"></div>
    <div class="navbar" style="margin-left: 20px">
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
                <c:if test="${sessionScope.isLogin==true}">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 609px">

                    <li style="padding-top: 8px">
                        <a href="/products?action=home-merchant" id="a" onclick="listClick(this.id)"
                           style="color: white; font-size: 19px; padding-right: 30px; text-decoration: none">Quản lí sản
                            phẩm</a>
                    </li>
                    <li style="padding-top: 8px">
                        <a href="/bill?action=bill-merchant" id="b" onclick="listClick(this.id)"
                           style="color: white; font-size: 19px; text-decoration: none"> Quản lí đơn</a>
                    </li>

                    <li class="nav-item dropdown" style="margin-left: 20px">
                        <a class="nav-link" href="/bill?action=income-merchant" role="button" aria-expanded="false"
                           style="color: white; font-size: 19px; ">Doanh thu</a>
                    </li>

                    <li style="padding-top: 8px">
                        <a style="color: white; font-size: 19px; padding-right: 30px; text-decoration: none; margin-left: 20px"
                           href="/users?action=home">Đăng xuất</a>
                    </li>
                </ul>
            </div>
            </c:if>
    </div>
    </nav>
</div>
</div>




<div class="item item3">
    <div class="notification-div">
        <hr class="hr"/>
    </div>
</div>
</div>

<div class="clearfix"></div>
<br/>
<div class="clearfix"></div>
<br/>

<div class="container bb box">
    <div class="col-div-12">
        <div class="content-box">
            <div id="button-group">
                <div class="group-button" onclick="changeColor(0)">Tất cả</div>
                <div class="group-button" onclick="changeColor(1)">Chờ nhận hàng</div>
                <div class="group-button" onclick="changeColor(2)">Đang chế biến</div>
                <div class="group-button" onclick="changeColor(3)">Đã nhận món</div>
                <div class="group-button" onclick="changeColor(4)">Đang giao</div>
                <div class="group-button" onclick="changeColor(5)">Đã hoàn thành</div>
                <%--                <div class="group-button" onclick="changeColor(6)">Huỷ</div>--%>
                <div class="group-button" onclick="changeColor(6)">Đơn đã huỷ</div>
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
                                <input class="search-sp" type="text" name="filter"
                                       placeholder="Thông tin bất kì đơn hàng">
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
                                        <button class="ip-delete" type="submit"
                                                onclick="declineStatus(${billList.idBill})">
                                            <i class="fa fa-x"></i>
                                        </button>
                                        <button class="ip-update" type="submit"
                                                onclick="approveStatus(${billList.idBill})">
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

<footer class="text-center text-lg-start bg-light text-muted" style="margin-top: 80px">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    </section>
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4" style="margin-left: 104px">
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3"></i>CT CNHH 5 thành viên
                    </h6>
                    <p>
                        Here you can order all delicious Vietnamese dishes.
                    </p>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 text-left mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Sản phẩm
                    </h6>
                    <p>Thông tin</p>
                    <p>Trợ giúp</p>
                </div>
                <div class="col-md-3 col-lg-2 col-xl-2 text-left mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Thành viên
                    </h6>
                    <p>Ngoc Linh</p>
                    <p>Van Tuan</p>
                    <p>Cat Hai</p>
                    <p>Gia Minh</p>
                    <p>Minh Hieu</p>
                </div>
                <div class="col-md-4 col-lg-3 col-xl-3 text-left mb-md-0 mb-4">
                    <h6 class=" text-uppercase fw-bold mb-4">
                        Liên hệ
                    </h6>
                    <p>Hoài Đức - Hà Nội</p>
                    <p>
                        WebWhatForLunch@gmail.com
                    </p>
                    <p> +84 88658023</p>
                    <p> +84 38301773</p>
                </div>
            </div>
        </div>
    </section>
    <div class="text-center p-4" style="background-color: lightgray;">
        © 2023 WebWhatForLunch
    </div>
</footer>


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

            // if (buttonIndex == 6 && cellValue !== "Huỷ") {
            //     tr.style.display = "none";
            //     sumOrder--;
            // }
            if (buttonIndex == 6 && cellValue !== ("Nhà hàng từ chối đơn" || "Khách hàng huỷ đơn")) {
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
            // case "Huỷ":
            //     cell.style.color = "red";
            //     break;
            case "Nhà hàng từ chối đơn":
                cell.style.color = "red";
                break;
            case "Khách hàng huỷ đơn":
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
        numberElement.textContent = formattedNumber + "₫";
    }

    function declineStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 0;

    }
    function approveStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 2;
    }
    function showDetail(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 3;
    }
</script>

</html>