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

<title>${movie }--答题</title>
</head>
<body>
 <jsp:include page="navbar.jsp">
	<jsp:param name="location" value="activity" />
</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>答题——${movie }</h1>
	</div>
</div>
	
	
	<c:forEach var="ans" items="${order.answerList }" varStatus="status">
		<div class="row personelrow">
		<div class="col-md-offset-2">
		<h6><a>${status.count }. ${ans.questionare.title }（已选:${ans.answer }&nbsp; ；正确答案:${ans.questionare.correct }&nbsp;<c:if test="${ans.questionare.correct==ans.answer }">；奖励积分:${ans.questionare.questionCredit }</c:if>）</a></h6>
		</div>
	</div>
	<div class="row personelrow">
		<div class="form-group">
			  <div class="col-md-10 col-md-offset-2">
				<ul class="list-inline">
					<li><label class="radio inputLabel" for="male${status.count }">					
						A. ${ans.questionare.answerA }
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="female${status.count }">
						B. ${ans.questionare.answerB }
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="emale${status.count }">
						C. ${ans.questionare.answerC }
						</label>
					</li>
				</ul>
			</div>
         </div>
	</div>
	</c:forEach>
	
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>

  
</body>
</html>