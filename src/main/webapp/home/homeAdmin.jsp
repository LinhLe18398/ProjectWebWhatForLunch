<%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 23/10/2023
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>WhatForLunch</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav style="float: right" class="nav">
  <div class="container mt-3">
    <div class="dropdown">
      <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
        &#9776;
      </button>
      <ul class="dropdown-menu" >
        <li><a class="dropdown-item" href="#">edit profile</a></li>
        <li><a class="dropdown-item" href="/admin?action=showMerchant">Show Merchant</a></li>
        <li><a class="dropdown-item" href="#">log out</a></li>
      </ul>
    </div>
  </div>
</nav>

<div style="text-align: center">
  <h1>Home Admin</h1>
</div>
</body>
</html>
