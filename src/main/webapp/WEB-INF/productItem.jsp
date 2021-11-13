<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" errorPage="error.jsp" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Global -->
    <c:import url="sharedView/global.html" />
    <!-- <link rel="stylesheet" href="./css/bootstrap.css" /> -->

    <!-- Local -->
    <link rel="stylesheet" href="./css/productItem.css" />
    <title>${product.getProductName()}</title>
  </head>
  <body>
    <c:import url="sharedView/header.jsp"></c:import>
    <main class="product-container">
      <section class="product">
        <div class="product-view">
          <figure class="product-image-wrapper">
            <img
              class="product-image"
              src="${product.pictureUrl}"
              alt="Spy x Family - Chap 3"
            />
          </figure>
          <div class="button-wrapper">
            <div class="add-to-cart">
              <span>Thêm vào giỏ hàng</span>
            </div>
            <div class="buy-now">
              <span>Mua ngay</span>
            </div>
          </div>
        </div>
        <div class="product-info">
          <h1 class="product-name">${product.getProductName()}</h1>
          <div class="product-rate">
            <div class="product-stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <span>5.0</span>
            </div>
            <span>(3 <span>đánh giá</span>)</span>
            <div class="product-addon">
              <div>
                <i class="fal fa-heart fa-2x"></i>
              </div>
              <div>
                <i class="fal fa-share-alt fa-2x"></i>
              </div>
            </div>
          </div>
          <div class="product-price">${product.price} d</div>
          <div class="product-quantity-wrapper">
            <label>Số lượng:</label>
            <div class="product-quantity">
              <a href="">
                <i class="far fa-minus"></i>
              </a>
              1
              <a href="">
                <i class="far fa-plus"></i>
              </a>
            </div>
          </div>
        </div>
      </section>
      <section class="product-details">
        <div class="product-title">Thông tin sản phẩm</div>
        <div class="product-details-contents">
          <div class="product-details-content">
            <div class="product-content-label">Mã hàng</div>
            <div class="product-content-detail">${product.getSku()}</div>
          </div>
          <div class="product-details-content">
            <div class="product-content-label">Tên Nhà Cung Cấp</div>
            <div class="product-content-detail">${product.supplier}</div>
          </div>
          <div class="product-details-content">
            <div class="product-content-label">Tác giả</div>
            <div class="product-content-detail">${product.nameAuthor}</div>
          </div>
          <div class="product-details-content">
            <div class="product-content-label">NXB</div>
            <div class="product-content-detail">${product.NXB}</div>
          </div>
          <div class="product-details-content">
            <div class="product-content-label">Genres</div>
            <div class="product-content-detail">${product.typeBook}</div>
          </div>
          <div>${product.description}</div>
        </div>
      </section>
    </main>
    <c:import url="sharedView/footer.jsp"></c:import>
    <script src="./js/productItem.js"></script>
  </body>
</html>
