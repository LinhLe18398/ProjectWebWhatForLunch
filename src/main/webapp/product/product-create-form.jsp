<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 28/10/2023
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<style>
    .back {
        padding-left: 625px;
        padding-top: 3px;
    }
</style>
<body>
<form class="form-horizontal" action="/products?action=create-product" method="post">
    <fieldset>
       <legend>PRODUCTS</legend>
        <div class="form-group">
            <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
            <div class="col-md-4">
                <input id="product_name" name="product_name" placeholder="PRODUCT NAME"
                       class="form-control input-md"
                       required="" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Image</label>
            <div class="col-md-4">
                <input name="product_image" placeholder="Image"
                       class="form-control input-md" required="" type="text">

            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Wait Time</label>
            <div class="col-md-4">
                <input name="product_waiTime" placeholder="WAIT TIME"
                       class="form-control input-md" required="" type="number">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="product_description">Note</label>
            <div class="col-md-4">
                <textarea class="form-control" id="product_description" name="product_note"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_price">Price</label>
            <div class="col-md-4">
                <input id="product_price" name="product_price" placeholder="PRICE"
                       class="form-control input-md" required="" type="text">

            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_promotional price">Promotional Price</label>
            <div class="col-md-4">
                <input id="product_promotional price" name="product_promotionalPrice"
                       placeholder="PROMOTIONAL PRICE"
                       class="form-control input-md" required="" type="text">

            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="stock_alert">Service Charge</label>
            <div class="col-md-4">
                <input id="stock_alert" name="product_serviceCharge" placeholder="service"
                       class="form-control input-md"
                       required="" type="text" value="0">

            </div>
        </div>

        <div style="padding-left:625px">
            <button type="submit" name="create_product" class="btn btn-primary">Create</button>
        </div>
    </fieldset>
    <div class="back">
        <button type="submit" class="btn btn-primary"><a href="/products?action=home-merchant" style="color: white">&#8592;Back</a>
        </button>
    </div>
</form>
</body>
</html>