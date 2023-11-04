<%--
  Created by IntelliJ IDEA.
  User: falle
  Date: 11/4/2023
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="myForm" method="post">
    <select id="mySelect" name="quick_search" onchange="submitForm()">
        <option value="option1" onclick="setHiddenValue('option1')">Option 1</option>
        <option value="option2" onclick="setHiddenValue('option2')">Option 2</option>
        <option value="option3" onclick="setHiddenValue('option3')">Option 3</option>
    </select>
    <input type="hidden" id="hiddenValue" name="selected_option">
    <input type="submit" hidden="hidden" value="Submit">
</form>

<input type="text" value="${data}">

<script>
    function setHiddenValue(value) {
        document.getElementById("hiddenValue").value = value;
    }

    function submitForm() {
        document.getElementById("myForm").submit();
    }
</script>
</body>
</html>
