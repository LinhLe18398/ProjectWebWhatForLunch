<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 01/11/2023
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhatForLunch</title>
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

    .form-control {
        width: 30px;
        text-align: center;
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

</style>

<body>
<div class="header container">
    <div class="overlay"></div>
    <div class="navbar" style="margin-left: -106px">
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
             style="background-color: rgb(255,255,255,0) !important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="/users?action=home"
                   style="color: white; font-size: 20px;padding-top: 14px;padding-left: 96px">Trang
                    chủ</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 723px">
                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: white; font-size: 20px;text-decoration: none">Nhà hàng</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/users?action=comfirmpassword">Chuyển sang
                                    nhà hàng của tôi</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: white; font-size: 20px;text-decoration: none">
                                ${user.name}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông
                                    tin</a></li>
                                <li><a class="dropdown-item" href="/display/billUser.jsp">Đơn đã đặt</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="/users?action=logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container" style="padding-top: 25px">
    <p style="color: red;font-size: 17px">Lưu ý: Một lần mua bạn chỉ có thể mua từ một cửa hàng.</p>
</div>

<div class="container" style="min-height: 500px;padding-top: 17px">
    <table id="cart" class="table table-hover table-condensed" style=" min-height: 300px">
        <thead>
        <tr>
            <th style="width:50%">Mặt hàng</th>
            <th style="width:10%">Giá</th>
            <th style="width:8%">Số lượng</th>
            <th style="width:22%" class="text-center">Thành tiền</th>
            <th style="width:10%">Chọn mua</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productCart}" var="pro">
            <tr>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-2 hidden-xs">
                            <img src="${pro.productImg}"
                                 alt="${pro.idProduct}" style="width: 127px; height: 100px">
                        </div>
                        <div class="col-sm-10">
                            <h4 class="nomargin"
                                style="padding-left: 5px; margin-left: 18px; font-weight: bold;font-size: 20px">${pro.productName} - ${pro.restaurantName}</h4>
                            <p style="padding-left: 5px; margin-left: 18px">${pro.note}</p>
                        </div>
                    </div>
                </td>
                <td data-th="Price" class="price">${pro.price}</td>
                <td data-th="Quantity"  style="display: flex;padding-bottom: 70px">
                    <input type="hidden" value="${pro.price}" id="price${pro.idProduct}">

                    <a style="margin-right: 8px; margin-top: 8px"
                       href="/products?action=update-quantity&id=${pro.idProduct}&isAdd=0"><i
                            class="fa-solid fa-minus"></i></a>
                    <input class="form-control quantity-input " id="quantity${pro.idProduct}" value="${pro.quantity}"
                           type="text">
                    <a style="margin-left: 6px; margin-top: 8px"
                       href="/products?action=update-quantity&id=${pro.idProduct}&isAdd=1"><i       
                            class="fa-solid fa-plus"></i></a>
                </td>
                <td data-th="Subtotal" class="text-center price"></td>

                    <td class="actions" data-th="">
                        <input type="hidden" class="${pro.idMerchant} merchantlist" value="${pro.idMerchant}" id="merchant_${pro.idProduct}">
                        <input type="checkbox" class="${pro.idMerchant} merchantlist"  id="${pro.idProduct}" name="check" onclick="sumProduct(this.id)">
                        <input type="text" id="checkbox_${pro.idProduct}" name="check" value="${pro.idProduct}" hidden="hidden">
                    </td>

            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td><a href="/users?action=home"
                   style="color:#FF7F3F; margin-top: 15px; font-size: 20px;text-decoration: none"><i
                    class="fa fa-angle-left"></i>Trang chủ</a>
            </td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><h4 id="my-sum"></h4></td>
            <td>
                <form action="/users?action=order" method="post" >
                    <input type="submit" id="btnn" class="btn btn-success btn-block" value="Mua"
                           style="width: 107px; height: 37px; font-size: 16px; margin-top: 15px">
                    <input hidden="hidden" type="text" id="idProduct" name="idProduct" value="${param.idProduct}">
                    <input hidden="hidden" type="text" id="quantity" name="quantity" value="${param.quantity}">
                </form>
            </td>
        </tr>
        </tfoot>
    </table>
</div>


<footer class="text-center text-lg-start bg-light text-muted">
    <section style="height: 54px" class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
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

</body>
</html>
<script>

    let merchantList = [];

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber + "₫";
    }


    var form = document.getElementById('myForm');
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var submitButton = document.getElementById('btnn');

    submitButton.addEventListener('click', function (event) {
        var atLeastOneChecked = false;
        checkboxes.forEach(function (checkbox) {
            if (checkbox.checked) {
                atLeastOneChecked = true;
            }
        });

        if (!atLeastOneChecked) {
            event.preventDefault();
            alert('vui lòng chọn ít nhất một sản phẩm');
        }
    });

    function convertToCurrencyString(number) {
        let str = number.toString();
        let dotIndex = str.length - 3;
        while (dotIndex > 0) {
            str = str.slice(0, dotIndex) + "." + str.slice(dotIndex);
            dotIndex -= 3;
        }
         str += "₫";
        return str;
    }


    var rows = document.querySelectorAll("#cart tbody tr");
    rows.forEach(function (row) {
        let priceString = row.querySelector("td[data-th='Price']").innerText;
        let price = parseInt(priceString.replace(/\D/g, ""), 10);
        var quantity = parseInt(row.querySelector(".form-control").value);
        var intoMoney = price * quantity;

        row.querySelector("td[data-th='Subtotal']").innerText = convertToCurrencyString(intoMoney);

    });

    let total = 0;
    rows.forEach(function (row) {
        let intoMoney = parseFloat(row.querySelector("td[data-th='Subtotal']").innerText);
        total += intoMoney;
    });

    let priceCart = 0;

    function sumProduct(thisId) {
        let checkBox = document.getElementById(thisId);
        let merchantClass = Array.from(checkBox.classList);
        let idQuantity = "quantity" + thisId;
        let idPrice = "price" + thisId;

        let quantity = Number(document.getElementById(idQuantity).value);
        let price = Number(document.getElementById(idPrice).value);

        if (checkBox.checked) {
            priceCart = priceCart + (quantity * price);
            addDataIntoFormHidden(thisId, quantity, true);
            checkMerchant(merchantClass[0]);
        } else {
            priceCart = priceCart - (quantity * price);
            addDataIntoFormHidden(thisId, quantity, false);
            remoteMerchant(merchantClass[0]);
        }

        document.getElementById("my-sum").textContent = "Tổng tiền: " + convertToCurrencyString(priceCart);
    }

    function checkMerchant(idMerchant){
        if (merchantList.length < 1) {
            merchantList.push(idMerchant);
        } else {
            document.getElementById("btnn").disabled = false;
            for (let i = 0; i < merchantList.length; i++) {
                if (merchantList[i] != idMerchant) {
                    document.getElementById("btnn").disabled = true;
                }
            }
            merchantList.push(idMerchant);
        }
    }

    function remoteMerchant(idMerchant) {
        let index = merchantList.indexOf(idMerchant);
        if (index !== -1) {
            merchantList.splice(index, 1);
        }
        document.getElementById("btnn").disabled = false;
        let mainMerchant = merchantList[0];
        if (merchantList.length > 1) {
            for (let i = 0; i < merchantList.length; i++) {
                console.log(merchantList[i] + "a:b" + idMerchant);
                if (merchantList[i] != mainMerchant) {
                    console.log(true);
                    document.getElementById("btnn").disabled = true;
                }
            }
        }

    }

    let allIdProductChecked = "";
    let allQuantityChecked = "";

    function addDataIntoFormHidden(idProduct, quantity, checked) {
        if (checked) {
            allQuantityChecked += "/" + quantity;
            allIdProductChecked += "/" + idProduct;
        } else {
            let allId = allIdProductChecked.split("/");
            let allQuantity = allQuantityChecked.split("/");
            if (allId.length == 1) {
                allId = [""];
                allQuantity = [""];
            } else {
                for (let i = 0; i < allId.length; i++) {
                    if (allId[i] == idProduct) {
                        allId = allId.splice(i, 1);
                        allQuantity = allQuantity.splice(i, 1);
                    }
                }
            }
            allIdProductChecked = allId.join("/");
            allQuantityChecked = allQuantity.join("/");
        }
        document.getElementById("idProduct").value = allIdProductChecked;
        document.getElementById("quantity").value = allQuantityChecked;
    }

</script>