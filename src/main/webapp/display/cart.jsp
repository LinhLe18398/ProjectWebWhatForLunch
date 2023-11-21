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
    <title>&#128722; Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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


    .quantity {
        padding-top: 10px;
        padding-right: 5px;
    }

    .form-control {
        width: 30px;
        padding: 5px;
    }
</style>
</style>
<nav>
    <div class="container">
        <div style="color:#FF7F3F ; padding: 20px ; font-size: 50px">
            &#128722; | Giỏ hàng
        </div>
    </div>
</nav>
<body>
<div class="container">
    <table id="cart" class="table table-hover table-condensed">
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
        <c:set var="products" value="${requestScope.products}" />
        <c:set var="restaurants" value="${requestScope.restaurants}" />
        <c:forEach items="${products}" var="product" varStatus="loop">
            <input type="hidden" id="${product.idProduct}" value="${product.idMerchant}">
            <c:set var="nameRes" value="${restaurants[loop.index]}" />
            <tr>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-2 hidden-xs">
                            <img src="${product.productImg}"
                                 alt="${product.idProduct}" width="100">
                        </div>
                        <div class="col-sm-10">
                            <h4 class="nomargin" id="" style="padding-left: 5px">${product.productName} - <c:out value="${nameRes}" /></h4>
                            <p style="padding-left: 5px">${product.note}</p>
                        </div>
                    </div>
                </td>
                <td data-th="Price">${product.price} ₫</td>
                <td data-th="Quantity" style="display: flex">
                    <input type="hidden" value="${product.price}" id="price${product.idProduct}">
                    <a style="margin-right: 8px; margin-top: 8px"
                       href="/products?action=update-quantity&id=${product.idProduct}&isAdd=0"><i
                            class="fa-solid fa-minus"></i></a>
                    <input class="form-control quantity-input" id="quantity${product.idProduct}" value="${product.quantity}"
                           type="text">
                    <a style="margin-left: 6px; margin-top: 8px"
                       href="/products?action=update-quantity&id=${product.idProduct}&isAdd=1"><i
                            class="fa-solid fa-plus"></i></a>
                </td>
                <td data-th="Subtotal" class="text-center"></td>

                <td class="actions" data-th="">
                    <input type="checkbox" id="${product.idProduct}" name="check" onclick="sumProduct(this.id,`${[loop.index]}`)">
                    <input type="text" id="checkbox" name="check" value="${product.idProduct}" hidden="hidden">
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td><a href="/users?action=home" style="color:#FF7F3F "><i class="fa fa-angle-left"></i>Trang chủ</a>
            </td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><h4 id="my-sum"></h4></td>
            <td>
                <form action="/users?action=order" method="post">
                    <input type="submit" id="btnn" class="btn btn-success btn-block" value="Mua">
                    <input hidden="hidden" type="text" id="idProduct" name="idProduct" value="${param.idProduct}">
                    <input hidden="hidden" type="text" id="quantity" name="quantity" value="${param.quantity}">
                </form>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
</body>
</html>
<script>

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

    var rows = document.querySelectorAll("#cart tbody tr");
    rows.forEach(function (row) {
        var price = parseFloat(row.querySelector("td[data-th='Price']").innerText);
        var quantity = parseInt(row.querySelector(".form-control").value);
        var intoMoney = price * quantity;
        row.querySelector("td[data-th='Subtotal']").innerText = intoMoney + " ₫";
    });

    let total = 0;
    rows.forEach(function (row) {
        let intoMoney = parseFloat(row.querySelector("td[data-th='Subtotal']").innerText);
        total += intoMoney;
    });

    let priceCart = 0;
    let listRes = [];

    function sumProduct(thisId,nameRes) {
        let checkBox = document.getElementById(thisId);
        let idQuantity = "quantity" + thisId;
        let idPrice = "price" + thisId;
        let quantity = Number(document.getElementById(idQuantity).value);
        let price = Number(document.getElementById(idPrice).value);
        if (!checkBox.checked) {
            priceCart = priceCart + (quantity * price);
            addDataIntoFormHidden(thisId, quantity, true);
            listRes.push(nameRes);
        } else {
            priceCart = priceCart - (quantity * price);
            addDataIntoFormHidden(thisId, quantity, false);
            listRes = listRes.filter(function(item) {
                return item !== nameRes;
            });
        }

        let check = listRes[0];
        for ()
        document.getElementById("my-sum").textContent = "Tổng tiền: " + priceCart + "₫";
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