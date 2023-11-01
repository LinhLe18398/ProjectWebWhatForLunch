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
      background: #84fab0;
      background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
      background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
    }

    .gradient-custom-4 {
      background: #84fab0;
      background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
      background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
    }

    #alert_password {
      border: none;
    }

    .success {
      text-align: center;
      color: green;
    }

    .error {
      text-align: center;
      color: red;
    }
  </style>
  <title>User Login</title>
</head>

<body>
<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Login</h2>

              <form method="post" action="/users?action=login">

                <div class="form-outline mb-4">
                  <label class="form-label" for="email">Email</label>
                  <input type="email" id="email" name="email" class="form-control form-control-lg"
                         placeholder="email"/>
                </div>

                <div class="form-outline mb-4">
                  <label class="form-label" for="password">Password</label>
                  <input type="password" id="password" name="password"
                         class="form-control form-control-lg password" placeholder="password"/>
                  <p id="alert_password"></p>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="submit" id="submit_button"
                          class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Login
                  </button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Don't have an account? <a
                        href="/users?action=create" class="fw-bold text-body"><u>Signup
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
</body>

</html>
