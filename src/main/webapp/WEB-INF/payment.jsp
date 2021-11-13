<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" errorPage="error.jsp" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Global -->
<c:import url="sharedView/global.html" />

<link rel="stylesheet" href="./css/payment.css" />
<title>Your Cart</title>

</head>

<body>
	<c:import url="sharedView/header.jsp"></c:import>
	<br/>

	<div class="grid">
		<div class="grid_row">
			<div class="grid_column-9">
				<section class="container-cart content-section">
	            <h2 class="section-header">Cart list</h2>
	            <div class="cart-row">
	                <span class="cart-item cart-header cart-column">ITEM</span>
	                <span class="cart-price cart-header cart-column">PRICE </span>
	                <span class="cart-quantity cart-header cart-column">QUANTITY</span>

	            </div>
	            <c:forEach var="item" items="${cart_item}">
		            <div class="cart-items">
				        <div class="cart-item cart-column">
				            <img class="cart-item-image" src="https://kbimages1-a.akamaihd.net/a1f2ad30-328f-4e97-9b15-9c527ba1b00b/140/215/60/False/stolen-ones.jpg" width="100" height="100">
				            <div class="cart-title">
				        		<p class="name-book"><c:out value="${item.name}"/></p>
		              			<p class="name-author"><c:out value="${item.author}"/></p>
				        	</div>
				        </div>
				        <div class="cart cart-price cart-column" style="display: flex;">
				        	<p><c:out value="${item.price}"/> </p> 
				        </div>

				        <div class="cart-quantity cart-column">
				            <input class="cart-quantity-input" readonly="readonly" type="number" name="quantity" value="<c:out value="${item.amount}"/>">
				            <form action="./payment" method="get">
								<input type="hidden" name="cId" value='<c:out value="${item.id}"/>'/>
								<input type="hidden" name="username" value="${username}"/>
								<input type="submit" class="btn btn-danger" name="action" value="REMOVE" />
							</form>
				        </div>

		            </div>
		            
	            </c:forEach>
	            
	            <div class="cart-total">
	                <strong class="cart-total-title">Total</strong>
	                <span class="cart-total-price"></span>
	               
	            </div>
	        </section>
			</div>
			<div class="grid_column-3">
				
				<div class="total-price">
					<form action="./confirm">
						 <input id="hide" type="hidden" name="price" value=""/>
						<button type="submit" class="btn btn-primary" style="width: 200px; height: 36px; align-items: center; margin: 10px 0; padding-top: 10px;">VN Pay</button>
					</form>
		
					
					<div id="smart-button-container">
						<div style="text-align: center;">
							<div id="paypal-button-container"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="." method="get">
			<input type="hidden" name="action" value="shop">
			<input type="submit" class="btn btn-primary" value="Continue Shopping" style="width: 200px; height: 36px; align-items: center; margin: 10px 0; padding-top: 10px;">
		</form>
	</div>
	<br/>
	<c:import url="sharedView/footer.jsp"></c:import>
	
	
  <script src="https://www.paypal.com/sdk/js?client-id=AQ5g8nn9aROkHblV7Ljd5PJKV5Tr_cmh4WE6HrGy0GRCUyHOQKuQ7lOqMCdX9D31pAVSVcryYpROoTGY&enable-funding=venmo&currency=USD" data-sdk-integration-source="button-factory"></script>
  <script>

  var price = document.getElementsByClassName("cart cart-price cart-column");
  var total = document.getElementsByClassName("cart-total-price");

  var priceTotal = 0;
  for(let i = 0; i < price.length; i++) {
	  price[i].textContent = parseFloat(price[i].textContent);
	  priceTotal += parseFloat(price[i].textContent);
  }
  total[0].textContent = priceTotal;
  document.getElementById("hide").value = priceTotal.toString();
    function initPayPalButton() {
      paypal.Buttons({
        style: {
          shape: 'rect',
          color: 'gold',
          layout: 'vertical',
          label: 'paypal',
          
        },

        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{"amount":{"currency_code":"USD","value":1}}]
          });
        },

        onApprove: function(data, actions) {
          return actions.order.capture().then(function(orderData) {
            
            // Full available details
            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

            // Show a success message within this page, e.g.
            const element = document.getElementById('paypal-button-container');
            element.innerHTML = '';
            element.innerHTML = '<h3>Thank you for your payment!</h3>';

            // Or go to another URL:  actions.redirect('thank_you.html');
            
          });
        },

        onError: function(err) {
          console.log(err);
        }
      }).render('#paypal-button-container');
    }
    initPayPalButton();
  </script>
		
</body>
</html>