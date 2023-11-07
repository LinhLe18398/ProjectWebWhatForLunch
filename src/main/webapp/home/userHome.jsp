<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 23/10/2023
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css'>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>

</head>
<style>
    @import url("https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap");

    .search {
        /*position: relative;*/
        box-shadow: 0 0 40px rgba(51, 51, 51, .1);
    }

    .search input {
        height: 60px;
        /*text-indent: 25px;*/
        border: 2px solid #d6d4d4;
        width: 390px;
    }

    .search button {
        width: 110px;
        background: #FF7F3F;
    }

    .navbar {
        margin-left: 300px;

    }

    .text-content {
        /*margin-top: 40px;*/
        text-align: center;
    }

    .search {
        margin-top: 50px;
        padding-bottom: 60px;
    }

    .header {
        background-image: url("https://png.pngtree.com/thumb_back/fh260/back_our/20190619/ourmid/pngtree-food-overlooking-the-background-banner-image_138613.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-color: rgb(255, 255, 255, 0.5) !important;
    }

    .listPage {
        padding: 10px;
        text-align: center;
        list-style: none;
    }

    .listPage li {
        background-color: #ffffffBD;
        padding: 20px;
        display: inline-block;
        margin: 0 10px;
        cursor: pointer;
    }

    .listPage .active {
        background-color: #B192EF;
        color: #fff;
    }

    a {
        cursor: pointer;
        color: #212529;
    }

    .price{
        display: inline-block;
    }
</style>
<body>
<div class="header">
    <input type="text" value="${user.id}" id="idUser" hidden="hidden">
    <div class="div-login-signup" id="button-full" style="float: right">
        <a href="/users?action=login">
            <button type="submit" class="btn btn-primary btn-sm">Đăng Nhập</button>
        </a>
        <a href="/users?action=create">
            <button type="submit" class="btn btn-secondary btn-sm">Đăng Kí</button>
        </a>
    </div>
    <c:if test="${sessionScope.isLogin==true}">
        <div class="navbar" style="margin-left: 800px">
            <nav class="navbar navbar-expand-lg navbar-light bg-light"
                 style="background-color: rgb(255,255,255,0) !important;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#" style="color: white">Home</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item" style="margin-left: 20px">
                                <a class="nav-link active" aria-current="page" href="#" style="color: white">Offers</a>
                            </li>

                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                                    Restaurant
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/users?action=comfirmpassword">Chuyển sang merchant</a></li>
                                    <li><a class="dropdown-item" href="#">2</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">3</a></li>
                                </ul>
                            </li>


                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                                    Page
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">1</a></li>
                                    <li><a class="dropdown-item" href="#">2</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">3</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                                        ${user.name}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông tin</a></li>
                                    <li><a class="dropdown-item" href="/users?action=merchant">Đăng ký quán</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="/users?action=logout">Đăng suất</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="/users?action=cart" role="button"
                                   aria-expanded="false" style="color: white">
                                    Cart
                                </a>

                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </c:if>
    <div class="text-content">
        <h1 style="color: white;">Khám phá những món ăn ngon nhất &</h1>
        <h1 style="color: white">Đồ uống ở Hà Nội</h1>
    </div>
    <%--search--%>
    <div class="search">
        <div class="container">
            <div class="row height d-flex justify-content-center align-items-center">
                <div class="col-md-8">
                    <div class="search" style="display: flex ; padding-left: 40px">
                        <div style="margin: 5px">
                            <form id="quick-search" method="get">
                                <input type="hidden" name="action" value="search">
                                <select class="form-select" name="quick_search" aria-label="Default select example"
                                        style="height: 60px" onchange="quickSearch()">
                                    <option selected>
                                        <c:choose>
                                            <c:when test="${empty tagSearch}">Quick Search</c:when>
                                            <c:otherwise>${tagSearch}</c:otherwise>
                                        </c:choose>
                                    </option>
                                    <option value="Breakfast">Breakfast</option>
                                    <option value="Coffee">Coffee</option>
                                    <option value="Lunch">Lunch</option>
                                    <option value="Dinner">Dinner</option>
                                </select>
                            </form>
                        </div>
                        <div style="margin: 5px; display: inline-block">
                            <input type="text" id="search-input" class="form-control"
                                   placeholder="Enter your delivery location">
                        </div>
                        <div style="margin: 5px; display: inline-block">
                            <form id="search-name" method="get">
                                <input type="hidden" name="action" value="search">
                                <input type="hidden" id="hidden-name-search" name="name_search" value="">
                                <button type="submit" style="height: 60px" class="btn btn-danger"
                                        onclick="searchByName()">Search
                                </button>
                            </form>
                        </div>
                        </form>
                    </div>
                </div>
            </div>


            <div class="container carousel slide" style="display: flex; padding-bottom: 10px">
                <div class="card" style="width: 15rem; margin-right: 35px">
                    <div style="width: auto ; height: 160px">
                        <img src="https://cdn.tgdd.vn/2021/01/CookRecipe/Avatar/GaNuongKieuAnh1200.jpg"
                             class="card-img-top"
                             alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">(tên món ăn)</h5>
                        <p class="card-text">(giá) VND</p>
                    </div>
                </div>

                <div class="card" style="width: 15rem;margin-right: 35px">
                    <div style="width: auto ; height: 160px">
                        <img src="https://file.hstatic.net/200000303304/article/steak_10_b1b1397477ea4c8ca1f215989632a614_1024x1024.jpg"
                             class="card-img-top" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">(tên món ăn)</h5>
                        <p class="card-text">(giá) VND</p>
                    </div>
                </div>

                <div class="card" style="width: 15rem;margin-right: 35px">
                    <div style="width: auto ; height: 160px">
                        <img src="https://theme.hstatic.net/200000492347/1000889029/14/home_slider_image_1.jpg?v=2419"
                             class="card-img-top" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">(tên món ăn)</h5>
                        <p class="card-text">(giá) VND</p>
                    </div>
                </div>

                <div class="card" style="width: 15rem;">
                    <div style="width: auto ; height: 160px">
                        <img src="https://cdn.tgdd.vn/Files/2022/01/25/1412805/cach-nau-pho-bo-nam-dinh-chuan-vi-thom-ngon-nhu-hang-quan-202201250313281452.jpg"
                             class="card-img-top" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">(tên món ăn)</h5>
                        <p class="card-text">(giá) VND</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%--content--%>
<div class="container">
    <%--8 món ăn được gợi ý--%>
    <h2 style="padding-top: 40px">Gợi Ý Món Ăn</h2>
    <div class="container carousel slide" style="display: flex; padding-bottom: 10px" id="myCarousel">
        <div class="col-md-3 col-6" style="width:15%; border-radius: 20px 20px 20px 20px; padding: 10px">
            <div style="width: auto; height: 150px">
                <h6 style="background-color: #589d4a ; position: absolute; border-radius: 0 15px 15px 0; color: white;padding: 5px">
                    gợi ý</h6>
                <img class="card-img-top"
                     src="https://theme.hstatic.net/200000492347/1000889029/14/home_slider_image_1.jpg?v=2419"
                     alt="Card image cap"
                     style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(155,154,154); max-width: 100% ;max-height: 100%">
            </div>
            <div class="card-body"
                 style="background-color: #b9b7b7 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px ">
                <h5 class="card-title" style="max-width: 100% ;max-height: 100%">tên món ăn - (Name
                    Merchant)</h5>
                <p class="card-text">
                    <li>(địa chỉ)</li>
                    <li>(thời gian) phút</li>
                    <li>(giá) VND</li>
                </p>
                <c:if test="${sessionScope.isLogin==true}">
                    <a href="#" class="btn btn-primary">Add to Cart</a>
                </c:if>
            </div>
        </div>
    </div>


    <%--8 món ăn được giảm giá nhất --%>
    <div style="padding-top: 30px;">
        <h2>Món Ăn Giảm Giá</h2>
        <div class="container carousel slide" style="display: flex; padding-bottom: 10px">
            <div class="col-md-3 col-6" style="width:15%; border-radius: 20px 20px 20px 20px; padding: 10px">
                <div style="width: auto; height: 150px">
                    <h6 style="background-color: #e82323; position: absolute; border-radius:0 15px 15px 0; color: white;padding: 5px">
                        giảm giá 1%</h6>
                    <img class="card-img-top"
                         src="https://theme.hstatic.net/200000492347/1000889029/14/home_slider_image_1.jpg?v=2419"
                         alt="Card image cap"
                         style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(128,128,128); max-width: 100% ;max-height: 100%">
                </div>
                <div class="card-body"
                     style="background-color: #b9b7b7 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px ">
                    <h5 class="card-title" style="max-width: 100% ;max-height: 100%">tên món ăn - (Name
                        Merchant)</h5>
                    <p class="card-text">
                        <li>(địa chỉ)</li>
                        <li>(thời gian) phút</li>
                        <li>(giá) VND</li>
                    </p>
                    <c:if test="${sessionScope.isLogin==true}">
                        <a href="#" class="btn btn-primary">Add to Cart</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%--Menu main--%>
    <div class="row mb-2 list" style="padding-top: 50px">
        <h2 style="padding-bottom: 20px">Có Thể Bạn Cần Tìm</h2>
        <c:forEach items="${pro}" var="pro">
            <div class="col-md-3 col-6  item"
                 style="width:20%; border-radius: 20px 20px 20px 20px; padding: 10px; max-height: 100%; max-width: 100%">
                <div style="width: auto; height: 145px">
                    <img class="card-img-top" src="${pro.productImg}" alt="Card image cap"
                         style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(128,128,128); max-width: 100% ;max-height: 100%">
                </div>
                <div class="card-body"
                     style="background-color: #b9b7b7 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px; max-width: 200% ;height: 250px; padding: 10px ">
                    <div style="max-width: 100% ;max-height: 100% ; margin: 0">
                        <form method="get" id="restaurant${pro.idMerchant}" style="cursor: pointer;" onclick="redirectToUsers(this.id)">
                            <input type="hidden" name="action" value="restaurant"/>
                            <input type="hidden" name="idMerchant" value="${pro.idMerchant}"/>
                            <h5 class="card-title"
                                style=" width: 100%; height: 46px; margin: 0;overflow: hidden">${pro.productName} - ${pro.restaurantName}
                            </h5>
                            <p class="card-text " >
                                <li>${pro.address}</li>
                                <li>${pro.waitTime} phút</li>
                                <li><p class="price">${pro.price}</p> &#8363</li>
                            </p>
                        </form>
                        <p style="margin: 0">
                            <c:if test="${sessionScope.isLogin==true}">
                                <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                            </c:if>
                        </p>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <ul class="listPage"></ul>
</div>
<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    </section>
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3"></i>Công ty CNHH 5 thành viên
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
</html>
<script>

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber;
    }

    function redirectToUsers(id) {
      document.getElementById(id).submit();
    }

    function quickSearch() {
        document.getElementById("quick-search").submit();
        document.getElementById("name-search").value = "";
    }

    function searchByName() {
        let search = document.getElementById("search-input");
        document.getElementById("hidden-name-search").value = search.value;
        document.getElementById("search-name").submit();
    }

    let idUser = document.getElementById("idUser").value;
    if (idUser != 0) {
        document.getElementById("button-full").hidden = true;
    } else {
        document.getElementById("button-full").hidden = false;
    }

    let thisPage = 1;
    let limit = 12;
    let list = document.querySelectorAll('.list .item');

    function loadItem() {
        let beginGet = limit * (thisPage - 1);
        let endGet = limit * thisPage - 1;
        list.forEach((item, key) => {
            if (key >= beginGet && key <= endGet) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        })
        listPage();
    }

    loadItem();

    function listPage() {
        let count = Math.ceil(list.length / limit);
        document.querySelector('.listPage').innerHTML = '';

        if (thisPage != 1) {
            let prev = document.createElement('li');
            prev.innerText = 'Trở về';
            prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
            document.querySelector('.listPage').appendChild(prev);
        }

        for (i = 1; i <= count; i++) {
            let newPage = document.createElement('li');
            newPage.innerText = i;
            if (i == thisPage) {
                newPage.classList.add('active');
            }
            newPage.setAttribute('onclick', "changePage(" + i + ")");
            document.querySelector('.listPage').appendChild(newPage);
        }

        if (thisPage != count) {
            let next = document.createElement('li');
            next.innerText = 'Tiếp';
            next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
            document.querySelector('.listPage').appendChild(next);
        }
    }

    function changePage(i) {
        thisPage = i;
        loadItem();
    }
</script>