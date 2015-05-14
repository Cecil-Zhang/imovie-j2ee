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
		var head=new Array();
		var name="${name}";
		head=name.split(",");
		var tarray=[];
		tarray=${body};
		
		var Data = {
				labels: head,
				datasets:[{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data : tarray
				}]
		}

		window.onload = function(){
			var ctx = document.getElementById("canvas").getContext("2d");
			window.myBar = new Chart(ctx).Bar(Data, {
				responsive : true,
				scaleLineColor :"#999966"
			});
		}
	</script>
<title>影院日总人数统计</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="static" />
</jsp:include>
	
<div class="container-fluid">

<!--  影院日总人数统计  -->
<div class="row personelrow">
		<div class="center text">
			<h1>影院日总人数统计 </h1>
		</div>
</div>

<div class="row personelrow">
	<div class="col-md-4 col-md-offset-1">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">日期</p></td>
					<td><p class="h6">总人数</p></td>
					<td><p class="h6">百分比</p></td>
				</tr>
				<c:forEach var="item" items="${head }" varStatus="status">
				<tr class="danger center">
					<td><p class="h6">${item }</p></td>
					<td><p class="h6"><a>${body[status.index] }人次</a></p></td>
					<td><p class="h6"><a>${percentages[status.index] }%</a></p></td>
				</tr>
				</c:forEach>
			</table>
	</div>
	<div class="col-md-5 col-md-offset-1" id="canvas-holder">
			<canvas id="canvas" width="300" height="300" />
	</div>
</div>

</div>

<script src="/imovie/common/js/Chart.js"></script>
<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>