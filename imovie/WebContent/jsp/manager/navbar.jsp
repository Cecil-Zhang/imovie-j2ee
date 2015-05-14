<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Static navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
			</button>
			<a class="navbar-brand" href="#">Cineplex</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.location=='index'}">class="active"</c:if> ><a
					href="/imovie/jsp/manager/manager_index.jsp">主页</a></li>
				<li <c:if test="${param.location=='plan'}">class="active"</c:if>><a
					href="movieAction.do?todo=review">放映计划</a></li>
				<li <c:if test="${param.location=='movie'}">class="active"</c:if>><a
					href="managerAction.do">电影</a></li>
				<li
					<c:if test="${param.location=='member'}">class="active dropdown"</c:if>
					<c:if test="${param.location!='member'}">class="dropdown"</c:if>
					><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">会员信息统计 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="managerAgeStaticAction.do">年龄统计</a></li>
						<li><a href="managerGenderStaticAction.do">性别统计</a></li>
						<li><a href="managerResidenceStaticAction.do">居住地统计</a></li>
						<li><a href="managerConsumptionStaticAction.do">消费统计</a></li>
						<li><a href="managerRechargeStaticAction.do">充值统计</a></li>
						<li><a href="managerActivityStaticAction.do">活动统计</a></li>
						<li><a href="managerUserStateStaticAction.do">会员资格统计</a></li>
					</ul></li>
				<li
					<c:if test="${param.location=='static'}">class="active dropdown"</c:if>
					class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">影院信息统计 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="managerDayCountStaticAction.do">日总人数</a></li>
						<li><a href="managerMonthCountStaticAction.do">月总人数</a></li>
						<li><a href="managerVideoHallStaticAction.do">放映厅上座率</a></li>
						<li><a href="managerAllMovieAction.do">电影上座率</a></li>
						<li><a href="managerPurchaseStaticAction.do">购票情况统计</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="./">Hello,&nbsp; 经理</a></li>
				<li class="active"><a href="../navbar-fixed-top/">${username }</a></li>
				<li><img src="/imovie/common/img/doctor.jpg" alt="头像"
					class="img-rounded mythumbnail" /></li>
				<li><a href="userLogoutAction.do">注销</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>