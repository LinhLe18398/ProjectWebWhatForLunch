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
    .form-control{
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
        <c:forEach items="${productCart}" var="pro">
            <tr>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-2 hidden-xs">
                            <img src="${pro.productImg}"
                                 alt="${pro.idProduct}" width="100">
                        </div>
                        <div class="col-sm-10">
                            <h4 class="nomargin" style="padding-left: 5px">${pro.productName}</h4>
                            <p style="padding-left: 5px">${pro.note}</p>
                        </div>
                    </div>
                </td>
                <td data-th="Price">${pro.price} ₫</td>
                <td data-th="Quantity" style="display: flex">
                    <input type="hidden" value="${pro.price}" id="price${pro.idProduct}">
                    <input class="form-control quantity-input" id="quantity${pro.idProduct}" value="${pro.quantity}" type="text">
                    <a style="margin-left: 8px; margin-top: 6px" href="/products?action=update-quantity&id=${pro.idProduct}&isAdd=0"><i class="fa-solid fa-minus"></i></a>
                    <a style="margin-left: 6px; margin-top: 6px" href="/products?action=update-quantity&id=${pro.idProduct}&isAdd=1"><i class="fa-solid fa-plus"></i></a>
                </td>
                <td data-th="Subtotal" class="text-center"></td>
                <td class="actions" data-th="">
                    <input type="checkbox" id="${pro.idProduct}" onclick="sumProduct(this.id)">
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

            <td><a href="/users?action=order" class="btn btn-success btn-block" onclick="checkEmpty()">Mua</a>

            </td>
        </tr>
        </tfoot>
    </table>
</div>
</body>
</html>
<script>
    // Lấy tất cả các hàng trong bảng
    var rows = document.querySelectorAll("#cart tbody tr");

    // Duyệt qua từng hàng
    rows.forEach(function(row) {
        // Lấy giá trị cột "Price"
        var price = parseFloat(row.querySelector("td[data-th='Price']").innerText);

        // Lấy giá trị cột "Quantity"
        var quantity = parseInt(row.querySelector(".form-control").value);

        // Tính giá trị cột "Into Money" bằng tích của "Price" và "Quantity"
        var intoMoney = price * quantity;

        // Hiển thị giá trị trong cột "Into Money"
        row.querySelector("td[data-th='Subtotal']").innerText = intoMoney + " ₫";
    });

    // Tính tổng giá trị của tất cả các hàng cột "Into Money"
    var total = 0;
    rows.forEach(function(row) {
        var intoMoney = parseFloat(row.querySelector("td[data-th='Subtotal']").innerText);
        total += intoMoney;
    });

    let priceCart = 0;
    function sumProduct(thisId) {
        let checkBox = document.getElementById(thisId);
        let idQuantity = "quantity" + thisId;
        let idPrice = "price" + thisId;

        let quantity = Number(document.getElementById(idQuantity).value);
        let price = Number(document.getElementById(idPrice).value);
        if (checkBox.checked) {
            priceCart = priceCart + (quantity * price);
        } else {
            priceCart = priceCart - (quantity * price);
        }
        document.getElementById("my-sum").textContent = "Tổng tiền: " + priceCart + "₫";
    }
</script>
