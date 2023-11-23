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
            /*background: #84fab0;*/
            /*background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));*/
            /*background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))*/

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
        .success{
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
    <title>User Register</title>
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
                            <h2 class="text-uppercase text-center mb-5">Create Account</h2>

                            <form method="post" action="/users?action=create">

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="input-name">Your Name</label>
                                    <input type="text" id="input-name" name="name"
                                           class="form-control form-control-lg" placeholder="name"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="input-email">Your Email</label>
                                    <input type="email" id="input-email" name="email"
                                           class="form-control form-control-lg"
                                           oninput="check_email()" placeholder="email"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="input-password">Password</label>
                                    <input type="password" id="input-password" name="password"
                                           class="form-control form-control-lg password"
                                           oninput="check_password()" placeholder="password"/>
                                    <p id="alert_password"></p>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="retype-password">Repeat your password</label>
                                    <input type="password" id="retype-password"
                                           class="form-control form-control-lg password"
                                           oninput="check_retype_password()" placeholder="repeat password"/>
                                    <p id="alert_retype_password" readonly></p>
                                </div>

                                <c:if test="${ not empty success}">
                                    <span class="success" id="alert_create_account">${success}</span>
                                </c:if>
                                <c:if test="${not empty error}">
                                    <span class="error" id="alert_create_account">${error}</span>
                                </c:if>

                                <div class="d-flex justify-content-center">
                                    <button type="submit" id="submit_button"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                                        Register
                                    </button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a
                                        href="/users?action=login" class="fw-bold text-body"><u>Login
                                    here</u></a></p>
                            </form>
                        </div>
                    </div>
                </div>
                </form>

            </div>
        </div>
    </div>
</section>
<script>

    let submit_button = document.getElementById("submit_button");
    submit_button.disabled = true;
    let itTrueFormEmail = false;
    let isTrueFormPassword = false;
    let isTrueFormRetypePassword = false;

    function check_email(){
        let email = document.getElementById("input-email");
        itTrueFormEmail = false;
        if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) {
            itTrueFormEmail = true;
        }
        checkTrueForm();
    }

    function check_password() {
        let passwords = document.getElementsByClassName("password");
        let password = passwords[0].value;
        let passwordLv0 = /^.{8,}$/;

        let alert_password = document.getElementById("alert_password");
        alert_password.textContent = "";
        if (!passwordLv0.test(password)) {
            alert_password.textContent = "More than 8 characters!";
            alert_password.style.color = "red";
            isTrueFormPassword = false;
        } else {
            isTrueFormPassword = true;
        }
        checkTrueForm();
    }

    function check_retype_password() {
        let passwords = document.getElementsByClassName("password");
        let password = passwords[0].value;
        let retypePassword = passwords[1].value;
        let alert_retype_password = document.getElementById("alert_retype_password");

        if (password != retypePassword) {
            alert_retype_password.textContent = "Passwords do not match!";
            alert_retype_password.style.color = "red";
            isTrueFormRetypePassword = false;
        } else {
            isTrueFormRetypePassword = true;
            alert_retype_password.textContent = "Passwords match!";
            alert_retype_password.style.color = "green";
        }
        checkTrueForm();
    }

    function checkTrueForm() {
        if (isTrueFormPassword && itTrueFormEmail && isTrueFormRetypePassword) {
            submit_button.disabled = false;
        }else{
            submit_button.disabled = true;
        }

    }


</script>
</body>
</html>