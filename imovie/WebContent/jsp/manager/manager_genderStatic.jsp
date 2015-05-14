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
		
		var genderData = [{	
					value: "${map['男']}",color:"#F7464A",highlight: "#FF5A5E",label: "男"
				},{
					value: "${map['女']}",color: "#46BFBD",highlight: "#5AD3D1",label: "女"
				},
			];
		
			window.onload = function(){
				var ctx2 = document.getElementById("gender-area").getContext("2d");
				window.myPie = new Chart(ctx2).Pie(genderData);
			};
	</script>
<title>会员性别统计</title>
</head>
<body class="paddingForNav">
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>
	
<div class="container-fluid">

<!-- 性别统计  -->
<div class="row personelrow">
		<div class="center text">
			<h1>会员性别统计</h1>
		</div>
</div>

<div class="row personelrow">
	<div class="col-md-4 col-md-offset-2">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">性别：</p></td>
					<td><p class="h6">人数统计</p></td>
					<td><p class="h6">百分比</p></td>
				</tr>
				<c:forEach var="item" items="${map }" varStatus="status">
				<tr class="danger center">
					<td><p class="h6">${item.key}</p></td>
					<td><p class="h6"><a>${item.value}</a></p></td>
					<td><p class="h6"><a>${percentages[status.index]}%</a></p></td>
				</tr>
				</c:forEach>
			</table>
	</div>
	<div class="col-md-offset-1 col-md-4" id="canvas-holder">
			<canvas id="gender-area" width="300" height="300"/>
	</div>
</div>

</div>

<script src="/imovie/common/js/Chart.js"></script>
<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>