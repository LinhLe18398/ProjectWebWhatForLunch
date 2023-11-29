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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/home/detailBill.css" type="text/css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>Merchant Home</title>

    <style>
        .header {
            /*display: flex;*/
            background-image: url("https://gofood.in/public/assets/webs/img/bg.png");
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            background-color: rgb(255, 255, 255, 0.5) !important;
            padding-top: 11px;
            height: 95px;
        }


        .overlay {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.3);
            pointer-events: none;
        }
    </style>
</head>

<body>
<div class="header container">
    <div class="overlay"></div>
    <div class="navbar" style="margin-left: 20px">
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
             style="background-color: rgb(255,255,255,0) !important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="/users?action=home" style="color: white; font-size: 20px">Trang
                    chủ</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <c:if test="${sessionScope.isLogin==true}">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 609px">
                        <%--                    <li style="padding-top: 8px">--%>
                        <%--                        <a href="#" id="a" onclick="listClick(this.id)"--%>
                        <%--                           style="color: white; font-size: 19px; padding-right: 35px; text-decoration: none">Quản lí sản--%>
                        <%--                            phẩm</a>--%>
                        <%--                    </li>--%>
                        <%--                    <li style="padding-top: 8px">--%>
                        <%--                        <a href="#" id="b" onclick="listClick(this.id)"--%>
                        <%--                           style="color: white; font-size: 19px; text-decoration: none"> Quản lí đơn</a>--%>
                        <%--                    </li>--%>
                    <li style="padding-top: 8px">
                        <a href="/products?action=home-merchant" id="a" onclick="listClick(this.id)"
                           style="color: white; font-size: 19px; padding-right: 30px; text-decoration: none">Quản lí sản
                            phẩm</a>
                    </li>
                    <li style="padding-top: 8px">
                        <a href="/bill?action=bill-merchant" id="b" onclick="listClick(this.id)"
                           style="color: white; font-size: 19px; text-decoration: none"> Quản lí đơn</a>
                    </li>
                        <%--                    <li class="nav-item dropdown" style="margin-left: 20px">--%>
                        <%--                        <a class="nav-link" href="/products?action=cart" role="button" aria-expanded="false"--%>
                        <%--                           style="color: white; font-size: 19px; ">--%>
                        <%--                            Giỏ hàng--%>
                        <%--                        </a>--%>
                        <%--                    </li>--%>

                        <%--                    <li style="padding-top: 8px">--%>
                        <%--                        <a style="color: white; font-size: 19px; padding-right: 35px; text-decoration: none; margin-left: 30px"--%>
                        <%--                           href="/users?action=home">Đăng xuất</a>--%>
                        <%--                    </li>--%>
                    <li class="nav-item dropdown" style="margin-left: 20px">
                        <a class="nav-link" href="/bill?action=income-merchant" role="button" aria-expanded="false"
                           style="color: white; font-size: 19px; ">Doanh thu</a>
                    </li>

                    <li style="padding-top: 8px">
                        <a style="color: white; font-size: 19px; padding-right: 30px; text-decoration: none; margin-left: 20px"
                           href="/users?action=home">Đăng xuất</a>
                    </li>
                </ul>
            </div>
            </c:if>
    </div>
    </nav>
</div>
</div>

<div class="item item3">
    <div class="notification-div">
        <hr class="hr"/>
    </div>
</div>
</div>

<div class="clearfix"></div>
<br/>
<div class="clearfix"></div>
<br/>

<div class="container cb box">
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
                                                     href="/products?action=home-merchant">Huỷ đơn hàng</a></button>
                            <input type="text" hidden="hidden" id="idBill" name="idBill" value="">
                            <input type="text" hidden="hidden" id="active" name="active" value="">
                        </c:when>

                        <%--                            <c:when test="${bill.getBillStatus() == 'Huỷ'}">--%>
                        <%--                                <button class="dt-cancel-order1" type="submit" disabled>--%>
                        <%--                                    <a style="text-decoration: none">Đơn hàng đã huỷ</a></button>--%>
                        <%--                            </c:when>--%>

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
                        <p><c:out value="${bill.getRecipientName()}"/></p>
                        <span class="detail-sp" id="phoneNumber"><c:out value="${bill.getRecipientPhone()}"/></span><br>
                        <span class="detail-sp"><c:out value="${bill.getRecipientAddress()}"/></span>
                    </div>
                    <div class="detail-time">
                        <h2>Thời gian nhận hàng</h2>
                        <p></p>
                        <span class="detail-tm">Thời gian đặt</span>&emsp;
                        &emsp;&nbsp;<span class="detail-sp-tm" id="timeStart"><c:out value="${bill.getTimeOrder()}"/></span><br>
                        <span class="detail-tm">Thời gian dự kiến </span>
                        <span class="detail-sp-tm" id="timeEnd"><c:out value="${bill.getTimeWait()}"/></span>
                    </div>
                </div>

                <hr>

                <div class="detail-orders">
                    <h3 class="detail-h3">MÃ ĐƠN HÀNG. <c:out value="${bill.getIdBill()}"/></h3>
                    <hr>
                </div>


                <div class="detail-orders1">
                    <c:forEach items="${billProduct}" var="billProduct">
                        <div class="detail-order">
                            <img src="${billProduct.getProductImg()}">
                            <div class="infor-product">
                                <h3>${billProduct.getProductName()}</h3>
                                <span>Phân loại sản phẩm</span><span>${billProduct.getNote()}</span><br>
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
                            <span class="item-value price"><c:out value="${bill.getTotalPrice()}"/></span>
                        </div>
                        <div class="order-item">
                            <span class="item-label">Phí giao hàng:</span>
                            <span class="item-value price"><c:out value="0"/></span>
                        </div>
                        <div class="order-item">
                            <span class="item-label">Phí dịch vụ:</span>
                            <span class="item-value price"><c:out value="${bill.getTotalService()}"/></span>
                        </div>
                        <div class="order-item">
                            <span class="item-label">Giảm giá:</span>
                            <span class="item-value price"><c:out value="${bill.getTotalSale()}"/></span>
                        </div>
                    </div>
                    <div class="detail-total">
                        <div class="order-item">
                            <p class="item-label">Thành tiền:</p>
                            <p class="item-value price"><c:out value="${bill.getFinalTotal()}"/></p>
                        </div>
                        <div class="order-item">
                            <span class="item-label">Phương thức thanh toán: </span>
                            <span class="item-value"><c:out value="${bill.getPaymentMethod()}"/></span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</div>
<div class="clearfix"></div>
</div>

<footer class="text-center text-lg-start bg-light text-muted" style="margin-top: 80px">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    </section>
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4" style="margin-left: 104px">
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3"></i>CT CNHH 5 thành viên
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
                    <h6 class=" text-uppercase fw-bold mb-4">
                        Liên hệ
                    </h6>
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
        // if (liElement == "Chờ nhận hàng" && status == "Huỷ") {
        //     li.innerHTML = "Huỷ";
        //     break;
        // }

        if (liElement == "Chờ nhận hàng" &&
            (status == "Nhà hàng từ chối đơn" || status == "Khách hàng huỷ đơn")) {
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