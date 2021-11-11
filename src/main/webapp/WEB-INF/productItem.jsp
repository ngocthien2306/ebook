<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Global -->
	<c:import url="sharedView/global.html"/>
	<link rel="stylesheet" href="./css/bootstrap.css">

	<!-- Local -->
	<link rel="stylesheet" href="./css/productItem.css"/>
	<title>Product name here</title>
</head>
<body>	
	<c:import url="sharedView/header.jsp"></c:import>
	<main class="productItemContainer">
		<div class="sectionWrapper">
			<section class="productItem">
				<h1 class="productItemHeader">Lorem ipsum, dolor sit amet
					consectetur adipisicing elit. Molestiae sit delectus sed velit!
					Magni, distinctio adipisci. Aspernatur, impedit? Laudantium
					temporibus molestiae adipisci repudiandae veritatis quibusdam
					autem. Ratione quaerat eius repellendus?</h1>
				<img src="./assets/img/gpu.jpg" alt="Gpu" class="productItemImage" /> <span
					class="productItemPrice">${theProduct.price} ${theProduct.description}</span>
			</section>
			<section class="itemInfo productItem">
				<h1 class="productItemHeader"></h1>
				<ul class="productInfoList">
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
					<li class="productInfoItem">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Numquam accusamus vero quod vel
						possimus quia aliquid molestias unde. Fugiat ad tempora natus
						recusandae deserunt esse harum fuga saepe omnis sit.</li>
				</ul>
				<div class="buttonWrapper">
					<div class="productCounter productButton">
						<i class="fas fa-minus"></i> <span class="productCount">1</span> <i
							class="fas fa-plus"></i>
					</div>
					<div class="productAdd productButton">
						<span class="buttonDescript">Add to cart</span>
					</div>
				</div>
			</section>
			<aside class="productItem recommendSection">
				<h1 class="productItemHeader">Recommend Product</h1>
				<div class="recommendList">
					<div class="recommendItem">
						<img src="./assets/img/gpu.jpg" alt="recommendItem"
							class="recommendProductImage" /><span
							class="productName">Lorem ipsum dolor
							sit amet, consectetur adipisicing elit. Ratione, cumque quam
							voluptas alias quisquam ut. Quod, aut! Est natus architecto
							doloremque dignissimos? In aliquam blanditiis, dicta cupiditate
							exercitationem maxime repellendus?</span><span class="productItemPrice">1,890,000</span>
					</div>
					<div class="recommendItem">
						<img src="./assets/img/gpu.jpg" alt="recommendItem"
							class="recommendProductImage" /><span
							class="productName">Lorem ipsum dolor
							sit amet, consectetur adipisicing elit. Ratione, cumque quam
							voluptas alias quisquam ut. Quod, aut! Est natus architecto
							doloremque dignissimos? In aliquam blanditiis, dicta cupiditate
							exercitationem maxime repellendus?</span><span class="productItemPrice">1,890,000</span>
					</div>
				</div>
			</aside>
			<section class="productDetail productItem">
				<h1 class="productItemHeader">Lorem ipsum dolor sit, amet
					consectetur adipisicing elit. Veritatis deleniti atque vitae
					quisquam dolore eos quas nam possimus eaque adipisci, provident
					similique corrupti magnam temporibus ab dicta! Magni, eos id.</h1>
				<div class="titleWrapper">
					<span class="title">Details</span><span class="title">Review</span>
				</div>
				<div class="detail">
					<span class="productName">Lorem ipsum dolor
						sit amet, consectetur adipisicing elit. Optio, dolorum? Error, ad
						porro nam in, ab sint quos nulla consequatur, sit quod cum dolorum
						culpa! Quibusdam consequatur at velit vitae.</span><span
						class="detailDescript">Lorem ipsum dolor
						sit amet, consectetur adipisicing elit. Optio, dolorum? Error, ad
						porro nam in, ab sint quos nulla consequatur, sit quod cum dolorum
						culpa! Quibusdam consequatur at velit vitae.</span> <span
						class="detailHeader">Lorem ipsum dolor sit
						amet consectetur adipisicing elit. Quia saepe omnis molestiae
						odio. Quasi cupiditate excepturi veniam tenetur id, laborum, omnis
						illum ipsa vitae doloribus earum iure voluptatibus architecto
						incidunt.</span><span class="detailDescript">Lorem
						ipsum dolor sit amet consectetur adipisicing elit. Quia saepe
						omnis molestiae odio. Quasi cupiditate excepturi veniam tenetur
						id, laborum, omnis illum ipsa vitae doloribus earum iure
						voluptatibus architecto incidunt.</span> <span class="detailHeader">Lorem
						ipsum dolor sit amet consectetur adipisicing elit. Quia saepe
						omnis molestiae odio. Quasi cupiditate excepturi veniam tenetur
						id, laborum, omnis illum ipsa vitae doloribus earum iure
						voluptatibus architecto incidunt.</span><span class="detailDescript">Lorem
						ipsum dolor sit amet consectetur adipisicing elit. Quia saepe
						omnis molestiae odio. Quasi cupiditate excepturi veniam tenetur
						id, laborum, omnis illum ipsa vitae doloribus earum iure
						voluptatibus architecto incidunt.</span>
				</div>
				<div class="userReviewList">
					<div class="user">
						<img src="./assets/img/Clown.png" alt="UserAvatar" class="userAvatar" />
						<div class="userReview">
							<div class="reviewHeader">
								<span class="userName">Lorem ipsum
									dolor sit amet consectetur adipisicing elit. Voluptatem dolorem
									vitae dolore, atque asperiores ducimus quos, quibusdam maxime
									laborum veniam nulla consequuntur voluptas dignissimos
									accusamus dolor iste, blanditiis consequatur! Fuga!</span>
								<div class="reviewStars">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<span class="reviewContent">Lorem
								ipsum dolor sit amet consectetur adipisicing elit. Voluptatem
								dolorem vitae dolore, atque asperiores ducimus quos, quibusdam
								maxime laborum veniam nulla consequuntur voluptas dignissimos
								accusamus dolor iste, blanditiis consequatur! Fuga!</span><span
								class="reviewDate">Lorem ipsum dolor
								sit amet consectetur adipisicing elit. Voluptatem dolorem vitae
								dolore, atque asperiores ducimus quos, quibusdam maxime laborum
								veniam nulla consequuntur voluptas dignissimos accusamus dolor
								iste, blanditiis consequatur! Fuga!</span>
						</div>
					</div>
					<div class="user">
						<img src="./assets/img/Boomer.png" alt="UserAvatar" class="userAvatar" />
						<div class="userReview">
							<div class="reviewHeader">
								<span class="userName">Lorem ipsum
									dolor sit amet consectetur adipisicing elit. Voluptatem dolorem
									vitae dolore, atque asperiores ducimus quos, quibusdam maxime
									laborum veniam nulla consequuntur voluptas dignissimos
									accusamus dolor iste, blanditiis consequatur! Fuga!</span>
								<div class="reviewStars">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<span class="reviewContent">Lorem
								ipsum dolor sit amet consectetur adipisicing elit. Voluptatem
								dolorem vitae dolore, atque asperiores ducimus quos, quibusdam
								maxime laborum veniam nulla consequuntur voluptas dignissimos
								accusamus dolor iste, blanditiis consequatur! Fuga!</span><span
								class="reviewDate">Lorem ipsum dolor
								sit amet consectetur adipisicing elit. Voluptatem dolorem vitae
								dolore, atque asperiores ducimus quos, quibusdam maxime laborum
								veniam nulla consequuntur voluptas dignissimos accusamus dolor
								iste, blanditiis consequatur! Fuga!</span>
						</div>
					</div>
					<div class="user">
						<img src="./assets/img/BarguetteVietKong.png" alt="UserAvatar"
							class="userAvatar" />
						<div class="userReview">
							<div class="reviewHeader">
								<span class="userName">Lorem ipsum
									dolor sit amet consectetur adipisicing elit. Voluptatem dolorem
									vitae dolore, atque asperiores ducimus quos, quibusdam maxime
									laborum veniam nulla consequuntur voluptas dignissimos
									accusamus dolor iste, blanditiis consequatur! Fuga!</span>
								<div class="reviewStars">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<span class="reviewContent">Lorem
								ipsum dolor sit amet consectetur adipisicing elit. Voluptatem
								dolorem vitae dolore, atque asperiores ducimus quos, quibusdam
								maxime laborum veniam nulla consequuntur voluptas dignissimos
								accusamus dolor iste, blanditiis consequatur! Fuga!</span><span
								class="reviewDate">Lorem ipsum dolor
								sit amet consectetur adipisicing elit. Voluptatem dolorem vitae
								dolore, atque asperiores ducimus quos, quibusdam maxime laborum
								veniam nulla consequuntur voluptas dignissimos accusamus dolor
								iste, blanditiis consequatur! Fuga!</span>
						</div>
					</div>
					<div class="user">
						<img src="./assets/img/Ehem.png" alt="UserAvatar" class="userAvatar" />
						<div class="userReview">
							<div class="reviewHeader">
								<span class="userName">Lorem ipsum
									dolor sit amet consectetur adipisicing elit. Voluptatem dolorem
									vitae dolore, atque asperiores ducimus quos, quibusdam maxime
									laborum veniam nulla consequuntur voluptas dignissimos
									accusamus dolor iste, blanditiis consequatur! Fuga!</span>
								<div class="reviewStars">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							<span class="reviewContent">Lorem
								ipsum dolor sit amet consectetur adipisicing elit. Voluptatem
								dolorem vitae dolore, atque asperiores ducimus quos, quibusdam
								maxime laborum veniam nulla consequuntur voluptas dignissimos
								accusamus dolor iste, blanditiis consequatur! Fuga!</span><span
								class="reviewDate">Lorem ipsum dolor
								sit amet consectetur adipisicing elit. Voluptatem dolorem vitae
								dolore, atque asperiores ducimus quos, quibusdam maxime laborum
								veniam nulla consequuntur voluptas dignissimos accusamus dolor
								iste, blanditiis consequatur! Fuga!</span>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<c:import url="sharedView/footer.jsp"></c:import>
	<script src="./js/productItem.js"></script>
</body>
</html>
