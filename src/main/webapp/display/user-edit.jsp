<%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 23/10/2023
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Edit</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href='https://cdn.jsdelivr.net/gh/startinhit/font-awesome/css/all.css' rel='stylesheet'/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
  body {
    margin-top: 20px;
  }

  .avatar {
    width: 200px;
    height: 200px;
  }

  .btn-primary {
    float: right;
  }

</style>
<body>
<div class="container bootstrap snippets bootdey">
  <h1 class="text-primary">Edit Profile</h1>
  <hr>
  <form action="/users?action=edit" method="post">
    <div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="${user.img}"
               class="avatar img-circle img-thumbnail"
               alt="avatar" >
          <h6>Upload a different photo...</h6>

          <input type="file" class="form-control" name="img">

        </div>
      </div>

      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <h3>User info</h3>
        <form class="form-horizontal" role="form" method="post">
          <%--          <input type="hidden" name="id" value="${user.id}">--%>
          <div class="form-group">
            <label class="col-lg-3 control-label">Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="name" value="${user.name}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="email" name="email" value="${user.email}" disabled>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Phone Number:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="phoneNumber" value="${user.phoneNumber}">
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label">Birthday:</label>
            <div class="col-lg-8">
              <input class="form-control" type="date" name="birthday" value="${user.birthday}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Gender:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="gender" value="${user.gender}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Address:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="address" value="${user.address}">
            </div>
          </div>
          <p style="padding-top: 5px">
            <input style="border-radius: 20px 20px 20px 20px" class="btn btn-primary" type="submit"
                   value="Edit">
          </p>
        </form>
      </div>
    </div>
  </form>
  <a href="/users?action=home" class="back">
    <button type="submit" class="btn btn-secondary btn-sm">&#8592; back</button>
  </a>

</div>
<hr>
<script>
  const ipnElement = document.querySelector('#ipnPassword')
  const btnElement = document.querySelector('#btnPassword')
  btnElement.addEventListener('click', function () {
    const currentType = ipnElement.getAttribute('type')
    ipnElement.setAttribute(
            'type',
            currentType === 'password' ? 'text' : 'password'
    )
  })
</script>
</body>
</html>