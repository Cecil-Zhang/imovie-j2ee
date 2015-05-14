<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>查看活动</title>
</head>
<body>

<jsp:include page="navbar.jsp" >

<jsp:param name="location" value="plan" /> 

</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>答题——${showMovie.name }</h1>
	</div>
</div>
	
	<div class="row personelrow">
        <div class="col-xs-6 col-md-2 col-md-offset-3">
          <a class="thumbnail" href="#">
            <img data-src="holder.js/140x140" src="/imovie/common/img/${showMovie.poster }" alt="...">
          </a>
        </div>
		
		<div class="col-md-5">
			<table class="table table-bordered table-hover table-condensed">
				<tr class="success center">
					<td><p class="h6">影片</p></td>
					<td><p class="h6">放映时间</p></td>
					<td><p class="h6">是否参加</p></td>
				</tr>
				<c:forEach var="plan" items="${activity.planList }">
				<tr class="active center">
					<td><p class="h6"><a>${showMovie.name }</a></p></td>
					<td><p class="h6"><a>${plan.screeningTimeInString }</a></p></td>
					<td><p class="h6"><a>参加</a></p></td>
				</tr>
				</c:forEach>
			</table>
		</div>
</div>
	<c:forEach var="question" items="${activity.questions }" varStatus="status">
	<!-- 题目 -->
	<div class="row personelrow">
		<div class="col-md-offset-2">
		<h6><a>${status.count }. ${question.title }&nbsp;&nbsp;(<c:if test="${question.questionType==false }">开放试题</c:if><c:if test="${question.questionType }">标准试题：正确答案&nbsp;${question.correct }</c:if>)</a></h6>
		</div>
	</div>
	<div class="row personelrow">
		<div class="form-group">
			  <div class="col-md-10 col-md-offset-2">
				<ul class="list-inline">
					<li><label class="radio inputLabel" for="male">
						<input name="answer${status.count }" type="radio" data-toggle="radio" id="male" disabled="disabled" <c:if test="${question.correct=='A' }">checked</c:if> />
						A. ${question.answerA }
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="female">
						<input name="answer${status.count }" type="radio" data-toggle="radio" value="1B" id="female" disabled="disabled" <c:if test="${question.correct=='B' }">checked</c:if> />
						B. ${question.answerB }
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="emale">
						<input name="answer${status.count }" type="radio" data-toggle="radio" value="1C" id="emale" disabled="disabled" <c:if test="${question.correct=='C' }">checked</c:if> />
						C. ${question.answerC }
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

<script>
      $(function () {
        $('[data-toggle=tooltip]').tooltip();
      });
</script>
  
</body>
</html>