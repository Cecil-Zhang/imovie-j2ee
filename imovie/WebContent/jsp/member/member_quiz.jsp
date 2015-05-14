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
		<h1>答题——${requestScope.movie }</h1>
	</div>
</div>
	
	<form method="post" action="orderSaveAnswerAction.do" role="form" id="info">
	<input type="hidden" name="orderId" value="${orderId }" />
	<input type="hidden" name="questionNum" value="${fn:length(activity.questions) }" />
	<c:forEach var="q" items="${activity.questions }" varStatus="status">
		<div class="row personelrow">
		<div class="col-md-offset-2">
		<h6><a>${status.count }. ${q.title }</a></h6>
		</div>
	</div>
	<input type="hidden" name="questionId${status.index }" value="${q.questionId }" />
	<div class="row personelrow">
		<div class="form-group">
			  <div class="col-md-10 col-md-offset-2">
				<ul class="list-inline">
					<li><label class="radio inputLabel" for="male${status.count }">
						<input name="answer${status.index }" type="radio" data-toggle="radio" value="A" id="male${status.count }">
						A. ${q.answerA }
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="female${status.count }">
						<input name="answer${status.index }" type="radio" data-toggle="radio" value="B" id="female${status.count }" >
						B. ${q.answerB }
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="emale${status.count }">
						<input name="answer${status.index }" type="radio" data-toggle="radio" value="C" id="emale${status.count }" >
						C. ${q.answerC }
						</label>
					</li>
				</ul>
			</div>
         </div>
	</div>
	</c:forEach>
	
	<!-- 提交和重置按钮 -->
	<div class="row personelrow">
		<div class="form-group">
			<div class="col-md-3 col-md-offset-4">
			<input name="submit" type="submit"  value="提交" class="btn btn-inverse btn-embossed btn-lg col-md-4"></input>			
			</div>
			<div class="col-md-3">
			<input name="reset" type="reset" value="取消" onblur="changeBar()" class="btn btn-default btn-embossed btn-lg col-md-4"></input>
			</div>
		</div>
	</div>
	
	</form>	
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>

<script>
      $(function () {
        $('[data-toggle=tooltip]').tooltip();
      });
</script>
  
</body>
</html>