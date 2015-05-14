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
            <li <c:if test="${param.location=='index'}">class="active"</c:if>><a href="/imovie/jsp/member/member_index.jsp">主页</a></li>
            <li <c:if test="${param.location=='purchase'}">class="active"</c:if>><a href="movieAction.do?todo=buy">购票</a></li>
            <li <c:if test="${param.location=='activity'}">class="active dropdown"</c:if> class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的活动 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="orderMyValidActivityAction.do">未使用活动</a></li>
                <li><a href="orderMyAnsweredActivityAction.do">已使用活动</a></li>
              </ul>
            </li>
            <li <c:if test="${param.location=='member'}">class="active dropdown"</c:if> class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">会员操作 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/imovie/jsp/member/member_recharge.jsp">充值</a></li>
                <li><a href="#" onclick="stopQualify()">暂停资格</a></li>
                <li><a href="userShowLevelAction.do">等级查看</a></li>
				<li><a href="/imovie/jsp/member/member_myInformation.jsp">个人信息</a></li>
				<li><a href="orderOrderRecordAction.do">消费记录</a></li>
				<li><a href="userRechargeRecordAction.do">充值记录</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="./">Hello,&nbsp; 会员</a></li>
            <li class="active"><a href="../navbar-fixed-top/">${user.information.username }</a></li>
			<li><img src="/imovie/common/img/${user.information.image }" alt="头像" class="img-rounded mythumbnail" /></li>
			<li><a href="userLogoutAction.do">注销</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
    <script>
    	function stopQualify(){
    		$.ajax({
    			type: "POST",
    			url: "/imovie/json/ajaxCancelQualifyAction.do",
    			data: {},
    			dataType: "json",
    			success: function(data){
    				if(Boolean(data.loginFlag)){
    					alert("会员资格暂停成功，恢复请充值");
    				}else{
    					alert("操作失败，请重试");
    				}
    			},
    			error:function(XMLHttpRequest, textStatus, errorThrown){
    				alert("操作失败，请重试");
    				alert(XMLHttpRequest.status);
    				alert(XMLHttpRequest.readyState);
    				alert(textStatus);
    				return false;
    			}
    		});
    	}
    </script>