<%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 13/11/2023
  Time: 15:31
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
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>


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

    .hh {
        background-color: white;
    }

    ::placeholder {
        color: gray;
    }

    #button-group {
        padding: 10px 0px;
        margin-bottom: 10px;
        text-align: center;
    }

    .group-button {
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        display: inline;
        font-family: "sans-serif";
        font-weight: bold;
        font-size: 20px;
        color: darkslategray;

    }

    .group-button.active {
        color: orange;
        border-bottom: 2px solid orange;
    }

    .overlay {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.5);
        pointer-events: none;
    }


</style>
</head>
<body>

<div class="header container">
    <div class="overlay"></div>
    <div class="navbar" style="margin-left: 600px">
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
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: white; font-size: 20px">
                                Nhà hàng
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/users?action=comfirmpassword">Chuyển sang
                                    nhà hàng của tôi</a></li>
                            </ul>
                        </li>


                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: white; font-size: 20px">
                                ${user.name}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông
                                    tin</a></li>
                                <li><a class="dropdown-item" href="/users?action=merchant">Đăng ký quán</a>
                                </li>
                                <li><a class="dropdown-item" href="/display/billUser.jsp">Đơn đã đặt</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li><a class="dropdown-item" href="/users?action=logout">Đăng xuất</a></li>

                            </ul>
                        </li>

                        <li class="nav-item dropdown" style="margin-left: 20px">
                            <a class="nav-link" href="/products?action=cart" role="button" aria-expanded="false"
                               style="color: white; font-size: 19px">
                                Giỏ hàng
                            </a>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container" id="button-group" style="margin-top: 30px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px">

    <div class="group-button" onclick="changeColor(0)">Tất cả</div>
    <div class="group-button" onclick="changeColor(1)">Chờ nhận hàng</div>
    <div class="group-button" onclick="changeColor(2)">Đang chế biến</div>
    <div class="group-button" onclick="changeColor(3)">Đã nhận món</div>
    <div class="group-button" onclick="changeColor(4)">Đang giao</div>
    <div class="group-button" onclick="changeColor(5)">Đã hoàn thành</div>
    <div class="group-button" onclick="changeColor(6)">Huỷ</div>
</div>


<div class="search" style="margin-top: 30px; ">
    <div class="container" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px">
        <input type="search"
               style="width: 1320px; height: 50px; border: thin solid grey;margin-left: -15px ; background-color: #e7e6e6 "
               placeholder="&#128269; Bạn có thể tìm kiếm theo tên Cửa hàng, Id đơn hàng hoặc tên Món ăn">
    </div>

</div>


<div class="bill container" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; box-sizing: inherit; margin-bottom: 10px; padding: 20px; box-sizing: inherit; line-height: 1.6em; padding: 15px; height: 450px; width: auto; margin-top: 30px">
    <div class="header-bill">
        <div style="background-color: orangered; width: 70px;padding-top: 1px ;margin-top: 15px; float: left; height: 25px; margin-left: 30px">
            <p style="color: white; font-size: 14px; text-align: center">Yêu thích</p>
        </div>
        <div style="margin-top: 15px; float: left; margin-left: 30px">
            <p style="font-weight: bold;">Guprr bánh mỳ dân tổ</p>
        </div>
        <div style="background-color: orangered; width: 70px ;margin-top: 15px; float: left; height: 25px; margin-left: 30px">
            <p style="color: white; font-size: 14px; text-align: center">Chat</p>
        </div>
<div style="margin-top: 10px; float: left; margin-left: 40px">
    <button type="button" class="btn btn-outline-dark" style="color: orangered; ">Nhà hàng</button>
</div>
    </div>
    <hr style="margin-top: 60px; color: black">
    <div class="content-bill" style="margin-top: 20px">
        <div class="image-bill" style="float: left">
            <img style="width: 160px; height: 134px;" src="https://cdn.tgdd.vn/2021/09/CookProduct/1200(3)-1200x676-2.jpg" alt="">
        </div>
        <div style="float: left; margin-left: 20px; margin-top: 20px">
            <p style="font-size: 20px">Phở gà đùi có thêm trứng non lòng đào thơm đặc biệt của nhà hàng Guprr bánh mì dân tổ</p>
            <p style="font-size: 20px; color: grey">Phân loại đồ ăn: đồ ăn có nước dùng</p>
            <p style="font-size: 18px">X2</p>
            <p style="font-size: 20px;margin-top: -44px ;margin-left: 900px; color: grey; text-decoration-line: line-through">69.000₫</p>
            <p style="font-size: 20px;margin-top: -44px ;margin-left: 1000px; color: orangered">50.000₫</p>
        </div>
    </div>
    <hr style="margin-top: 200px; color: black">

    <div class="footer-bill" >
        <div style="margin-top: 27px; margin-bottom: 27px; margin-left: 1050px">
            <p style="display: inline; font-size: 15px">Thành tiền:</p>
            <p style="display:inline; font-size: 25px; font-weight: bold; color: orangered">100.000₫</p>
        </div>
         <p style="display: inline; color: grey; font-size: 18px">Đánh giá món ăn và nhận voucher</p>
        <button style="display: inline; margin-left: 350px; height: 45px; width: 190px; color: orangered" type="button" class="btn btn-outline-dark">Mua lại</button>
        <button style="display: inline; color: orangered; margin-left: 22px;height: 45px; width: 190px" type="button" class="btn btn-outline-dark">Xem chi tiết đơn</button>
        <button style="display: inline; color: orangered;margin-left: 22px; ;height: 45px; width: 190px" type="button" class="btn btn-outline-dark">Liên hệ cửa hàng</button>
    </div>
</div>



</body>

<script>
    function changeColor(buttonIndex) {
        var buttons = document.getElementsByClassName('group-button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].classList.remove('active');
        }

        buttons[buttonIndex].classList.add('active');
    }
</script>
</html>
