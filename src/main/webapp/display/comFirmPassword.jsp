<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 25/10/2023
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>WhatForLunch</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
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

  body {
    /*background: linear-gradient(120deg, #3ca7ee, #9b408f);*/
    /*height: 100vh;*/
    /*overflow: hidden;*/
    background-image: url("https://static.vecteezy.com/system/resources/previews/016/030/491/non_2x/top-view-of-traditional-korean-food-on-a-table-illustration-delicious-korean-bbq-grill-with-all-small-side-dishes-set-beef-and-pork-korean-barbecue-asian-food-background-vector.jpg");
 background-repeat: no-repeat;
    background-size: cover;
  }

  .container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.05);
  }

  .container h1 {
    text-align: center;
    padding-top: 20px;
  }

  .container form {
    padding: 0 40px;
  }

  form .form-control {
    position: relative;
    border-bottom: 2px solid #adadad;
    margin: 40px 0;
  }

  .form-control.success {
    border-bottom-color: #2691d9;
  }

  .form-control.error {
    border-bottom-color: #e74c3c;
  }

  .form-control input {
    width: 100%;
    height: 40px;
    font-size: 16px;
    border: none;
    background: none;
    outline: none;
  }

  small {
    position: absolute;
    left: 0;
    top: 100%;
    margin-top: 3px;
    color: #e74c3c;
  }

  .form-control span::before {
    content: '';
    position: absolute;
    top: 40px;
    left: 0;
    width: 0%;
    height: 2px;
    background: #49b571;
    transition: 0.3s;
  }

  .form-control input:focus ~ span::before {
    width: 100%;
  }

  input[type='submit'] {
    margin-top: 20px;
    width: 100%;
    height: 50px;
    border: 1px solid;
    background: #49b571;
    border-radius: 25px;
    font-size: 18px;
    color: #e9f4fb;
    font-weight: 700;
    cursor: pointer;
    outline: none;
    transition: 0.5s;
  }

  input[type='submit']:hover {
    background-color: #49b571;
  }

  .signup_link a {
    color: #49b571;
    text-decoration: none;
  }

  .signup_link a:hover {
    text-decoration: underline;
  }

</style>
<body>
<div class="overlay"></div>
<div class="container">

  <h1 style="margin-top: 50px">Vào nhà hàng của bạn</h1>

  <form action="/users?action=comfirmpassword" method="post">

    <div class="form-control">
      <input type="password" id="password" placeholder="Password" name="password">
    </div>
    <input style="margin-bottom: 100px" type="submit" value="Vào"/>
  </form>
</div>
</body>
</html>