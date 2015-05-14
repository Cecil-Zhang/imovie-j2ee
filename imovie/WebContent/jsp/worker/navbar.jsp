<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Static navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
          </button>
          <a class="navbar-brand" href="#">Cineplex</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li <c:if test="${param.location=='index'}">class="active"</c:if>><a href="/imovie/jsp/worker/worker_index.jsp">主页</a></li>
            <li <c:if test="${param.location=='sale'}">class="active"</c:if>><a href="movieAction.do?todo=sale">售票</a></li>
			<li  <c:if test="${param.location=='plan'}">class="active dropdown"</c:if> <c:if test="${param.location!='plan'}">class="dropdown"</c:if> >
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">活动管理<b class="caret"></b></a>
              <ul class="dropdown-menu">
				<li><a href="movieEditPlanAction.do">创建放映计划</a></li>
				<li><a href="movieAction.do?todo=edit">修改放映计划</a></li>
				<li><a href="orderMakeQuizAction.do">创建活动</a></li>
				<li><a href="orderValidActivityAction.do">查看活动</a></li>
              </ul>
            </li>
            <form class="navbar-form navbar-left" action="userSearchAction.do" role="search">
            <div class="form-group">
              <div class="input-group">
                <input class="form-control" name="search" id="navbarInput-01" type="search" placeholder="会员搜索">
                <span class="input-group-btn">
                  <button type="submit" class="btn"><span class="fui-search"></span></button>
                </span>
              </div>
            </div>
          	</form>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="./">Hello,&nbsp; 工作人员</a></li>
            <li class="active"><a href="../navbar-fixed-top/">${username }</a></li>
			<li><img src="/imovie/common/img/lan.jpg" alt="${username }" class="img-rounded mythumbnail" /></li>
			<li><a href="userLogoutAction.do">注销</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>