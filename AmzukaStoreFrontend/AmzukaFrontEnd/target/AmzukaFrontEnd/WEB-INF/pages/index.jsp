<html>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>AmzukaStore-Women's Clothing</title>

<style type="text/css">
.disable-oos {
	width: 92%;
	height: 100%;
	position: absolute;
	background: grey;
	z-index: 2;
	opacity: 0.4;
	padding-top: 100px;
	left: 12.3px
}

.oos-message {
	color: #fff;
	font-size: 50px;
	position: absolute;
	transform: rotate(-25deg);
	padding-top: 40px
}

.product-grid3 {
	font-family: Roboto, sans-serif;
	text-align: center;
	position: relative;
	z-index: 1
}

.product-grid3:before {
	content: "";
	height: 81%;
	width: 100%;
	background: #fff;
	border: 1px solid rgba(0, 0, 0, .1);
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	transition: all .5s ease 0s
}

.product-grid3:hover:before {
	opacity: 1;
	height: 100%
}

.product-grid3 .product-image3 {
	position: relative
}

.product-grid3 .product-image3 a {
	display: block
}

.product-grid3 .product-image3 img {
	width: 100%;
	height: auto
}

.product-grid3 .pic-1 {
	opacity: 1;
	transition: all .5s ease-out 0s
}

.product-grid3:hover .pic-1 {
	opacity: 0
}

.product-grid3 .pic-2 {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	transition: all .5s ease-out 0s
}

.product-grid3:hover .pic-2 {
	opacity: 1
}

.product-grid3 .social {
	width: 120px;
	padding: 0;
	margin: 0 auto;
	list-style: none;
	opacity: 0;
	position: absolute;
	right: 0;
	left: 0;
	bottom: -23px;
	transform: scale(0);
	transition: all .3s ease 0s
}

.product-grid3:hover .social {
	opacity: 1;
	transform: scale(1)
}

.product-grid3:hover .product-discount-label, .product-grid3:hover .product-new-label,
	.product-grid3:hover .title {
	opacity: 0
}

.product-grid3 .social li {
	display: inline-block
}

.product-grid3 .social li i {
	margin-top: 10px;
}

.product-grid3 .social li a {
	color: #c097f4;
	background: #fff;
	font-size: 25px;
	line-height: 50px;
	width: 50px;
	height: 50px;
	border: 1px solid rgba(0, 0, 0, .1);
	border-radius: 50%;
	margin: 0 2px;
	display: block;
	transition: all .3s ease 0s
}

.product-grid3 .social li a:hover {
	background: #c097f4;
	color: #fff
}

.product-grid3 .product-discount-label, .product-grid3 .product-new-label
	{
	background-color: #e67e22;
	color: #fff;
	font-size: 17px;
	padding: 2px 10px;
	position: absolute;
	right: 10px;
	top: 10px;
	transition: all .3s
}

.product-grid3 .product-content {
	z-index: -1;
	padding: 15px;
	text-align: left
}

.product-grid3 .title {
	font-size: 14px;
	text-transform: capitalize;
	margin: 0 0 7px;
	transition: all .3s ease 0s
}

.product-grid3 .title a {
	color: #414141
}

.product-grid3 .price {
	color: #000;
	font-size: 16px;
	letter-spacing: 1px;
	font-weight: 600;
	margin-right: 2px;
	display: inline-block
}

.product-grid3 .price span {
	color: #909090;
	font-size: 14px;
	font-weight: 500;
	letter-spacing: 0;
	text-decoration: line-through;
	text-align: left;
	display: inline-block;
	margin-top: -2px
}

.product-grid3 .rating {
	padding: 0;
	margin: -22px 0 0;
	list-style: none;
	text-align: right;
	display: block
}

.product-grid3 .rating li {
	color: #ffd200;
	font-size: 13px;
	display: inline-block
}

.product-grid3 .rating li.disable {
	color: #dcdcdc
}

@media only screen and (max-width:1200px) {
	.product-grid3 .rating {
		margin: 0
	}
}

@media only screen and (max-width:990px) {
	.product-grid3 {
		margin-bottom: 30px
	}
	.product-grid3 .rating {
		margin: -22px 0 0
	}
}

@media only screen and (max-width:359px) {
	.product-grid3 .rating {
		margin: 0
	}
}

@media ( min-width : 992px) {
	.product-wrapper {
		margin: 100px 65px !important
	}
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="fullwidth">

		<div id="myCarousel" class="carousel slide caraousel-image"
			data-ride="carousel">
			<!-- Indicators -->

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<div class="item active">
					<a href=""><img class="caraousel-image"
						src="${images}/index1.jpg" alt="New Arrivals"></a>
				</div>

				<div class="item">
					<a><img class="caraousel-image" src="${images }/index2.jpg"
						alt="Jackets"></a>
				</div>

				<div class="item">
					<a><img class="caraousel-image" src="${images }/index3.jpg"
						alt="Skirts"></a>
				</div>

				<div class="item">
					<a href="${rootdir}/getAllProductsByCategory/173?user=1"><img
						class="caraousel-image" src="${images }/index4.jpg" alt="Sweaters"
						style="width: 100%;"></a>
				</div>

			</div>



		</div>
	</div>

	<div class="row" style="width: 100%;margin-bottom:10px">
		<div class="jumbotron" style="background-color: white;">
			<h1>Our brand</h1>
			<p>A woman's wardrobe is her opportunity to stand out and make a
				lasting first impression. Launched in 2012, Impressions Online
				Boutique offers a wide range of apparel to fit any woman's unique
				sense of style. Our clothing and accessories are carefully curated
				to provide our customers the latest fashions.</p>
		</div>

	</div>
	    
		<div class="row product-wrapper" style="">
		<c:forEach items="${productList1}" var="product" begin="1" end="12">
			<div class="col-md-3 col-sm-6" style="margin-bottom: 30px">

				<c:if test="${product.quantity== 0}">
					<div class="disable-oos">
						<span class="oos-message">OUT OF STOCK</span>
					</div>
				</c:if>

				<div class="product-grid3">

					<div class="product-image3">
						<a href="#"> <img class="img-responsive"
							src="${images}/${product.imgName}"> <c:if
								test="${not empty product.imgName1 }">
								<img class="pic-2 img-responsive"
									src="${images}/${product.imgName1}">
							</c:if>
						</a>
						<ul class="social">
							<li><a href="${rootdir}/addToCart/${product.productId}"><i
									class="fa fa-shopping-bag"></i></a></li>
						</ul>
					</div>
					<div class="product-content">
						<h3 class="title">
							<a href="#">${product.productName}</a>
						</h3>
						<div class="price">
							<i class="fa fa-inr"></i>${product.price}
						</div>
						<ul class="rating">
							<li class="fa fa-star"></li>
							<li class="fa fa-star"></li>
							<li class="fa fa-star"></li>
							<li class="fa fa-star disable"></li>
							<li class="fa fa-star disable"></li>
						</ul>
					</div>

				</div>

			</div>
		</c:forEach>
	</div>




	<jsp:include page="footer.jsp" />

</body>
</html>
