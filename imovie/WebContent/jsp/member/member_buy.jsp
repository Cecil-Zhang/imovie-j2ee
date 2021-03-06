<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="主页">
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<title>购票</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="purchase" />
</jsp:include>
	
<div class="container-fluid">
	<div class="row personelrow">
		<div class="center text">
			<h1>购 &nbsp;票</h1>
		</div>
	</div>
	
	<div class="row personelrow">
        <c:forEach var="plan" items="${planList }">
			<div class="col-md-2 col-md-offset-1 personelrow">
          		<a class="thumbnail" href="movieShowPlanAction.do?planId=${plan.planId }">
            		<img data-src="holder.js/140x140" src="/imovie/common/img/${plan.movie.poster }" alt="${plan.movie.name }">
          		</a>
        	</div>
			
		<div class="col-md-2 personelrow">
			<h6><a href="movieShowPlanAction.do?planId=${plan.planId }">${plan.movie.name }&nbsp;&nbsp;${plan.seatPrice }元 </a></h3>
            <p>${plan.movie.duration }分钟 - ${plan.movie.type } <br />
			   ${plan.screeningTimeInString}<br />
			   ${plan.language} &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${plan.screeningHall }</p>
			<p class="mydescription">&nbsp; &nbsp; &nbsp;${fn:substring(plan.movie.description,0,46) }...</p>
            <p><c:if test="${plan.seatSaled!=80 }"><a role="button" class="btn btn-primary btn-sm col-md-offset-1"  
            <c:if test="${user.information.state!='已激活' }">data-toggle="popover" data-placement="bottom"  id="${plan.planId }" data-content="账号尚未激活，请先充值" </c:if>
            <c:if test="${user.information.state=='已激活' }"> href="movieChooseSeatAction.do?planId=${plan.planId }"</c:if>>选座购票</a></c:if>
				<c:if test="${plan.seatSaled==80 }"><a role="button" class="btn btn-default btn-sm col-md-offset-1" >已售完</a></c:if></p>
				
		</div>
		</c:forEach>
	</div>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/bootstrap.min.js"></script>
<script src="/imovie/common/js/popover.js"></script>
<script>
	$(function () {
	  $('[data-toggle="popover"]').popover()
	})		
</script>

</body>
</html>