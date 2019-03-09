<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="header.jsp"/>

<div class="container" style="margin-top:50px;">
	<div class="row">

		<c:forEach items="${productList}" var="product">
    	<div class="col-xs-12 col-sm-6 col-md-3">
			
            <div class="col-item">
                <div class="post-img-content">
                    <img style="width: 260px;height: 300px" src="${images}/${product.imgName}" class="img-responsive" />
                    
                </div>
                <div class="info">
                    <div class="row">
                    <div>
                        <div class="price col-md-6">
                           <h5><b>${product.productName}</b></h5>
                            <h5 class="price-text-color">${product.price}</h5>
                        </div>
                        </div>
                        <div>	
                        	
                        </div>
                        
                    </div>
                    <div class="separator clear-left">
                        <p class="btn-add">
                            <i class="fa fa-shopping-cart"></i><a href="${rootdir}/addToCart/${product.productId}" class="hidden-sm">Add to Bag</a></p>
                            <p>${product.quantity} left!!</p>
                        <!-- <p class="btn-details">
                        </p> -->
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            
        </div>
        </c:forEach>
            
</div>
</div>



<style>
	@import url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css);
.col-item
{
    border: 1px solid #E1E1E1;
    border-radius: 10px;
    background: #FFF;
}
.col-item:hover
{ 
  box-shadow: 0px 2px 5px -1px #000;
  -moz-box-shadow: 0px 2px 5px -1px #000;
  -webkit-box-shadow: 0px 2px 5px -1px #000;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  border-radius: 10px;   
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;   
  border-bottom:2px solid #52A1D5;        
}
.col-item .photo img
{
    margin: 0 auto;
    width: 100%;
    padding: 1px;
    border-radius: 10px 10px 0 0 ;
}

.col-item .info
{
    padding: 10px;
    border-radius: 0 0 5px 5px;
    margin-top: 1px;
}

.col-item .price
{
    /*width: 50%;*/
    float: left;
    margin-top: 5px;
}

.col-item .price h5
{
    line-height: 20px;
    margin: 0;
}

.price-text-color
{
    color: #219FD1;
}

.col-item .info .rating
{
    color: #777;
}

.col-item .rating
{
    /*width: 50%;*/
    float: left;
    font-size: 17px;
    text-align: right;
    line-height: 52px;
    margin-bottom: 10px;
    height: 52px;
}

.col-item .separator
{
    border-top: 1px solid #E1E1E1;
}

.clear-left
{
    clear: left;
}

.col-item .separator p
{
    line-height: 20px;
    margin-bottom: 0;
    margin-top: 10px;
    text-align: center;
}

.col-item .separator p i
{
    margin-right: 5px;
}
.col-item .btn-add
{
    width: 50%;
    float: left;
}

.col-item .btn-add
{
    border-right: 1px solid #E1E1E1;
    
}

.col-item .btn-details
{
    width: 50%;
    float: left;
    padding-left: 10px;
}
.controls
{
    margin-top: 20px;
}
[data-slide="prev"]
{
    margin-right: 10px;
}

/*
Hover the image
*/
.post-img-content
{
    height: 196px;
    position: relative;
}
.post-img-content img
{
    position: absolute;
    padding: 1px;
    border-radius: 10px 10px 0 0 ;
}
.post-title{
    display: table-cell;
    vertical-align: bottom;
    z-index: 2;
    position: relative;
}
.post-title b{
    background-color: rgba(51, 51, 51, 0.58);
    display: inline-block;
    margin-bottom: 5px;
    margin-left: 2px;
    color: #FFF;
    padding: 10px 15px;
    margin-top: 10px;
    font-size: 12px;
}
.post-title b:first-child{
    font-size: 14px;
}
.round-tag{
    width: 60px;
    height: 60px;
    border-radius: 50% 50% 50% 0;
    border: 4px solid #FFF;
    background: #37A12B;
    position: absolute;
    bottom: 0px;
    padding: 15px 6px;
    font-size: 17px;
    color: #FFF;
    font-weight: bold;
}
</style>