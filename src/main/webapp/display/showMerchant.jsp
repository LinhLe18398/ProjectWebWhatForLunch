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
</head>
<body>
<%--<select id="statusFilter" onchange="filterTableByStatus()">--%>
<%--    <option value="all">All</option>--%>
<%--    <option value="action">Action</option>--%>
<%--    <option value="wait">Wait</option>--%>
<%--</select>--%>

<form action="/admin?action=showMerchant" method="get">
  <table class="table">
    <tr>
      <th scope="col">IdUser</th>
      <th scope="col">MerchantId</th>
      <th scope="col">RestaurantName</th>
      <th scope="col">RestaurantEmail</th>
      <th scope="col">RestaurantPhone</th>
      <th scope="col">RestaurantAddress</th>
      <th scope="col">Status</th>
      <th scope="col">Buttons</th>
    </tr>
    <c:forEach items="${merchant}" var="merchantList">
      <tr>
        <td>${merchantList.idUser}</td>
        <td>${merchantList.idMerchant}</td>
        <td>${merchantList.restaurantName}</td>
        <td>${merchantList.email}</td>
        <td>${merchantList.numberPhone}</td>
        <td>${merchantList.address}</td>
        <td>${merchantList.status}</td>
        <td>
          <form id="statusForm_${merchantList.idMerchant}" action="/admin" method="get">
            <input type="hidden" name="action" value="clickStatus">
            <input type="hidden" name="id" value="${merchantList.idMerchant}">
            <button id="statusButton_${merchantList.idMerchant}" type="submit" class="btn btn-success">Change Status</button>
          </form>
        </td>

        <script>
          function handleStatusButton(merchantId, status) {
            let button = document.getElementById("statusButton_" + merchantId);

            if (status === "wait") {
              button.style.display = "block"; // Hiển thị nút button
            } else {
              button.style.display = "none"; // Ẩn nút button
            }
          }

          // Gọi hàm handleStatusButton để xử lý từng merchant
          handleStatusButton("${merchantList.idMerchant}", "${merchantList.status}");
        </script>
      </tr>
    </c:forEach>
  </table>

  <script>
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

</form>

</body>
</html>
