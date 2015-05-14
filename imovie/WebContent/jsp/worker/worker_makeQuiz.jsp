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
<link href="/imovie/common/css/style.css" rel="stylesheet"
	type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />

<!-- 包括font-awesome样式 -->
<link href="/imovie/common/css/font-awesome.min.css" rel="stylesheet" />

<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet" />

<!-- 包括日期时间选择器样式 -->
<link href="/imovie/common/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<title>制定活动</title>
</head>
<body>

	<jsp:include page="navbar.jsp">

		<jsp:param name="location" value="plan" />

	</jsp:include>

	<div class="container-fluid">

		<div class="row personelrow">
			<div class="center text heading">
				<h1>制定活动</h1>
			</div>
		</div>

		<form id="quiz" action="orderSaveQuizAction.do" method="post" name="quiz" onsubmit="return check(this)">
			<div class="row personelrow">
				<div class="form-group">
					<label class="col-md-2 col-md-offset-3 control-label inputLabel">活动影片</label>
					<div class="input-group col-md-3 col-md-offset-1">
						<select data-toggle="select" name="movie"
							class="form-control select select-primary mrs mbm"
							onchange="changeMovie(this)" id="movid">
							<c:forEach var="movie" items="${movieList }">
								<option value="${movie.movieId }">${movie.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="row personelrow">
				<div class="col-xs-6 col-md-2 col-md-offset-3">
					<a class="thumbnail" href="#" tabindex="0" data-toggle="popover" data-placement="left" data-trigger="focus" title="${movie.name }" id="moviePoster"> 
					<img data-src="holder.js/140x140" src="/imovie/common/img/${movieList[0].poster }"
						id="poster">
					</a>
				</div>

				<div class="col-md-5">
					<table class="table table-bordered table-hover table-condensed"
						id="table">
						<tr class="success center">
							<td><p class="h6">影片</p></td>
							<td><p class="h6">放映时间</p></td>
							<td><p class="h6">是否参加</p></td>
						</tr>
						<c:if test="${planList==null || fn:length(planList)==0 }">
							<tr class="active center">
								<td><p class="h6">
										<a>暂无</a>
									</p></td>
								<td><p class="h6">
										<a>暂无</a>
									</p></td>
								<td><p class="h6"><a>暂无</a></p></td>
							</tr>
						</c:if>
						<c:forEach var="plan" items="${requestScope.planList }">
							<tr class="active center">
								<td><p class="h6">
										<a>${plan.movie.name }</a>
									</p></td>
								<td><p class="h6">
										<a>${plan.screeningTimeInString }</a>
									</p></td>
								<td><p class="h6"><a>参加</a><input type="checkbox" name="plans" value="${plan.planId }" /></p>
										</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

			<div class="row personelrow">
				<ul class="list-inline">
					<li class="col-md-offset-1 col-md-1"><label
						class="control-label inputLabel">题目</label></li>
					<li class="col-md-3"><input type="text" name="questions"
						id="question0" class="form-control" required="required"/>
					</li>

					<li class="col-md-1 col-md-offset-1"><input type="text"
						placeholder="奖励积分" name="credit" id="credit0"
						class="form-control" required="required" /></li>
					<li class="col-md-3 col-md-offset-1">
						<div class="form-group">
							<div>
								<ul class="list-inline">
									<li><label title="请在第一个输入框输入正确答案" data-placement="top"
										data-toggle="tooltip" class="radio inputLabel" for="male">
											<input name="type0" type="radio" data-toggle="radio"
											value="strict" id="male" checked /> 标准试题
									</label></li>
									<li><label title="无正确答案，选择多的选项奖励积分" data-placement="top"
										data-toggle="tooltip" class="radio inputLabel genderButton"
										for="female"> <input name="type0" type="radio"
											data-toggle="radio" value="open" id="female" /> 开放试题
									</label></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>

			<div class="row">
				<ul class="list-inline">
					<li class="col-md-1 col-md-offset-1"><label
						class="control-label inputLabel">选项</label></li>
					<li class="input-group col-md-3">
						<div class="input-group rightMargin">
							<input type="text" name="answerA" id="answerA0"
								class="form-control" required="required"/> <span
								class="input-group-addon add-on"><i class="icon-ok"></i></span>
						</div>
					</li>
					<li class="input-group col-md-3">
						<div class="input-group rightMargin">
							<input type="text" name="answerB" id="answerB0"
								class="form-control" required="required"/> <span
								class="input-group-addon add-on"><i class="icon-remove"></i></span>
						</div>
					</li>
					<li class="input-group col-md-3">
						<div class="input-group rightMargin">
							<input type="text" name="answerC" id="answerC0"
								class="form-control" required="required"/> <span
								class="input-group-addon add-on"><i class="icon-remove"></i></span>
						</div>
					</li>
				</ul>
			</div>
	<input type="hidden" name="type" id="typeCount" value="1"/>
			<div id="btnGroup" class="row personelrow">
				<button type="button"
					class="btn btn-primary col-md-2 col-md-offset-2"
					onclick="addQuestion()">添加问题</button>
				<button type="button"
					class="btn btn-default col-md-2 col-md-offset-1"
					onclick="removeQuestion()">移除问题</button>
				<input type="submit"
					class="btn btn-info btn-lg col-md-2 col-md-offset-1" name="submit" id="submit"
					value="提交放映计划" />
			</div>

		</form>
	</div>

	
	<script type="text/javascript" src="/imovie/common/js/jquery.min.js"></script>
	<script src="/imovie/common/js/bootstrap.min.js"></script>
	<script src="/imovie/common/js/popover.js"></script>
	<script type="text/javascript" src="/imovie/common/js/flat-ui.min.js"></script>
	<script type="text/javascript"
		src="/imovie/common/assets/js/application.js"></script>
	<script type="text/javascript" src="/imovie/common/js/makeQuiz.js"></script>
	<script>
		$(function() {
			$('[data-toggle=tooltip]').tooltip();
		});
	</script>
</body>
</html>