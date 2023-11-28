<%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 23/10/2023
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>WhatForLunch</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href='https://cdn.jsdelivr.net/gh/startinhit/font-awesome/css/all.css' rel='stylesheet'/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>
<style>
  body {
    margin-top: 20px;
  }

  .avatar {
    width: 200px;
    height: 200px;
  }

  .btn-primary {
    float: right;

  }

</style>
<body>
<div class="container bootstrap snippets bootdey">
  <h1 class="text-primary">Trang cá nhân</h1>
  <hr>
  <form action="/users?action=edit" method="post">
    <div class="row">
      <div class="col-md-3">
        <div class="text-center">
          <img src="${user.getImg()}"
               class="avatar img-circle img-thumbnail"
               alt="avatar" >
          <div style="padding-top: 5px;padding-left: 53px">
          <input type="url" class="form-control" name="img" style="width: 200px" placeholder="nhập đường dẫn ảnh">
          </div>
        </div>
      </div>

      <div class="col-md-9 personal-info">
        <h3>Thông tin người dùng</h3>
        <form class="form-horizontal" role="form" method="post">
          <div class="form-group">
            <label class="col-lg-3 control-label">Họ và tên</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="name" value="${user.name}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email</label>
            <div class="col-lg-8">
              <input class="form-control" type="email" name="email" value="${user.email}" disabled>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Số điện thoại</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="phoneNumber" value="${user.phoneNumber}">
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label">Ngày sinh</label>
            <div class="col-lg-8">
              <input class="form-control" type="date" name="birthday" value="${user.birthday}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Giới tính</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="gender" value="${user.gender}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Địa chỉ</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="address" value="${user.address}">
            </div>
          </div>
          <p style="padding-top: 10px;padding-right: 324px">
            <input style="border-radius: 20px 20px 20px 20px" class="btn btn-primary" type="submit"
                   value="Sửa">
          </p>
        </form>
      </div>
    </div>
  </form>
  <a href="/users?action=home" class="back">
    <button type="submit" class="btn btn-secondary btn-sm" style="background-color: white; border: none;color: black"><i
            class="fa fa-angle-left"></i> Trở về</button>
  </a>

</div>


<footer class="text-center text-lg-start bg-light text-muted">
  <section style="height: 54px" class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
  </section>
  <section class="" style="height: 243px">
    <div class="container text-center text-md-start mt-5">
      <div class="row mt-3">
        <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4" style="margin-left: 104px">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            <i class="fas fa-gem me-3"></i>CT CNHH 5 thành viên
          </h6>
          <p style="font-size: 16px">
            Here you can order all delicious Vietnamese dishes.
          </p>
        </div>
        <div class="col-md-2 col-lg-2 col-xl-2 text-left mb-4">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            Sản phẩm
          </h6>
          <p style="font-size: 16px">Thông tin</p>
          <p style="font-size: 16px">Trợ giúp</p>
        </div>
        <div class="col-md-3 col-lg-2 col-xl-2 text-left mb-4">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            Thành viên
          </h6>
          <p style="font-size: 16px">Ngoc Linh</p>
          <p style="font-size: 16px">Van Tuan</p>
          <p style="font-size: 16px">Cat Hai</p>
          <p style="font-size: 16px">Gia Minh</p>
          <p style="font-size: 16px">Minh Hieu</p>
        </div>
        <div class="col-md-4 col-lg-3 col-xl-3 text-left mb-md-0 mb-4">
          <h6 class="text-uppercase fw-bold mb-4" style="font-size: 19px">
            Liên hệ
          </h6>
          <p style="font-size: 16px">Hoài Đức - Hà Nội</p>
          <p style="font-size: 16px">
            WebWhatForLunch@gmail.com
          </p>
          <p style="font-size: 16px"> +84 88658023</p>
          <p style="font-size: 16px"> +84 38301773</p>
        </div>
      </div>
    </div>
  </section>
  <div class="text-center p-4" style="background-color: lightgray; height: 70px;font-size: 21px; text-align: center">
    © 2023 WebWhatForLunch
  </div>
</footer>

<script>
  const ipnElement = document.querySelector('#ipnPassword')
  const btnElement = document.querySelector('#btnPassword')
  btnElement.addEventListener('click', function () {
    const currentType = ipnElement.getAttribute('type')
    ipnElement.setAttribute(
            'type',
            currentType === 'password' ? 'text' : 'password'
    )
  })
</script>
</body>
</html>