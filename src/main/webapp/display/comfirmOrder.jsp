<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 08/11/2023
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>&#128722; Thanh Toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<style>
    .header {
        display: flex;
        background-image: url("https://png.pngtree.com/thumb_back/fh260/back_our/20190619/ourmid/pngtree-food-overlooking-the-background-banner-image_138613.jpg");
    }

    .hh {
        background-color: white;
    }

    #xmas-popup .popup-content {
        width: 500px;
        height: 400px;
        background: white;
        margin: 100px auto;
        position: relative;
        border: 5px solid #fff;
    }

    .popup {
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        background: rgba(0, 0, 0, 0.6);
        display: none;
    }

    .popup:target {
        display: block;
    }
</style>
<body>
<form action="/users?action=order" method="get">
    <header style="margin-bottom: 15px">
        <div class="hh">
            <div class="header container">
                <div style="color:#FF7F3F ; padding: 20px ; font-size: 30px;display: inline-block">
                    &#128722; | Thanh Toán
                </div>
                <div class="navbar" style="padding-bottom: 0;margin-left: 400px">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light"
                         style="background-color: rgb(255,255,255,0) !important; padding-top: 0">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="#" style="color: #ffffff">Home</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item" style="margin-left: 20px">
                                        <a class="nav-link active" aria-current="page" href="#"
                                           style="color: #ffffff">Offers</a>
                                    </li>

                                    <li class="nav-item dropdown" style="margin-left: 20px">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false" style="color: #ffffff">
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
                                           data-bs-toggle="dropdown" aria-expanded="false" style="color: #ffffff">
                                            ${user.name}
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa
                                                thông
                                                tin</a></li>
                                            <li><a class="dropdown-item" href="/users?action=merchant">Đăng ký quán</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="/users?action=logout">Đăng suất</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <div class="container"
         style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px;">
    <span style="box-sizing: inherit; line-height: 2.0em">
        <span style="color: #FF7F3F;font-weight: 700">
            <i class="fa fa-map-marker" aria-hidden="true"></i>
            Địa Chỉ Nhận Hàng
        </span>
       <div style="display: flex">
           <p style="padding-right: 40px;margin-bottom: 0; font-weight: 800">Vương Văn Tuấn 0388301773</p>
        <p style="padding-right: 250px ; margin-bottom: 0">Trường Đại Học Thành Đô, Đường Quốc Lộ 32, Lai Xá, Xã Kim Chung, Huyện Hoài Đức, Hà Nội</p>

          <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal"
             style="text-decoration: none; color: blue">Thay Đổi</a>
           <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Địa Chỉ Của Tôi</h5>
                        </div>
                        <div class="modal-body">
                           <div class="form-check " style="margin-bottom: 0">

                               <a href="#xmas-popup" class="button"
                                  style="text-decoration: none;float: right">Cập Nhập</a>
                               <div id="xmas-popup" class="popup" href="#">
                                    <div class="popup-content">
                                        <label>Cập nhật địa chỉ</label>
                                        <hr>
                                        <div id="updateAddress" style="padding: 10px">
                                          <form action="">
                                            <p>
                                            <input type="text" placeholder="Họ và tên" disabled>
                                            <input type="text" placeholder="Số điện thoại" disabled>
                                            </p>
                                            <p>
                                                <input style="width: 100%" type="text" placeholder="Nhập Địa chỉ">
                                            </p>
                                          </form>
                                         <p>
                                            <a href="/users?action=order" class="btn btn-outline-secondary">Hủy</a>
                                            <button type="submit" class="btn btn-outline-primary">Xác Nhận</button>
                                         </p>
                                        </div>
                                    </div>
                               </div>

                               <c:forEach items="${address}" var="showAddress">

                                   <label class="form-check-label" for="flexRadioDefault1" style="padding-right: 10px">
                                       <input class="form-check-input" type="radio" name="flexRadioDefault"
                                              id="flexRadioDefault1">
                                    ${showAddress.recipientName} <span
                                           style="color: rgb(128,128,128)"> | ${showAddress.recipientPhone}</span>
                                      <div style="color: rgb(128,128,128);padding-right: 100px">
                                              ${showAddress.detailedAddress}
                                      </div>
                                   </label>
                               </c:forEach>
                           </div>
                            <div>
                                <p style="padding-bottom: 3px"
                                   class="btn btn-outline-secondary card-address" onclick="openForm()">+ Thêm địa chỉ mới</p>
                                <div id="myForm" hidden="hidden">
                                    <form action="/users?action=create-new-address" method="post">
                                        <p>
                                        <input type="text" placeholder="Họ và tên" name="name">
                                        <input type="text" placeholder="Số điện thoại" name="phone">
                                        </p>
                                        <p>
                                            <input style="width: 100%" type="text" placeholder="Địa chỉ" name="address">
                                        </p>
                                        <p>
                                        <button type="button" class="btn btn-outline-secondary" onclick="closeForm()">Hủy</button>
                                        <button type="submit" class="btn btn-outline-primary">Xác Nhận</button>
                                    </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary ss" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary ">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </span>
    </div>

    <div class="container"
         style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px;">
    <span style="box-sizing: inherit; line-height: 2.0em">
       <table id="cart" class="table table-condensed">
            <thead>
                <tr>
                    <th style="width:50%">Sản Phẩm</th>
                    <th style="width:10%">Đơn Giá</th>
                    <th style="width:8%">Số lượng</th>
                    <th style="width:22%" class="text-center">Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-th="Product">
                        <div class="row">
                            <div class="col-sm-2 hidden-xs">
                                <img src=""
                                     alt="" width="100">
                            </div>
                            <div class="col-sm-10">
                                <h4 class="nomargin" style="padding-left: 5px">Trà sữa trân châu</h4>
                                <p style="padding-left: 5px">full topping</p>
                            </div>
                        </div>
                    </td>
                    <td data-th="Price">50,000 ₫</td>
                    <td data-th="Quantity">
                        <label>1</label>
                    </td>
                    <td data-th="Subtotal" class="text-center">50,000 ₫</td>
                </tr>
            </tbody>
           <td>
                <div style="padding: 10px; width: 100%">
                  <label style="padding-right: 10px">Lời Nhắn:</label>
                  <input style="height: 30px" type="text" placeholder=" Lưu ý cho Người bán...">
                </div>
           </td>
    </table>
    </span>
    </div>


    <div class="container"
         style="box-shadow: rgba(0, 0, 0, 0.4) 0 0 10px; margin-bottom: 10px; padding: 20px">
    <span style="line-height: 2.0em">
       <table id="buy" class="table table-condensed">
            <tbody style="padding: 10px">
               <div style="display: flex">
                    <div style="margin-right: 600px">
                        <select class="form-select" aria-label="Default select example" style="width: 400px">
                          <option selected>Phương Thức Thanh Toán</option>
                          <option value="1">Thanh toán khi nhận hàng</option>
                          <option value="2">Thẻ tín dụng/Ghi nợ</option>
                          <option value="3">Bank</option>
                        </select>
                    </div>
                    <div>
                        <label style="padding-right: 50px">
                            Tổng Thanh Toán:
                        </label>
                        <label>
                            200,000 ₫
                        </label>
                    </div>
               </div>
            </tbody>
            <tfoot>
                <tr style="display: flex; float: right">
                    <td style="float: right">
                        <a style="float: right" href="" class="btn btn-success btn-block">Đặt Hàng</a>
                    </td>
                </tr>
                <tr style="float: left;padding-top: 10px">
                     <td style="float: left">
                          <a style="float: left;text-decoration: none;color: #FF7F3F" href="/users?action=home"><i
                                  class="fa fa-angle-left"></i>Trang chủ</a>
                     </td>
                </tr>
           </tfoot>
       </table>
    </span>
    </div>
</form>
</body>

<script>
    function openForm() {
        let address = document.getElementsByClassName("card-address");

        for (let i = 0; i < address.length; i++) {
            address[i].display = "none"
        }
        document.getElementById("myForm").hidden = false;
    }

    function closeForm() {
        let ss = document.getElementsByClassName("ss");
        for (let i = 0; i < ss.length; i++) {
            ss[i].display = "block";
        }
        document.getElementById("myForm").hidden = true;
    }
</script>
</html>

