<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<script type="text/javascript">

		var ageData = [
				{
					value: "${map['0岁~18岁']}",
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "0岁~18岁"
				},
				{
					value: "${map['19岁~30岁']}",
					color: "#46BFBD",
					highlight: "#5AD3D1",
					label: "19岁~30岁"
				},
				{
					value: "${map['31岁~40岁']}",
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "31岁~40岁"
				},
				{
					value: "${map['41岁及以上']}",
					color: "#949FB1",
					highlight: "#A8B3C5",
					label: "41岁及以上"
				}

			];

			window.onload = function(){
				var ctx1 = document.getElementById("age-area").getContext("2d");
				window.myPie = new Chart(ctx1).Pie(ageData);
			};
	</script>
<title>会员年龄统计</title>
</head>
<body class="paddingForNav">
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>
	
<div class="container-fluid">

<!--  年龄统计  -->
<div class="row personelrow">
		<div class="center text">
			<h1>会员年龄统计</h1>
		</div>
</div>

<div class="row personelrow">
	<div class="col-md-4 col-md-offset-2">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">年龄段：</p></td>
					<td><p class="h6">人数统计</p></td>
					<td><p class="h6">百分比</p></td>
				</tr>
				<c:forEach var="item" items="${map }" varStatus="status">
				<tr class="danger center">
					<td><p class="h6">${item.key }</p></td>
					<td><p class="h6"><a>${item.value }</a></p></td>
					<td><p class="h6"><a>${percentages[status.index] }%</a></p></td>
				</tr>
				</c:forEach>
			</table>
	</div>
	<div class="col-md-offset-1 col-md-4" id="canvas-holder">
			<canvas id="age-area" width="300" height="300" />
	</div>
</div>

</div>

<script src="/imovie/common/js/Chart.js"></script>
<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>