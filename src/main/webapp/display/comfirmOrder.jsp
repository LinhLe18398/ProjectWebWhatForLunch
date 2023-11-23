<%@ page import="com.example.webwhatforlunch.model.Bill" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webwhatforlunch.model.Product" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<style>
    .header {
        display: flex;
        background-image: url("https://gofood.in/public/assets/webs/img/bg.png");
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        background-color: rgb(255, 255, 255, 0.5) !important;
    }

    .hh {
        background-color: white;
    }

    #xmas-popup .popup-content {
        width: 500px;
        height: 400px;
        background: white;
        margin: 210px auto;
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

    .bill-address {
        border: none;
    }

    .detail-address {
        border-top-style: hidden;
        border-right-style: hidden;
        border-left-style: hidden;
        border-bottom-style: hidden;
    }

    .detail-address::placeholder {
        color: white;
    }

    .detail-address:focus {
        outline: none;
    }

    .no_border_button {
        background: white;
        border: none;
        color: red;
        float: right;
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
                <div class="navbar" style="padding-bottom: 0;margin-left: 600px">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light"
                         style="background-color: rgb(255,255,255,0) !important; padding-top: 0">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="/users?action=home" style="color: #ffffff">Trang Chủ</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item dropdown" style="margin-left: 20px">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false" style="color: #ffffff">
                                            Trang
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
                                           data-bs-toggle="dropdown" aria-expanded="false"
                                           style="color: white; font-size: 18px">
                                            ${user.name}
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông
                                                tin</a></li>
                                            <li><a class="dropdown-item" href="/bill?action=bill-user">Đơn đã đặt</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>

                                            <li><a class="dropdown-item" href="/users?action=logout">Đăng xuất</a></li>

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
            Địa chỉ nhận hàng
        </span>
       <div style="display: flex">
           <input class="detail-address" style="width:200px;font-weight: 800" type="text" id="recipient-name" readonly
                  disabled>
           <input class="detail-address" style="width: 125px; font-weight: 800" type="text" id="recipient-phone"
                  readonly disabled>
           <input class="detail-address" style="width: 400px" type="text" id="recipient-Address" readonly disabled>

          <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal"
             style="text-decoration: none; color: blue;padding-left: 450px ">Thay đổi</a>
           <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="margin-top: 210px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Địa chỉ của tôi</h5>
                        </div>
                        <div class="modal-body">
                           <div class="form-check " style="margin-bottom: 0">
                               <div id="xmas-popup" class="popup" href="#">
                                    <div class="popup-content">
                                        <div style="display: inline-block">
                                            <h5>Cập nhật địa chỉ</h5>
                                        </div>
                                        <div style="float: right;padding: 5px">
                                           <a href="/users?action=order" style="list-style-type: none; float: right"><i style="color: red;padding-top: 3px; padding-right:5px; font-size: 22px" class="fas fa-times"></i></a>
                                        </div>
                                        <hr>
                                        <form id="updateForm" action="/users?action=updateAddress" method="post">
                                        <div style="padding: 10px">
                                              <input type="hidden" id="updateAddressId" name="addressId">
                                            <p>
                                            <input type="text" style="margin-right: 21px;width: 220px" placeholder="Họ và tên" id="update-name" name="name">
                                            <input type="text" style="width: 220px" placeholder="Số điện thoại" id="update-phone"
                                                   name="phone">
                                            </p>
                                            <p>
                                                <input style="width: 100%" type="text" placeholder="Nhập Địa chỉ"
                                                       id="update-Address" name="address">
                                            </p>
                                              <div id="successMessage" style="display: none;color: green">
                                                Cập nhật thành công!
                                            </div>
                                         <p>
                                            <button type="button" class="btn btn-outline-primary"
                                                    onclick="submitUpdateForm()">Xác nhận</button>
                                         </p>
                                        </div>
                                        </form>
                                    </div>
                               </div>
                               <form action="/users?action=delete-address" method="post">
                               <c:forEach items="${address}" var="showAddress">

                                   <a href="#xmas-popup"
                                      onclick="selectAddressForUpdate('${showAddress.idAddress}', '${showAddress.recipientName}', '${showAddress.recipientPhone}', '${showAddress.detailedAddress}')"
                                      class="button"
                                      style="text-decoration: none;float: right">Cập nhật</a>

                                   <label class="form-check-label" for="flexRadioDefault1" style="padding-right: 10px">
                                       <input class="form-check-input" onclick="selectAddress(${showAddress.idAddress})"
                                              type="radio" name="flexRadioDefault" id="flexRadioDefault1"
                                              value="${showAddress.idAddress}">
                                       <input class="bill-address${showAddress.idAddress} detail-address" name="name"
                                              value="${showAddress.recipientName}" disabled>
                                       <input class="bill-address${showAddress.idAddress} detail-address"
                                              style="color: rgb(128,128,128)" name="phone"
                                              value="${showAddress.recipientPhone}" disabled>
                                       <input class="bill-address${showAddress.idAddress} detail-address"
                                              style="color: rgb(128,128,128);width: 350px"
                                              value=" ${showAddress.detailedAddress}" disabled>
                                   </label>
                               </c:forEach>
                                   <button class="no_border_button btn btn-light" type="submit"
                                           onclick="confirmDelete()">Xóa</button>
                               </form>
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
                                        <button type="submit" class="btn btn-outline-primary">Xác nhận</button>
                                    </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary ss" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary ss" data-bs-dismiss="modal">Xác nhận</button>
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
                    <th style="width:50%">Sản phẩm</th>
                    <th style="width:10%">Đơn giá</th>
                    <th style="width:8%">Số lượng</th>
                    <th style="width:22%" class="text-center">Thành tiền</th>
                </tr>
            </thead>

            <tbody>
             <c:forEach items="${product}" var="product">
                 <input type="hidden" class="id" value="${product.idProduct}">
                 <tr>
                    <td data-th="Product">
                        <div class="row">
                            <div class="col-sm-2 hidden-xs">
                                <img src="${product.productImg}"
                                     alt="" width="100">
                            </div>
                            <div class="col-sm-10">
                                <h4 class="nomargin" style="padding-left: 5px">${product.productName}</h4>
                                <p style="padding-left: 5px">${product.note}</p>
                            </div>
                        </div>
                    </td>
                    <td data-th="Price" class="price money">${product.price}</td>
                    <td data-th="Quantity">
                        <label class="quantity">${product.quantity}</label>
                    </td>
                    <td data-th="Subtotal" class="text-center total money"> </td>
                </tr>
                 <td>
                    <div style="padding: 10px; width: 100%">
                      <label style="padding-right: 10px">Lời nhắn:</label>
                      <input name="orderNote" style="height: 30px" type="text" placeholder="Lưu ý cho người bán...">
                    </div>
                 </td>
             </c:forEach>
            </tbody>
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
                        <select name="paymentMethod" class="form-select" aria-label="Default select example"
                                style="width: 400px" onchange="select(this.value)">
                          <option selected>Phương thức thanh toán</option>
                          <option value="COD">Thanh toán khi nhận hàng</option>
                          <option value="Card">Thanh toán luôn</option>
                        </select>
                    </div>
                    <div>
                        <label style="padding-right: 50px" id="totalAll" class="money">
                            Tổng Thanh Toán:
                        </label>
                        <label>

                        </label>
                    </div>
               </div>
            </tbody>
            <tfoot>
                <tr style="display: flex; float: right">
                    <td style="float: right">
                        <form method="post" action="/bill?action=confirm-bill">
                            <input type="hidden" name="listId" id="listId" value="">
                            <input type="hidden" name="listQuantity" id="listQuantity" value="">
                            <input style="float: right" type="submit" class="btn btn-success btn-block "
                                   value="Đặt Hàng">
                            <c:forEach items="${address}" var="showAddress">
                                   <label hidden="hidden" class="form-check-label" for="flexRadioDefault1"
                                          style="padding-right: 10px">
                                       <input hidden="hidden" class="form-check-input"
                                              onclick="selectAddress(${showAddress.idAddress})" type="radio"
                                              name="flexRadioDefault" id="flexRadioDefault">
                                       <input hidden="hidden"
                                              class="bill-address${showAddress.idAddress} detail-address" name="name"
                                              value="${showAddress.recipientName}">
                                       <input hidden="hidden"
                                              class="bill-address${showAddress.idAddress} detail-address" name="phone"
                                              value="${showAddress.recipientPhone}">
                                       <input hidden="hidden"
                                              class="bill-address${showAddress.idAddress} detail-address" name="address"
                                              value=" ${showAddress.detailedAddress}">
                                       <input hidden="hidden"
                                              class="bill-address${showAddress.idAddress} detail-address" name="payment"
                                              value="" id="payment">
                                   </label>
                            </c:forEach>
                        </form>
                    </td>
                </tr>
                <tr style="float: left;padding-top: 10px">
                     <td style="float: left">
                          <a style="float: left;text-decoration: none;color: #FF7F3F" href="/users?action=home"><i
                                  class="fa fa-angle-left"></i>Trang Chủ</a>
                     </td>
                </tr>
           </tfoot>
       </table>
    </span>
    </div>


</form>

</body>
<script>
    function submitUpdateForm() {
        var addressId = document.getElementById("updateAddressId").value;
        var name = document.getElementById("update-name").value;
        var phone = document.getElementById("update-phone").value;
        var address = document.getElementById("update-Address").value;

        var confirmation = confirm("Bạn có chắc muốn cập nhật địa chỉ?");
        if (confirmation) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/users?action=updateAddress", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                    showSuccessMessage();
                }
            };
            var data = "addressId=" + encodeURIComponent(addressId) +
                "&name=" + encodeURIComponent(name) +
                "&phone=" + encodeURIComponent(phone) +
                "&address=" + encodeURIComponent(address);

            xhr.send(data);
        }else {
            hidePopup();
        }

    }

    function showSuccessMessage() {
        var successMessage = document.getElementById("successMessage");
        successMessage.style.display = "block";
    }

    function selectAddressForUpdate(id, name, phone, address) {
        document.getElementById("updateAddressId").value = id;
        document.getElementById("update-name").value = name;
        document.getElementById("update-phone").value = phone;
        document.getElementById("update-Address").value = address;

        openPopup();
    }

    function openPopup() {
        var popup = document.getElementById("xmas-popup");
        popup.style.display = "block";
    }

    function hidePopup(event) {
        event.preventDefault();
        var popup = document.getElementById("xmas-popup");
        popup.style.display = "none";
    }


    let totalProduct = 0;
    let price = document.getElementsByClassName("price");
    let id = document.getElementsByClassName("id");
    let quantity = document.getElementsByClassName("quantity");
    let total = document.getElementsByClassName("total");

    let listId = document.getElementById("listId");
    let listQuantity = document.getElementById("listQuantity");

    for (let i = 0; i < price.length; i++) {
        let dataPrice = price[i].innerHTML;
        let dataQuantity = quantity[i].innerHTML;
        let totalPrice = dataPrice * dataQuantity;
        total[i].innerHTML = totalPrice + " ₫";
        price[i].innerHTML = dataPrice + " ₫";
        quantity[i].innerHTML = dataQuantity;
        listId.value += "/" + id[i].value;
        listQuantity.value += "/" + quantity[i].innerHTML;
        totalProduct += totalPrice;
    }
    console.log(listId.value)
    console.log(listQuantity.value)

    document.getElementById("totalAll").innerHTML = "Tổng Thanh Toán: " + totalProduct + " ₫";

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

    function selectAddress(idAddress) {
        let address = document.getElementsByClassName("bill-address" + idAddress);
        document.getElementById("recipient-name").value = address[0].value;
        document.getElementById("recipient-phone").value = address[1].value;
        document.getElementById("recipient-Address").value = address[2].value;
    }

    function select(selected) {
        document.getElementById("payment").value = selected;
    }


    function confirmDelete() {
        var selectedAddress = document.querySelector('input[name="flexRadioDefault"]:checked');

        if (selectedAddress) {
            var confirmation = confirm("Bạn có chắc chắn muốn xóa địa chỉ này?");

            if (confirmation) {
                document.forms[0].submit();
            }
        } else {
            alert("Vui lòng chọn một địa chỉ để xóa.");
        }
    }


</script>
</html>

