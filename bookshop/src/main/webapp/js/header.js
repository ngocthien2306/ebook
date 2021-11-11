/*if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready);
} else {
    ready();
}
function ready() {
	var add_btn = document.getElementsByClassName("btn_add-to-cart");
	var btn_goCart = document.querySelector(".btn-gocart");

	
	for (let i = 0; i < add_btn.length; i++) {
		var btn = add_btn[i];
		btn.addEventListener('click', addToCartClick);	
	}
	btn_goCart.addEventListener('click', function() {
		load_data = document.getElementsByClassName('load-item');
		
		console.log(load_data);
		for(let i = 0; i < items.length; i++) {
			item = items[i];
			var data = `<tr>
						<td>
							<div class="cart-info">
								<img
									src="${item[3]}}">
								<div>
									<p>${item[1]}</p>
									<span>Price: 150.000</span> <p>vnd</p> <br /> <a href="#">remove</a>
								</div>
							</div>
						</td>
						<td><input type="number" value="1" min="1"></td>
						<td>150.000 vnd</td>
					</tr>`
		}
		load_data.innerHTML = data;
		console.log(":((()))");
	});
}


var items = [];
function addToCartClick(event) {
	var btn = event.target;
    var shopItem = btn.parentElement.parentElement;
	var title = shopItem.getElementsByClassName('trending-item-name')[0].textContent;
	var author = shopItem.getElementsByClassName('trending-item-author')[0].textContent;
	var imgSource = shopItem.getElementsByClassName('product-item-img')[0].src;
	var a = document.getElementsByClassName("product-item-img")[0];

	addItemToCart(title, author, imgSource);


	
}

function addItemToCart(title, author, srcImg) {
	var cartItem = document.getElementsByClassName("item-in-cart")[0];
	var img = document.getElementsByClassName("cart-product-nocart")[0];
	var txt = document.getElementsByClassName("cart-product-list--noproduct")[0];
	
	var cartRow = document.createElement('div');
	img.classList.add("hidden");
	txt.classList.add("hidden");
	cartRow.classList.add("add-tocart");
	var cartItemName = document.getElementsByClassName("trending-item-name-2");
	for (let i = 0; i < cartItemName.length; i++) {
		if(cartItemName[i].textContent == title) {
			alert("The item is already added to the cart");
			return
		}
	}
	items.push([title, author, srcImg]);
	var cartRowContents = `<img alt="" src="${srcImg}" class="notify-img">
						<div class="cart-content-info">
							<p class="trending-item-name-2">${title}</p>
							<p class="trending-item-name-1">${author}</p>
						</div>
						<button class="btn-cart">Remove</button>
					</div>`
	cartRow.innerHTML = cartRowContents;
	cartItem.append(cartRow);

	console.log(items);
}
*/
var price = document.getElementById("abc");
console.log(price[0].textContent);



