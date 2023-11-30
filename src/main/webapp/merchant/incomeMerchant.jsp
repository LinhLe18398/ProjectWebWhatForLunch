<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phamh
  Date: 11/28/2023
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/merchant/incomeMerchant.css" type="text/css" rel="stylesheet"/>
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
    <title>WhatForLunch</title>

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
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 590px">

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

<div class="container">
    <div class="col-div-12">
        <div class="content-box">
            <div>
                <div class="form-group" id="form-group">
                    <div class="form-search-two">
                        <div class="form-input-four">
                            <input class="search-sp" type="text" name="filter"
                                   placeholder="Nhập năm cần tìm">
                            <i class="fa fa-search"></i>
                        </div>

                    </div>


                    <div class="form-search-one">

                        <select id="search-value-quarter" name="search-value-quarter" onchange="exchangeQuarterMonth()">
                            <option value="">Quý</option>
                            <option value="1">Quý 1</option>
                            <option value="2">Quý 2</option>
                            <option value="3">Quý 3</option>
                            <option value="4">Quý 4</option>
                        </select>

                        <select id="search-value-month" name="search-value-month" onchange="exchangeQuarterMonth()">
                            <option value="">Tháng</option>
                            <option value="1">Tháng 1</option>
                            <option value="2">Tháng 2</option>
                            <option value="3">Tháng 3</option>
                            <option value="4">Tháng 4</option>
                            <option value="5">Tháng 5</option>
                            <option value="6">Tháng 6</option>
                            <option value="7">Tháng 7</option>
                            <option value="8">Tháng 8</option>
                            <option value="9">Tháng 9</option>
                            <option value="10">Tháng 10</option>
                            <option value="11">Tháng 11</option>
                            <option value="12">Tháng 12</option>
                        </select>

                        <input type="date" name="date" id="search-value-day">


                    </div>
                    <button class="sp-search reset" type="submit" onclick="totalAmount()">Tìm kiếm</button>
                    <button class="sp-return" type="submit"><a class="nav-link" href="/bill?action=income-merchant"
                                                               style="text-decoration: none">Đặt lại</a></button>
                </div>
            </div>

            <div class="sum-number">
                <div class="sum-box">
                    <h3>Tổng số đơn</h3>
                    <p id="bill-Amount">0</p>
                </div>
                <div class="sum-box line">
                    <h3>Tổng tiền</h3>
                    <p id="total-Amount">0₫</p>
                </div>
                <div class="sum-box line">
                    <h3></h3>
                    <p></p>
                </div>
                <div class="sum-box line">
                    <h3></h3>
                    <p></p>
                </div>
            </div>
            <br/>
            <table id="table-order">
                <tr>
                    <th>Thời gian đặt</th>
                    <th>Người đặt</th>
                    <th>Tổng món</th>
                    <th>Tổng tiền</th>
                </tr>

                <c:forEach items="${billList}" var="billList">
                    <c:choose>
                        <c:when test="${billList.getBillStatus() == 'Đã hoàn thành'}">
                            <tr>
                                <td>${billList.getTimeOrder()}</td>
                                <td>${billList.getRecipientName()}</td>
                                <td>${billList.GetTotalQuantity()}</td>
                                <td class="price">${billList.getFinalTotal()}</td>
                            </tr>
                        </c:when>
                    </c:choose>

                </c:forEach>
            </table>
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

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber + "₫";
    }

    function addValueTotal(totalAmount, countBill) {
        let formattedNumber = totalAmount.toLocaleString();
        document.getElementById("total-Amount").textContent = formattedNumber + "₫";
        document.getElementById("bill-Amount").textContent = countBill;
    }

    function convertPrice(price) {
        const cleanedStr = price.replace("₫", "");
        const numberStr = cleanedStr.replace(".", "");
        const number = parseInt(numberStr);
        return number;
    }

    function getDateComponent(dateString, component) {
        const dateParts = dateString.split(" ")[0].split("-");
        const year = dateParts[0];
        const month = dateParts[1];
        const day = dateParts[2];
        switch (component) {
            case "year":
                return year;
            case "month":
                return month;
            case "day":
                return day;
        }
    }


    function returnDisplay() {
        const productTable = document.getElementById('table-order');
        const tableRows = productTable.getElementsByTagName('tr');
        for (let i = 1; i < tableRows.length; i++) {
            tableRows[i].style.display = "";
        }
        addValueTotal(0, 0);
    }

    function totalAmount() {

        const inputYear = document.querySelector('.search-sp[name="filter"]');
        const filterValue = inputYear.value;

        const optionQuarter = document.getElementById("search-value-quarter");
        const quarter = optionQuarter.value;

        const optionMonth = document.getElementById("search-value-month");
        const monthValue = optionMonth.value;

        const optionDay = document.getElementById("search-value-day");
        const dayValue = optionDay.value;

        const productTable = document.getElementById('table-order');
        const tableRows = productTable.getElementsByTagName('tr');

        let countBill = 0;
        let totalAmount = 0;

        returnDisplay();

        if (filterValue != "" && quarter == "" & monthValue == "" && dayValue == "") {

            for (let i = 1; i < tableRows.length; i++) {
                const row = tableRows[i];

                const dateCell = row.cells[0];
                const dateString = dateCell.textContent;
                const year = getDateComponent(dateString, "year");

                const amountCell = row.cells[3];
                const amount = amountCell.textContent;
                const number = convertPrice(amount);

                if (year === filterValue) {
                    countBill++;
                    totalAmount += number;
                } else {
                    tableRows[i].style.display = "none";
                }

            }
            addValueTotal(totalAmount, countBill);
            if (countBill == 0) {
                alert("Không có sản phẩm nào theo năm!");
                returnDisplay();
            }
        } else if (filterValue != "" && quarter != "" & monthValue == "" && dayValue == "") {

            for (let i = 1; i < tableRows.length; i++) {
                const row = tableRows[i];

                const dateCell = row.cells[0];
                const dateString = dateCell.textContent;
                const year = getDateComponent(dateString, "year");
                let month = getDateComponent(dateString, "month");

                if (month[0] == "0") {
                    month = month[1];
                }

                const amountCell = row.cells[3];
                const amount = amountCell.textContent;
                const number = convertPrice(amount);


                if (year === filterValue) {
                    switch (quarter) {
                        case "1":
                            if (month == "1" || month == "2" || month == "3") {
                                countBill++;
                                totalAmount += number;
                            } else {
                                tableRows[i].style.display = "none";

                            }
                            break;
                        case "2":
                            if (month == "4" || month == "5" || month == "6") {
                                countBill++;
                                totalAmount += number;
                            } else {
                                tableRows[i].style.display = "none";
                            }
                            break;
                        case "3":
                            if (month == "7" || month == "8" || month == "9") {
                                countBill++;
                                totalAmount += number;
                            } else {
                                tableRows[i].style.display = "none";

                            }
                            break;
                        case "4":
                            if (month == "10" || month == "11" || month == "12") {
                                countBill++;
                                totalAmount += number;
                            } else {
                                tableRows[i].style.display = "none";

                            }
                            break;
                    }

                }
            }
            addValueTotal(totalAmount, countBill);
            if (countBill == 0) {
                alert("Không có sản phẩm nào theo quý!");
                returnDisplay();

            }
        } else if (filterValue != "" && quarter != "" && monthValue != "" && dayValue == "") {

            for (let i = 1; i < tableRows.length; i++) {
                const row = tableRows[i];


                const dateCell = row.cells[0];
                const dateString = dateCell.textContent;
                const year = getDateComponent(dateString, "year");
                let month = getDateComponent(dateString, "month");


                if (month[0] == "0") {
                    month = month[1];
                }

                const amountCell = row.cells[3];
                const amount = amountCell.textContent;
                const number = convertPrice(amount);


                if (year === filterValue && month === monthValue) {
                    countBill++;
                    totalAmount += number;
                } else {
                    tableRows[i].style.display = "none";
                }


            }
            addValueTotal(totalAmount, countBill);
            if (countBill == 0) {
                alert("Không có sản phẩm nào theo tháng!");
                returnDisplay();
            }
        } else if (filterValue == "" && quarter == "" && monthValue == "" && dayValue != "") {

            let yearInput = getDateComponent(dayValue, "year");
            let monthInput = getDateComponent(dayValue, "month");
            let dayInput = getDateComponent(dayValue, "day");

            if (monthInput[0] == "0") {
                monthInput = monthInput[1];
            }

            for (let i = 1; i < tableRows.length; i++) {
                const row = tableRows[i];

                const dateCell = row.cells[0];
                const dateString = dateCell.textContent;
                let yearTd = getDateComponent(dateString, "year");
                let monthTd = getDateComponent(dateString, "month");
                let dayTd = getDateComponent(dateString, "day");

                if (monthTd[0] == "0") {
                    monthTd = monthTd[1];
                }

                const amountCell = row.cells[3];
                const amount = amountCell.textContent;
                const number = convertPrice(amount);


                if (yearInput = yearTd && monthInput == monthTd && dayInput == dayTd) {
                    countBill++;
                    totalAmount += number;
                } else {
                    tableRows[i].style.display = "none";
                }
            }

            addValueTotal(totalAmount, countBill);
            if (countBill == 0) {
                alert("Không có sản phẩm nào theo ngày!");
                returnDisplay();
            }

        } else if (dayValue != "") {
            if (filterValue == "" && quarter == "" && monthValue != "" ||
                filterValue == "" && quarter != "" && monthValue != "" ||
                filterValue != "" && quarter == "" && monthValue == "" ||
                filterValue != "" && quarter != "" && monthValue == "" ||
                filterValue != "" && quarter != "" && monthValue != "" ||
                filterValue != "" && quarter == "" && monthValue != "" ||
                filterValue == "" && quarter != "" && monthValue == "" )
            {
                alert("Khi nhập ngày các ô khác phải để trống!");
                returnDisplay();

            }
        }

    }

        function hideOptionMonth(num1, num2, num3) {
            let monthSelect = document.getElementById("search-value-month");
            let options = monthSelect.options;
            if (num1 == 0) {
                for (let i = 0; i < options.length; i++) {
                    let option = options[i];
                    option.style.display = "";

                }
            } else {
                for (let i = 0; i < options.length; i++) {
                    let option = options[i];
                    let value = parseInt(option.value);

                    if (value == num1 || value == num2 || value == num3) {
                        option.style.display = "";
                    } else {
                        option.style.display = "none";
                    }
                }
            }
            options[0].style.display = "";
        }

        function hideOptionQuarter(number) {
            let quarterSelect = document.getElementById("search-value-quarter");
            let options = quarterSelect.options;
            if (number == "") {
                for (let i = 0; i < options.length; i++) {
                    let option = options[i];
                    option.style.display = "";

                }
            } else {
                for (let i = 0; i < options.length; i++) {
                    let option = options[i];
                    option.style.display = "none";
                    if (i === 1 && (number == 1 || number == 2 || number == 3)) {
                        option.style.display = "";
                    }
                    if (i === 2 && (number == 4 || number == 5 || number == 6)) {
                        option.style.display = "";
                    }
                    if (i === 3 && (number == 7 || number == 8 || number == 9)) {
                        option.style.display = "";
                    }
                    if (i === 4 && (number == 10 || number == 11 || number == 12)) {
                        option.style.display = "";
                    }
                }
            }
            options[0].style.display = "";
        }

        function exchangeQuarterMonth() {
            const optionQuarter = document.getElementById("search-value-quarter");
            const optionMonth = document.getElementById("search-value-month");

            let quarter = optionQuarter.value;
            let month = optionMonth.value;
            if (quarter == "") {
                hideOptionMonth(0, 0, 0);
                hideOptionQuarter("");
            }
            if (month == "") {
                hideOptionQuarter("");
            }
            if (quarter != "") {
                switch (quarter) {
                    case "1":
                        hideOptionMonth(1, 2, 3)
                        break;
                    case "2":
                        hideOptionMonth(4, 5, 6);
                        break;
                    case "3":
                        hideOptionMonth(7, 8, 9);
                        break;
                    case "4":
                        hideOptionMonth(10, 11, 12);
                        break;
                }
            }

            if (month != "") {
                hideOptionQuarter(month);
            }

        }

</script>

</html>