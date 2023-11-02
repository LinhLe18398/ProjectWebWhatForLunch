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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

</head>
<style>
  @import url("https://fonts.googleapis.com/css2?family=Poppins:weight@100;200;300;400;500;600;700;800&display=swap");


  /*body{*/
  /*  background-color:#eee;*/
  /*  font-family: "Poppins", sans-serif;*/
  /*  font-weight: 300;*/
  /*}*/

  /*.height{*/
  /*  height: 100vh;*/
  /*}*/


  .search{
    position: relative;
    box-shadow: 0 0 40px rgba(51, 51, 51, .1);

  }

  .search input{

    height: 60px;
    text-indent: 25px;
    border: 2px solid #d6d4d4;


  }


  /*.search input:focus{*/

  /*  box-shadow: none;*/
  /*  border: 2px solid blue;*/


  /*}*/

  .search .fa-search{

    position: absolute;
    top: 20px;
    left: 16px;

  }

  .search button{

    position: absolute;
    top: 5px;
    right: 5px;
    height: 50px;
    width: 110px;
    background: #FF7F3F;

  }

  /*.div-login-signup {*/
  /*  float: right;*/
  /*  padding-top: 10px;*/
  /*  padding-right: 10px;*/
  /*}*/
.navbar{
  margin-left: 300px;

}

  .text-content{
    margin-top: 150px;
    text-align: center;
  }
  .search{
margin-top: 80px;
    padding-bottom: 30px;
  }
  .header{
    background-image: url("https://png.pngtree.com/thumb_back/fh260/back_our/20190619/ourmid/pngtree-food-overlooking-the-background-banner-image_138613.jpg");

  }

</style>
<body>
<%--<input type="text" value="${user.id}" id="idUser" hidden="hidden">--%>
<%--<div class="div-login-signup" id="button-full">--%>
<%--  <a href="/users?action=login">--%>
<%--    <button type="submit" class="btn btn-primary btn-sm">Login</button>--%>
<%--  </a>--%>
<%--  <a href="/users?action=create">--%>
<%--    <button type="submit" class="btn btn-secondary btn-sm">Signup</button>--%>
<%--  </a>--%>
<%--</div>--%>

<%--<c:if test="${sessionScope.isLogin==true}">--%>
<%--  <nav style="float: right" class="nav">--%>
<%--    <div class="container mt-3">--%>
<%--      <div class="dropdown">--%>
<%--        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">--%>
<%--          &#9776;--%>
<%--        </button>--%>
<%--        <ul class="dropdown-menu">--%>
<%--          <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">edit profile</a></li>--%>
<%--          <li><a class="dropdown-item" href="/users?action=merchant">Register Merchant</a></li>--%>
<%--          <li><a class="dropdown-item" href="/users?action=comfirmpassword">switch merchant</a></li>--%>
<%--          <li><a class="dropdown-item" href="/users?action=logout">log out</a></li>--%>
<%--        </ul>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </nav>--%>
<%--</c:if>--%>
<div class="header">

  <div class="navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item" style="margin-left: 20px">
              <a class="nav-link active" aria-current="page" href="#">Offers</a>
            </li>

            <li class="nav-item dropdown" style="margin-left: 20px">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Restaurant
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>



            <li class="nav-item dropdown" style="margin-left: 20px">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Page
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown" style="margin-left: 20px">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                My Account
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown" style="margin-left: 20px">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Cart
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>

  <div class="text-content">
    <h1 style="color: white">Discover the best food &</h1><br>
    <h1 style="color: white">drinks in Viet Nam</h1>
  </div>

  <div class="search">
    <div class="container">

      <div class="row height d-flex justify-content-center align-items-center">

        <div class="col-md-8">

          <div class="search">
            <i class="fa fa-search"></i>
            <input type="text" class="form-control" placeholder="Enter your delivery">
            <button class="btn btn-primary">Search</button>
          </div>

        </div>

      </div>
    </div>
  </div>


</div>

<div class="content">

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