<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>

  <style>
    .gradient-custom-3 {
      background-image: url("https://static.vecteezy.com/system/resources/previews/016/030/491/non_2x/top-view-of-traditional-korean-food-on-a-table-illustration-delicious-korean-bbq-grill-with-all-small-side-dishes-set-beef-and-pork-korean-barbecue-asian-food-background-vector.jpg");
      background-repeat: no-repeat;
      background-size: cover;
    }

    .gradient-custom-4 {
      background: #84fab0;
      background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
      background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
    }

    #alert_password {
      border: none;
    }

    .success {
      text-align: center;
      color: green;
    }

    .error {
      text-align: center;
      color: red;
    }
    .overlay {
      position: absolute;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      background-color: rgba(0, 0, 0, 0.1);
      pointer-events: none;
    }

  </style>
  <title>WhatForLunch</title>
</head>

<body>
<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="overlay"></div>
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Đăng nhập</h2>

              <form method="post" action="/users?action=login">

                <div class="form-outline mb-4">
                  <label class="form-label" for="email">Email</label>
                  <input type="email" id="email" name="email" class="form-control form-control-lg"
                         placeholder="email"/>
                </div>

                <div class="form-outline mb-4">
                  <label class="form-label" for="password">Mật khẩu</label>
                  <input type="password" id="password" name="password"
                         class="form-control form-control-lg password" placeholder="mật khẩu"/>
                  <p id="alert_password"></p>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="submit" id="submit_button"
                          class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng nhập
                  </button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Tôi chưa có tài khoản? <a
                        href="/users?action=create" class="fw-bold text-body"><u> Đăng ký</u></a></p>
              </form>
            </div>
          </div>
        </div>
        </form>

      </div>
    </div>
  </div>
</section>
</body>

</html>
