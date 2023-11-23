<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phamh
  Date: 11/14/2023
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Bill</title>
</head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/home/detailBill.css" type="text/css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>Document</title>
</head>

<body>

<div class="mySidenav">
    <p class="logo1"><span class="menu1">☰</span></p>
    <a href="/products?action=home-merchant" class="icon-a" id="a"><i class="fa fa-utensils icons"></i> Quản lí sản phẩm</a>
    <a href="/bill?action=bill-merchant" class="icon-a" id="b"><i class="fa fa-dolly-flatbed icons"></i> Quản lí đơn</a>
</div>
<div id="main">

    <div class="constructor">
        <div class="item item1">
            <p class="nav"> Merchant</p>

        </div>

        <div class="item item3">
            <div class="profile">
                <img src="https://demoda.vn/wp-content/uploads/2022/09/avatar-facebook-doc-ff.jpg"
                     class="pro-img"/>
                <p class="profile-name"><i class="fa fa-ellipsis-v dots" aria-hidden="true"></i></p>
                <div class="profile-div">
                    <p><i class="fa fa-user "></i><a href="/merchants?action=profile">  Thông tin</a></p>
                    <p><i class="fa fa fa-sign-out "></i><a href="/users?action=home">  Đăng xuất</a></p>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
    <br/>

        <div class="col-div-13">
            <div class="content-box">
                <div class="form-detail">
                    <div class="detail-return">
                        <a href="/bill?action=bill-merchant" id="d"><i class="fa fa-chevron-left icons"></i> Trở lại</a>
                    </div>

                    <div class="detail-status">
                        <input type="hidden" id="inputStatus" value="<c:out value="${bill.getBillStatus()}"/>">
                        <ul id="my-ul" class="progressbar">
                            <li>Chờ nhận hàng</li>
                            <li>Đang chế biến</li>
                            <li>Đã nhận món</li>
                            <li>Đang giao</li>
                            <li>Đã hoàn thành</li>
                        </ul>
                    </div>

                    <hr>
                    <form method="post" action="/bill?action=status-bill"/>
                    <div class="detail-cancel-order">
                        <c:choose>
                            <c:when test="${bill.getBillStatus() == 'Chờ nhận hàng'}">
                                <button class="dt-cancel-order" id="dt-cancel-button"
                                        onclick="declineStatus(<c:out value="${bill.getIdBill()}"/>)"
                                        type="submit"><a id="dt-cancel-a" style="text-decoration: none"
                                                         href="/bill?action=status-bill">Huỷ đơn hàng</a></button>
                                <input type="text" hidden="hidden" id="idBill" name="idBill" value="">
                                <input type="text" hidden="hidden" id="active" name="active" value="">
                            </c:when>

                            <c:when test="${bill.getBillStatus() == 'Nhà hàng từ chối đơn' || bill.getBillStatus() == 'Khách hàng huỷ đơn' }">
                                <button class="dt-cancel-order1" type="submit" disabled>
                                    <a style="text-decoration: none">Đơn hàng đã huỷ</a></button>
                            </c:when>

                            <c:otherwise>
                                <button class="dt-cancel-order1" type="submit" disabled>
                                    <a style="text-decoration: none">Không thể huỷ đơn hàng</a></button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </form>

                    <hr>

                    <div class="detail-time-address">
                        <div class="detail-address">
                            <h2>Địa chỉ nhận hàng</h2>
                            <span class="detail-sp"><c:out value="${bill.getRecipientName()}"/></span><br>
                            <span class="detail-sp" id="phoneNumber"><c:out value="${bill.getRecipientPhone()}"/></span><br>
                            <span class="detail-sp"><c:out value="${bill.getRecipientAddress()}"/></span>
                        </div>
                        <div class="detail-time">
                            <h2>Thời gian nhận hàng</h2>
                            <span class="detail-sp">Thời gian đặt</span>&emsp;
                            &emsp;<span class="detail-sp-tm" id="timeStart"><c:out value="${bill.getTimeOrder()}"/></span><br>
                            <span class="detail-sp">Thời gian dự kiến </span>
                            <span class="detail-sp-tm" id="timeEnd"><c:out value="${bill.getTimeWait()}"/></span>
                        </div>
                    </div>

                    <hr>

                    <div class="detail-orders">
                        <h3 class="detail-h3">MÃ ĐƠN HÀNG: <c:out value="${bill.getIdBill()}"/></h3>
                        <hr>
                    </div>


                    <div class="detail-orders1">
                        <c:forEach items="${billProduct}" var="billProduct">
                            <div class="detail-order">
                                <img src="${billProduct.getProductImg()}">
                                <div class="infor-product">
                                    <h3>${billProduct.getProductName()}</h3>
                                    <span>Phân loại sản phẩm: </span><span>${billProduct.getNote()}</span><br>
                                    <span class="dt-number">x ${billProduct.getQuantity()}</span>
                                </div>
                                <div class="price-product">
                                    <span class="price-sale price" id="sale">${billProduct.getPrice()}</span>
                                    <span class="price-simple price" id="cost">${billProduct.getPrice() - billProduct.getSale()}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="detail-money-bill">
                        <div class="detail-summary">
                            <div class="order-item">
                                <span class="item-label">Tổng tiền hàng:</span>
                                <span class="price-simple price"><c:out value="${bill.getTotalPrice()}"/></span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phí giao hàng:</span>
                                <span class="price-simple price"><c:out value="0"/></span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phí dịch vụ:</span>
                                <span class="price-simple price"><c:out value="${bill.getTotalService()}"/></span>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Giảm giá:</span>
                                <span class="price-simple price"><c:out value="${bill.getTotalSale()}"/></span>
                            </div>
                        </div>
                        <div class="detail-total">
                            <div class="order-item">
                                <p class="item-label">Thành tiền:</p>
                                <p class="item-value price"><c:out value="${bill.getFinalTotal()}"/></p>
                            </div>
                            <div class="order-item">
                                <span class="item-label">Phương thức thanh toán: </span>
                                <span class="item-value "><c:out value="${bill.getPaymentMethod()}"/></span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</div>
<div class="clearfix"></div>
</div>
</body>

<script>
    $(document).ready(function () {
        $(".profile p").click(function () {
            $(".profile-div").toggle();

        });
        $(".noti-icon").click(function () {
            $(".notification-div").toggle();
        });
    });

    let liElements = document.querySelectorAll("#my-ul li");
    let status = document.getElementById("inputStatus").value;
    for (let i = 0; i < liElements.length; i++) {
        let li = liElements[i];
        let liElement = li.textContent;
        li.classList.add("complete");
        if (liElement == "Chờ nhận hàng" &&
            (status == "Huỷ" || status == "Nhà hàng từ chối đơn" || status == "Khách hàng huỷ đơn")) {
            li.innerHTML = status;
            break;
        }

        if (liElement == status) {
            li.classList.remove("complete");
            li.classList.add("active");
            break;
        }
    }

    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber+"₫";
    }

    function approveStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 2;
        location.reload();
    }

    //Xử lí đối tượng DOM
    function formatNumberPhone() {
        let numberElement = document.getElementById("phoneNumber");
        let number = numberElement.textContent;
        let del_number = number.replace('84', '');
        numberElement.textContent = "(+84) " + del_number;
    }

    formatNumberPhone();

    //Tính thời gian giao hàng dự kiến
    function formatTimeDelivery() {
        const timeStart = document.getElementById("timeStart");
        const timeEnd = document.getElementById("timeEnd");
        const timeString = timeStart.textContent.replace(" ", "T");
        const time = new Date(timeString);
        time.setMinutes(time.getMinutes() + Number(timeEnd.textContent));
        time.setHours(time.getHours() + 7);
        const updatedTimeString = time.toISOString().replace("T", " ").replace(".000Z", "");
        timeEnd.textContent = updatedTimeString;
    }

    formatTimeDelivery();

    function declineStatus(idBill) {
        document.getElementById("idBill").value = idBill;
        document.getElementById("active").value = 0;
    }



</script>

</html>