<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/20/2023
  Time: 8:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Show Merchant</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/697b47444a.js" crossorigin="anonymous"></script>

</head>
<body>


<form action="/admin?action=clickStatus" method="post">
  <table class="table">
    <tr>
      <th scope="col">IdUser</th>
      <th scope="col">MerchantId</th>
      <th scope="col">RestaurantName</th>
      <th scope="col">RestaurantEmail</th>
      <th scope="col">RestaurantPhone</th>
      <th scope="col">RestaurantAddress</th>
      <th scope="col">Status</th>
    </tr>
    <c:forEach items="${merchant}" var="merchantList">

      <tr>
        <td>${merchantList.idUser}</td>
        <td>${merchantList.idMerchant}</td>
        <td>${merchantList.restaurantName}</td>
        <td>${merchantList.email}</td>
        <td>${merchantList.numberPhone}</td>
        <td>${merchantList.address}</td>
        <td>${merchantList.status}
          <div>
            <button id="button1" type="submit" onclick="approveStatus(${merchantList.idUser})">&#10003;</button>
            <button id="button2" type="submit" onclick="declineStatus(${merchantList.idUser})">&#10005;</button>
          </div>
        </td>
      </tr>
    </c:forEach>
    <input type="text" hidden="hidden" id="idUser" name="how" value="">
    <input id="active" hidden="hidden" type="text" name="active" value="">
  </table>


</form>
<script>
  function approveStatus(idUser) {
    document.getElementById("idUser").value = idUser;
    document.getElementById("active").value = 1;
  }

  function declineStatus(idUser) {
    document.getElementById("idUser").value = idUser;
    document.getElementById("active").value = 0;
  }

  let idMerchant = document.getElementById("idMerchant").value;
  if (idMerchant != null) {
    document.getElementById("button-full").hidden = true;

  } else {
    document.getElementById("button-full").hidden = false;
  }

  function filterTableByStatus() {
    let statusFilter = document.getElementById("statusFilter");
    let selectedStatus = statusFilter.value;
    let rows = document.querySelectorAll("#merchantTable tr");

    for (let i = 1; i < rows.length; i++) { // Bắt đầu từ 1 để bỏ qua hàng tiêu đề
      let statusCell = rows[i].querySelector("td:nth-child(7)");
      let buttonCell = rows[i].querySelector("td:nth-child(8)");
      let status = statusCell.textContent.trim();

      if (selectedStatus === "all" || status === selectedStatus) {
        rows[i].style.display = ""; // Hiển thị hàng
        buttonCell.querySelector("button").disabled = false; // Kích hoạt nút button
      } else {
        rows[i].style.display = "none"; // Ẩn hàng
        buttonCell.querySelector("button").disabled = true; // Vô hiệu hóa nút button
      }
    }
  }
</script>

</body>
</html>