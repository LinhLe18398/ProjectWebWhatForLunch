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
            min-width: 320px;
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
            &#128722; | My cart
        </div>
    </div>
</nav>
<body>
<div class="container">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:50%">Product Name</th>
            <th style="width:10%">Price</th>
            <th style="width:8%">Quantity</th>
            <th style="width:22%" class="text-center">Into Money</th>
            <th style="width:10%">Activities</th>
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
                            <p style="padding-left: 5px">Describe Product</p>
                        </div>
                    </div>
                </td>
                <td data-th="Price">${pro.price} VNĐ</td>
                <td data-th="Quantity" style="display: flex">
                    <a class="quantity"><i class="fa-solid fa-plus"></i></a>
                    <a class="quantity"><i class="fa-solid fa-minus"></i></a>
                    <input class="form-control" value="1" type="text">
                </td>
                <td data-th="Subtotal" class="text-center">200.000 VND</td>
                <td class="actions" data-th="">
                    <input type="checkbox" name="">
                </td>
            </tr>
        </c:forEach>

        </tbody>
        <tfoot>
        <tr>
            <td><a href="/users?action=home" style="color:#FF7F3F "><i class="fa fa-angle-left"></i>Home</a>
            </td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><strong>Sum: 500.000 VND</strong>
            </td>
            <td><a href="" class="btn btn-success btn-block">Buy</a>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
</body>
</html>
