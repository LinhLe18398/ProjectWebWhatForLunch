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




<div class="footer" style="margin-top: 100px">
  <!-- Footer -->
  <footer class="text-center text-lg-start bg-white text-muted">
    <!-- Section: Social media -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
      <!-- Left -->
<%--      <div class="me-5 d-none d-lg-block">--%>
<%--        <span>Get connected with us on social networks:</span>--%>
<%--      </div>--%>
      <!-- Left -->

      <!-- Right -->
      <div>
        <a href="" class="me-4 link-secondary">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="" class="me-4 link-secondary">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="" class="me-4 link-secondary">
          <i class="fab fa-google"></i>
        </a>
        <a href="" class="me-4 link-secondary">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="" class="me-4 link-secondary">
          <i class="fab fa-linkedin"></i>
        </a>
        <a href="" class="me-4 link-secondary">
          <i class="fab fa-github"></i>
        </a>
      </div>
      <!-- Right -->
    </section>
    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="">
      <div class="container text-center text-md-start mt-5">
        <!-- Grid row -->
        <div class="row mt-3">
          <!-- Grid column -->
          <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
            <!-- Content -->
            <h6 class="text-uppercase fw-bold mb-4">
              <i class="fas fa-gem me-3 text-secondary"></i>Company Food
            </h6>
            <p>
              Here you can order all delicious Vietnamese dishes.
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">
              Products
            </h6>
            <p>
              <a href="#!" class="text-reset">Angular</a>
            </p>
            <p>
              <a href="#!" class="text-reset">React</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Vue</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Laravel</a>
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">
              Useful links
            </h6>
            <p>
              <a href="#!" class="text-reset">Pricing</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Settings</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Orders</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Help</a>
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
            <p><i class="fas fa-home me-3 text-secondary"></i> Hoài Đức, Hà Nội</p>
            <p>
              <i class="fas fa-envelope me-3 text-secondary"></i>
              lengoclinh18398@gmail.com
            </p>
            <p><i class="fas fa-phone me-3 text-secondary"></i> +84 888658023</p>
            <p><i class="fas fa-print me-3 text-secondary"></i> +84 388301773</p>
          </div>
          <!-- Grid column -->
        </div>
        <!-- Grid row -->
      </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-4" style="background-color: lightgray;">
      © 2023 WebWhatForLunch
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->
</div>
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