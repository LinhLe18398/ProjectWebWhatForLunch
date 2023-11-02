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
    /*body{*/
    /*  background-color:#eee;*/
    /*  font-family: "Poppins", sans-serif;*/
    /*  font-weight: 300;*/
    /*}*/

    /*.height{*/
    /*  height: 100vh;*/
    /*}*/


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


    /*.search input:focus{*/

    /*  box-shadow: none;*/
    /*  border: 2px solid blue;*/


    /*}*/


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
        padding-bottom: 200px;
    }

    .header {
        background-image: url("https://png.pngtree.com/thumb_back/fh260/back_our/20190619/ourmid/pngtree-food-overlooking-the-background-banner-image_138613.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-color: rgb(255, 255, 255, 0.5) !important;;
    }


    /*css content*/

</style>
<body>
<input type="text" value="${user.id}" id="idUser" hidden="hidden">
<div class="div-login-signup" id="button-full" style="float: right">
    <a href="/users?action=login">
        <button type="submit" class="btn btn-primary btn-sm">Login</button>
    </a>
    <a href="/users?action=create">
        <button type="submit" class="btn btn-secondary btn-sm">Signup</button>
    </a>
</div>
<div class="header">
    <c:if test="${sessionScope.isLogin==true}">
        <div class="navbar" style="margin-left: 700px">
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
                                    <li><a class="dropdown-item" href="/users?action=comfirmpassword">switch to
                                        merchant</a></li>
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
                                    My Account
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Edit
                                        profile</a></li>
                                    <li><a class="dropdown-item" href="/users?action=merchant">Register merchant</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="/users?action=logout">log out</a></li>
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
        <h1 style="color: white">Discover The Best Food &</h1>
        <h1 style="color: white">Drinks In Viet Nam 🇻🇳</h1>
    </div>

    <div class="search">
        <div class="container">
            <div class="row height d-flex justify-content-center align-items-center">
                <div class="col-md-8">
                    <div class="search" style="display: flex ; padding-left: 40px">
                        <div style="margin: 5px">
                            <select class="form-select" aria-label="Default select example" style="height: 60px">
                                <option selected>Quick Searches</option>
                                <option value="1">Breakfast</option>
                                <option value="2">Coffee</option>
                                <option value="3">Lunch</option>
                                <option value="4">Dinner</option>
                            </select>
                        </div>
                        <div style="margin: 5px">
                            <input type="text" class="form-control" placeholder="Enter your delivery location">
                        </div>
                        <div style="margin: 5px;">
                            <button type="button" style="height: 60px" class="btn btn-danger">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>


<div class="container" style="padding: 50px">







    <div class="row mb-2">
        <c:forEach items="${pro}" var="pro">
            <div class="col-md-3 col-6 " style="width:10%; border-radius: 20px 20px 20px 20px; padding: 10px">
                <div style="width: auto; height: 160px">
                    <img class="card-img-top" src="${pro.productImg}" alt="Card image cap"
                         style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(128,128,128); max-width: 100% ;max-height: 100%">
                </div>
                <div class="card-body"
                     style="background-color: #b9b7b7 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px ">
                    <h5 class="card-title" style="max-width: 100% ;max-height: 100%">${pro.productName} - (Name
                        Merchant)</h5>
                    <p class="card-text">
                        <li>! ${pro.address}</li>
                        <li>&#128337; ${pro.waitTime}</li>
                        <li>$ ${pro.price}</li>
                        <li>% ${pro.sale}</li>
                    </p>
                    <c:if test="${sessionScope.isLogin==true}">
                        <a href="#" class="btn btn-primary">Add to Cart</a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>

</div>


<div class="footer">

</div>
</body>
</html>
<script>
    let idUser = document.getElementById("idUser").value;
    if (idUser != 0) {
        document.getElementById("button-full").hidden = true;

    } else {
        document.getElementById("button-full").hidden = false;
    }
</script>