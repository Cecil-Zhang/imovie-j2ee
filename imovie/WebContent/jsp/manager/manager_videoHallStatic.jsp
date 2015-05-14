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
		var data="${dataInString}";
		var table=new Array();
		table=data.split(";");
		var hall1=new Array();
		hall1=table[0].split(",");
		var hall2=new Array();
		hall2=table[1].split(",");
		var hall3=new Array();
		hall3=table[2].split(",");
		
		var activityData = {
				labels: ["January","February","March","April","May","June","July",
				"August","September","October","Noverbmer","December"],
				datasets:[{
					label:"1号厅",
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : hall1
				},{
					label:"2号厅",
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : hall2
				},{
					label:"3号厅",
					fillColor : "rgba(204,204,153,0.5)",
					strokeColor : "rgba(204,204,153,1)",
					pointColor : "rgba(204,204,153,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : hall3
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
<title>本年度各放映厅统计</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="static" />
</jsp:include>
	
<div class="container-fluid">

<!--  本年度各放映厅上座率统计  -->
<div class="row personelrow">
		<div class="center text">
			<h1>本年度各放映厅上座率统计</h1>
		</div>
</div>

<div class="row personelrow">
	<div class="col-md-5 col-md-offset-1">
			<table class="table table-bordered table-hover table-condensed">
				<th class="success center">
					<td><p class="danger h6">一号厅</p></td>
					<td><p class="h6">二号厅</p></td>
					<td><p class="h6">三号厅</p></td>
				</th>
				<c:forEach var="item" items="${head }" varStatus="status">
					<tr class="danger center">
					<td><p class="h6">${item }</p></td>
					<td><p class="h6"><a>${data[0][status.index] }%</a></p></td>
					<td><p class="h6"><a>${data[1][status.index] }%</a></p></td>
					<td><p class="h6"><a>${data[2][status.index] }%</a></p></td>
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