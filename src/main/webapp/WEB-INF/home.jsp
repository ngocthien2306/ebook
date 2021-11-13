<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
  <!-- Global -->
  <c:import url="sharedView/global.html" />
  <!-- Carousel -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <!-- Local -->
  <link rel="stylesheet" href="./css/home.css">
  <title>E-Book Shop</title>
</head>

<body>
  <c:import url="sharedView/header.jsp"></c:import>
  <br>
  <div class="adver-demo">
    <div class="owl-carousel owl-theme">
      <div class="adver-item">
        <a href=""><img src="https://www.epub.vn/static/assets/bigbanner/webp/the-overweight-book-shelf-colour-pc.webp?v=1" alt=""> </a>
      </div>
      <div class="adver-item">
        <a href=""><img src="https://www.epub.vn/static/assets/bigbanner/webp/who-was-pc.webp?v=1" alt=""> </a>
      </div>
      <div class="adver-item">
        <a href=""><img src="https://www.epub.vn/static/assets/bigbanner/webp/about-us-banner-pc.webp?v=1" alt=""> </a>
      </div>
      <div class="adver-item">
        <a href=""><img src="https://www.epub.vn/static/assets/bigbanner/webp/harry-potter-pc.webp?v=1" alt=""> </a>
      </div>
    </div>
  </div>
  <div class="app_container">
    <div class="grid">
      <div class="grid_row app-content">
        <div class="grid_column-2">
          <nav class="category">
            <h3 class="category-heading"> <i class="category-heading-icon fas fa-list"></i>Content</h3>
            <ul class="category-list">
              <li class="category-item category--active">
                <a href="" class="category-link">Romance <%= request.getParameter("named") %></a>
              </li>
              <li class="category-item">
                <a href="" class="category-link">Science Fiction & Fantasy</a>
              </li>
              <li class="category-item">
                <a href="" class="category-link">Comics, Graphic Novels, & Manga</a>
              </li>
              <li class="category-item">
                <a href="" class="category-link">Business & Finance</a>
              </li>
            </ul>
          </nav>
        </div>
        <div class="grid_column-10">

          <div class="home-filter">
            <span class="home-label">Sorting by</span>
            <button class="btn-product home-filter-btn">${role} ${username}</button>
            <button class="btn-product btn-primary home-filter-btn">Newest</button>
            <button class="btn-product home-filter-btn">Selling</button>
            <div class="select-input">
              <span class="select-price-label">Price</span>
              <i class="fas fa-angle-down select-price-icon"></i>
              <ul class="select-input-list">
                <li class="select-input-item">
                  <a href="" class="select-input-link">Increase</a>
                </li>
                <li class="select-input-item">
                  <a href="" class="select-input-link">Decrease</a>
                </li>
              </ul>
            </div>
            <div class="home-page">
              <span class="filter-page-num">
                <span class="filter-page-current">1</span>/14
              </span>
              <div class="filter-control">
                <a href="" class="filter-page-btn">
                  <i class="fas fa-angle-left"></i>
                </a>
                <a href="" class="filter-page-btn">
                  <i class="fas fa-angle-right"></i>
                </a>
              </div>
            </div>
          </div>

          <div class="home-product">
            <div class="grid_row">
              <c:forEach var="product" items="${list_product}">
                <c:url var="link" value="home">
                  <c:param name="command" value="LOAD" />
                  <c:param name="productID" value="${product.id}" />
                </c:url>

                <div class="grid_column-2-5">
                  <div class="card-trending">
                    <div class="product-item border-card">
                      <a class="card-link-product" href="${link}">
                        <div class="product-item-img" style="background-image: url(${product.pictureUrl});"></div>
                      </a>
                      <p class="trending-item-name">${product.getProductName()}</p>
                      <p class="trending-item-author">${product.nameAuthor}</p>
                      <div class="product-action">
                        <span class="product-action-heart product-action-liked">
                          <i class="like-icon far fa-heart"></i>
                          <i class="liked-icon fas fa-heart"></i>
                        </span>
                        <div class="product-action-star">
                          <i class="star-gold fas fa-star"></i>
                          <i class="star-gold fas fa-star"></i>
                          <i class="star-gold fas fa-star"></i>
                          <i class="star-gold fas fa-star"></i>
                          <i class="star-gold far fa-star"></i>
                        </div>
                      </div>
                      <div class="trending-item-price">
                        <span class="price-old mr-up">${product.price}</span>
                        <span class="price-current mr-up">17.790d</span>
                      </div>
                      <form action="${pageContext.request.contextPath}/payment" method="get">
                      		<input type="hidden" name="pId"  value="${product.id}">
                      		<input type="hidden" name="username"  value="${username}">
                      		<input type="hidden" name="price"  value="${product.price}">
                      		<input type="hidden" name="quantity"  value="1">
                      		<input type="hidden" name="action"  value="ADD">
                      	   	<input type="submit" class="btn_add-to-cart" value="Add to cart"/>
                      </form>

                      <div class="product-item-favourite">
                        <i class="fas fa-check"></i> Interesting
                      </div>
                      <div class="product-item-sale">
                        <span class="product-item-label">Discount</span>
                        <span class="product-item-percent">23%</span>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <c:forEach var="item" items="${list}">
  	<p>${item.author}</p>
  	<p>${item.name}</p>
  </c:forEach>
  
<br>
	<div class="grid">
      <div class="grid_row">
        <div class="trending_book">
          <div class="trending_book-header">
            <span class="trending_book-title">Trending Now in eBooks</span>
            <ul class="trending-list">
              <li class="trending_item"><a href="" class="trending_item-link">Discount</a></li>
              <li class="trending_item"><a href="" class="trending_item-link">Newest</a></li>
              <li class="trending_item"><a href="" class="trending_item-link">See All</a></li>
            </ul>
          </div>
          <div class="carousel owl-carousel">
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/625a6018-6751-4812-abfa-93c19d3fe0d8/140/215/60/False/lying-ways.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/adff408e-a299-4d6c-a5fa-81aa587ce849/140/215/60/False/first-girl-to-die.jpg);"></div>
                <p class="trending-item-name">It Ends with Us: A Novel</p>
                <p class="trending-item-author">Colleen Hoover</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 105.000d</span>
                  <span class="price-current mr-up">95.000d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/5a8b06eb-73cc-4d3e-9414-23c788c9312d/140/215/60/False/their-eyes-were-watching-god-1.jpg);"></div>
                <p class="trending-item-name">I Will Teach You to Rich</p>
                <p class="trending-item-author">Ramit Sethi</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 80.000d</span>
                  <span class="price-current mr-up">70.000d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/d2b694e5-ab0e-483b-937d-003950e93943/140/215/60/False/temptation-after-dark-1.jpg);"></div>
                <p class="trending-item-name">The Thirty Names</p>
                <p class="trending-item-author">Zeyn Joukhadar</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 70.190d</span>
                  <span class="price-current mr-up">62.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/6b9a1dcd-5ab2-4c3e-9cae-a1dd3fbab89c/140/215/60/False/the-girl-on-the-platform-2.jpg);"></div>
                <p class="trending-item-name">News of the World:</p>
                <p class="trending-item-author">Paulette Jiles</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 120.000d</span>
                  <span class="price-current mr-up">105.900d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/a1f2ad30-328f-4e97-9b15-9c527ba1b00b/140/215/60/False/stolen-ones.jpg);"></div>
                <p class="trending-item-name">Last Thing He Told Me</p>
                <p class="trending-item-author">Laura Dave</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 88.000d</span>
                  <span class="price-current mr-up">80.00d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br/>
    <br/>
   	<div class="grid">
      <div class="grid_row">
        <div class="trending_book">
          <div class="trending_book-header">
            <span class="trending_book-title">Popular eBook Pre-orders <br> <p class="trending_book-title-after">Stay ahead of the curve and get the most anticipated eBooks of the year the moment they come out. </p></span>
            <ul class="trending-list">
              <li class="trending_item"><a href="" class="trending_item-link">Discount</a></li>
              <li class="trending_item"><a href="" class="trending_item-link">Newest</a></li>
              <li class="trending_item"><a href="" class="trending_item-link">See All</a></li>
            </ul>
          </div>
          <div class="carousel owl-carousel">
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/625a6018-6751-4812-abfa-93c19d3fe0d8/140/215/60/False/lying-ways.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/adff408e-a299-4d6c-a5fa-81aa587ce849/140/215/60/False/first-girl-to-die.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/5a8b06eb-73cc-4d3e-9414-23c788c9312d/140/215/60/False/their-eyes-were-watching-god-1.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/d2b694e5-ab0e-483b-937d-003950e93943/140/215/60/False/temptation-after-dark-1.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/6b9a1dcd-5ab2-4c3e-9cae-a1dd3fbab89c/140/215/60/False/the-girl-on-the-platform-2.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
            <div class="card-trending">
              <div class="product-item border-card">
                <div class="product-item-img" style="background-image: url(https://kbimages1-a.akamaihd.net/a1f2ad30-328f-4e97-9b15-9c527ba1b00b/140/215/60/False/stolen-ones.jpg);"></div>
                <p class="trending-item-name">Lying Ways</p>
                <p class="trending-item-author">Rechel Lynch</p>
                <div class="product-action">
                  <span class="product-action-heart product-action-liked">
                    <i class="like-icon far fa-heart"></i>
                    <i class="liked-icon fas fa-heart"></i>
                  </span>
                  <div class="product-action-star">
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold fas fa-star"></i>
                    <i class="star-gold far fa-star"></i>
                  </div>
                </div>
                <div class="trending-item-price">
                  <span class="price-old mr-up"> 18.190d</span>
                  <span class="price-current mr-up">17.790d</span>
                </div>
  
                <button class="btn_add-to-cart">Add to cart</button>
                <div class="product-item-favourite">
                  <i class="fas fa-check"></i> Interesting
                </div>
                <div class="product-item-sale">
                  <span class="product-item-label">Discount</span>
                  <span class="product-item-percent">23%</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <br> <br>
  <c:import url="sharedView/footer.jsp"></c:import>
  <script>
    $(".carousel").owlCarousel({
      margin: 20,
      loop: true,
      nav: true,
      autoplay: true,
      autoplayTimeout: 3000,
      smartSpeed: 1000,
      autoplayHoverPause: true,
      responsive: {
        0: {
          items: 1,
          nav: false
        },
        600: {
          items: 2,
          nav: false
        },
        1000: {
          items: 6,
          nav: false
        }
      }
    });
    var owl = $(".owl-carousel");
    owl.owlCarousel({
      items: 1,
      loop: true,
      nav: true,
      autoplay: true,
      autoplayTimeout: 3000,
      smartSpeed: 1000,
      autoplayHoverPause: true,
    });
    
  </script>
</body>

</html>
