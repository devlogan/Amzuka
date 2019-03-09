<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${cartItems}" var="item">
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="${images}/${item.product.imgName}" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${item.product.productName}</a></h4>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        ${item.quantity}
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${item.price}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${item.quantity*item.price}</strong></td>
                        <td class="col-sm-1 col-md-1">
                        
                        </td>
                    </tr>
                    </c:forEach>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>${totalCost}</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>200</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>${totalCost+200}</strong></h3></td>
                    </tr>
                    
                    <tr>
                    	<td>Address for Delivery : </td>
                    	
                    	<td>${addressObj.houseNo}, ${addressObj.streetName},</td>
                    	<td>${addressObj.district} ,${addressObj.city},</td>
                    	<td>${addressObj.state}- ${addressObj.pincode}</td>
                    </tr>
                    
                    
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="${rootdir}/paymentPage" class="btn btn-success">
                             <span class="glyphicon glyphicon-play">Proceed to Payment</span>
                        </a></td>
                    </tr>
                </tbody>
            </table>
            
            
        </div>
    </div>


<jsp:include page="footer.jsp"/>
</body>
</html>