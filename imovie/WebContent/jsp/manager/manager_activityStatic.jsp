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
		var tarray=[];
		tarray=${body};
		var activity=[];
		activity=${body2};
		
		var activityData = {
				labels: ["January","February","March","April","May","June","July",
				"August","September","October","Noverbmer","December"],
				datasets:[{
					label:"活动个数",
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : tarray
				},{
					label:"参加活动人次",
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : activity
				}]
		}

		window.onload = function(){
			var ctx = document.getElementById("canvas").getContext("2d");
			window.myLine = new Chart(ctx).Line(activityData, {
				responsive : true,
				scaleLineColor :"#999966"
			});
		}
	</script>
<title>本年度会员充值统计</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>
	
<div class="container-fluid">

<!--  消费统计  -->
<div class="row personelrow">
		<div class="center text">
			<h1>本年度活动统计</h1>
		</div>
</div>

<div class="row personelrow">
	<div class="col-md-5 col-md-offset-1">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">月份</p></td>
					<td><p class="h6">活动数</p></td>
					<td><p class="h6">参加活动人数</p></td>
					<td><p class="h6">活动平均参加人次（人次/个）</p></td>
				</tr>
				<c:forEach var="item" items="${head }" varStatus="status">
				<tr class="danger center">
					<td><p class="h6">${item }</p></td>
					<td><p class="h6"><a>${body[status.index] }个</a></p></td>
					<td><p class="h6"><a>${body2[status.index] }人次</a></p></td>
					<td><p class="h6"><a>${percentages[status.index] }</a></p></td>
				</tr>
				</c:forEach>
			</table>
	</div>
	<div class="col-md-5 personelrow" id="canvas-holder">
			<canvas id="canvas" width="300" height="400" />
	</div>
</div>


</div>

<script src="/imovie/common/js/Chart.js"></script>
<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
</body>
</html>