<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <style>
    body {
      top: 0;
      margin: 0;
      height: 100%;
      font-family: Arial, sans-serif;
      background-image: url("https://thuthuatnhanh.com/wp-content/uploads/2022/09/hinh-nen-powerpoint-chu-de-mon-an-dep-don-gian.jpeg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;

    }

    .card-registration .select-input.form-control[readonly]:not([disabled]) {
      font-size: 1rem;
      line-height: 2.15;
      padding-left: .75em;
      padding-right: .75em;
    }

    .card-registration .select-arrow {
      top: 13px;
    }

    #alert_retype_password, #alert_password {
      border: none;
    }
    .alert{
      color: blue;
      text-align: center;
    }
  </style>
  <title>WhatForLunch</title>
</head>
<section class="h-100 ">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="https://png.pngtree.com/background/20210711/original/pngtree-restaurant-latest-menu-menu-promotion-poster-background-template-picture-image_1089188.jpg"
                   alt="Sample photo" class="img-fluid"
                   style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem; max-width: 100%"/>
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h2 class="mb-4 text-uppercase text-success fw-normal">Đăng ký nhà hàng</h2>
                <form action="/users?action=merchant" method="post">

                  <div class="row">
                    <div class="col-md-6 mb-4">
                      <div class="form-outline">
                        <input type="text" id="form3Example1m"
                               class="form-control form-control-lg"
                               placeholder="tên nhà hàng" name="restaurantName">
                      </div>
                    </div>
                    <div class="col-md-6 mb-4">
                      <div class="form-outline">
                        <input type="text" id="form3Example1n"
                               class="form-control form-control-lg"
                               placeholder="số điện thoại nhà hàng" name="restaurantPhoneNumber">
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6 mb-4">
                      <div class="form-outline">
                        <input type="email" id="form3Example1m1"
                               class="form-control form-control-lg"
                               placeholder="email nhà hàng" name="restaurantEmail">
                      </div>
                    </div>
                    <div class="col-md-6 mb-4">
                      <div class="form-outline">
                        <input type="text" id="form3Example1n1"
                               class="form-control form-control-lg"
                               placeholder="địa chỉ nhà hàng" name="restaurantAddress">
                      </div>
                    </div>
                  </div>


                  <div class="d-flex justify-content-center">
                    <input type="submit" id="submit_button"
                           class="btn btn-success btn-block btn-lg gradient-custom-4 text-body col-10"
                           value="Đăng ký"/>
                  </div>
                  <c:if test="${ not empty alert}">
                    <h3 class="alert">${alert}</h3>
                  </c:if>
                  <p class="text-center text-muted mt-5 mb-0">Bạn đã có nhà hàng? <a
                          href="/users?action=comfirmpassword" class="fw-bold text-body"><u
                          class="text">Đăng nhập</u></a></p>
                </form>
                <a href="/users?action=home" class="back">
                  <button type="submit" class="btn btn-secondary btn-sm" style="background-color: white; border: none;color: black"><i
                          class="fa fa-angle-left"></i>Trở về</button>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>

<script>
  function check_password() {
    let passwords = document.getElementsByClassName("password");
    let password = passwords[0].value;
    let passwordLv0 = /^.{8,}$/;

    let alert_password = document.getElementById("alert_password");
    alert_password.textContent = "";
    if (!passwordLv0.test(password)) {
      alert_password.textContent = "More than 8 characters!";
      alert_password.style.color = "red";
    }
  }

  function check_retype_password() {
    let passwords = document.getElementsByClassName("password");
    let password = passwords[0].value;
    let retypePassword = passwords[1].value;

    let alert_retype_password = document.getElementById("alert_retype_password");
    let submit_button = document.getElementById("submit_button");

    if (password != retypePassword) {
      alert_retype_password.textContent = "Passwords do not match!";
      alert_retype_password.style.color = "red";
    } else if (password == retypePassword) {
      alert_retype_password.textContent = "Passwords match!";
      alert_retype_password.style.color = "green";
    }
  }
</script>