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
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />

<!-- 包括font-awesome样式 -->
<link href="/imovie/common/css/font-awesome.min.css" rel="stylesheet"/>

<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>

<title>搜索</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>

<div class="container-fluid">

<c:if test="${fn:length(users)!=0}">
<div class="row personelrow">
	<div class="center text">
		<h1><a href="#">${search }</a>&nbsp;的搜索结果</h1>
	</div>
</div>
	
<div class="row personelrow">
		
		<div class="col-md-8 col-md-offset-2">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">	
					<td><p class="h6">用户ID</p></td>
					<td><p class="h6">用户名</p></td>
					<td><p class="h6">头像</p></td>
					<td><p class="h6">查看个人信息</p></td>
					<td><p class="h6">查看消费记录</p></td>
					<td><p class="h6">查看充值记录</p></td>
				</tr>
				<c:forEach var="u" items="${users }">
				<tr class="danger center">
					<td><p class="h6">${u.userId }</p></td>
					<td><p class="h6">${u.information.username }</p></td>
					<td><p class="h6"><img class="img-rounded mythumbnail" src="/imovie/common/img/${u.information.image }" /></p></td>
					<td><p class="h6"><a href="userUserInformationAction.do?userid=${u.userId }">查看个人信息</a></p></td>
					<td><p class="h6"><a href="orderOrderRecordAction.do?userid=${u.userId }">查看消费记录</a></p></td>
					<td><p class="h6"><a href="userRechargeRecordAction.do?userid=${u.userId }">查看充值记录</a></p></td>
				</tr>
				</c:forEach>
			</table>
		</div>
</div>
</c:if>

<c:if test="${fn:length(users)==0}">
<div class="row paddingForNav">
	<div class="center text">
		<h2>没有关于<a href="#">${search }</a>的搜索结果</h2>
	</div>
</div>
</c:if>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
  
</body>
</html>