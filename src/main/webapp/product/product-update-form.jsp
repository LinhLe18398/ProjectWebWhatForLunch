
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>WhatForLunch</title>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<style>
  .back{
    padding-left: 625px;
    padding-top: 3px;
  }
</style>
<body>
<form class="form-horizontal" action="/products?action=update-product" method="post">
  <fieldset>
    <legend>PRODUCTS</legend>
    <input type="hidden" name="product_id" value="${product.getIdProduct()}">
    <div class="form-group">
      <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
      <div class="col-md-4">
        <input id="product_name" name="product_name"
               class="form-control input-md"
               required="" value="${product.getProductName()}" type="text">
      </div>
    </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label">Image</label>
      <div class="col-md-4">
        <input name="product_image"
               class="form-control input-md" required="" value="${product.getProductImg()}" type="text">
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label">Wait Time</label>
      <div class="col-md-4">
        <input name="product_waiTime" value="${product.getWaitTime()}"
               class="form-control input-md" required="" type="number">

      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="product_description">Note</label>
      <div class="col-md-4">
        <textarea class="form-control" id="product_description" name="product_note" value="${product.getNote()}"></textarea>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="product_price">Price</label>
      <div class="col-md-4">
        <input id="product_price" name="product_price"
               class="form-control input-md" required="" value="${product.getPrice()}" type="number">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="sale">Sale</label>
      <div class="col-md-4">
        <input id="sale" name="product_sale"
               class="form-control input-md" required="" value="${product.getSale()}" type="number">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="stock_alert">ServiceFee</label>
      <div class="col-md-4">
        <input id="stock_alert" name="product_serviceFee"
               class="form-control input-md" required=""  value="${product.getServiceFee()}" type="text">
      </div>
    </div>

    <div style="padding-left:625px">
      <button id="updateButton" name="updateButton" class="btn btn-primary">update</button>
    </div>
  </fieldset>
  <div class="back">
    <button type="submit" class="btn btn-primary"><a href="/products?action=home-merchant" style="color: white">&#8592;Back</a></button>
  </div>
</form>
</body>
</html>