<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 06/11/2023
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="container" style="box-shadow: 0px 2px 2px rgba(0,0,0,0.5); position: fixed; top: 0 ;left: 0;right: 0">
    <div style="float: left">
        <h1>&#8962; | Home</h1>
    </div>
    <input type="text" value="${user.id}" id="idUser" hidden="hidden">
    <div class="div-login-signup" id="button-full" style="float: right">
        <a href="/users?action=login">
            <button type="submit" class="btn btn-primary btn-sm">Đăng Nhập</button>
        </a>
        <a href="/users?action=create">
            <button type="submit" class="btn btn-secondary btn-sm">Đăng Kí</button>
        </a>
    </div>
</header>
<main class="container" style="padding-top: 100px">
    <div style="padding-bottom: 50px">
        <h1>McDonald's - Ho Guom</h1>
        <p>ga ran - Burger,com,mon quoc te</p>

        <div style="display: flex">
            <p style="padding-right: 30px">&#9734; 4,3</p>
            <p>&#8855; 40 phút &#8226; 2,6km</p>
        </div>
        <div style="display: flex">
            <p style="padding-right: 30px">Giờ mở cửa</p>
            <p>Hôm nay 07:00-22:50</p>
        </div>
    </div>

    <hr>

    <h2>Menu</h2>
    <div class="card mb-3" style="max-width: 440px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="https://www.jbah.info.vn/wp-content/uploads/2022/02/McDonalds-Nhat-Ban-se-dua-khoai-tay-chien-co-lon.jpg"
                     width="100" class="img-fluid rounded-start" alt="..." style="max-width: 150px">
            </div>
            <div class="col-md-8">
                <div class="card-body" style="padding: 10px">
                    <h5 class="card-title">Khoai Tay chien</h5>
                    <p class="card-text">gia ban dau la 30k giam gia con 10k</p>
                    <p class="card-text">10k</p>
                    <c:if test="${sessionScope.isLogin==true}">
                        <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

</main>
<footer>

</footer>
</body>
<script>
    let idUser = document.getElementById("idUser").value;
    if (idUser != 0) {
        document.getElementById("button-full").hidden = true;
    } else {
        document.getElementById("button-full").hidden = false;
    }
</script>
</html>
