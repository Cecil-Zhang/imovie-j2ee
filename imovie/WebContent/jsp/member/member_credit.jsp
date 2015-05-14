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
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<!-- 包括font-awesome样式 -->
<link href="/imovie/common/css/font-awesome.min.css" rel="stylesheet"/>
<title>等级查看</title>
</head>
<body class="paddingForNav">
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>
	
<div class="container-fluid">
<div class="row personelrow">
<div class="center text">
  <h1>等级查看</h1>
</div>
</div>

<div class="row personelrow">
<div class="col-md-3 col-md-offset-5">
<button class="btn btn-primary"><h6>当前等级：${mylevel } <i class="icon-{$icon} paddingRight"></i></h6></button>
</div>
</div>

<div class="row personelrow">
<div class="col-md-offset-3 col-md-6">
<div class="progress" title="当前已消费${amount }，升级还需${gap}" data-placement="left" data-toggle="tooltip">
  <div class="progress-bar" style="width: ${progress}%;"></div>
  <div class="progress-bar progress-bar-warning" style="width: ${100-progress}%;"></div>
 </div>
 </div>
</div>

<div class="row personelrow">
<div class="col-md-8 col-md-offset-2">
<table class="table table-bordered">
<!-- On rows -->
<tr class="success active">
	<td class="center">等级</td>
	<td class="center">累计消费</td>
	<td class="center">优惠</td>
</tr>
<c:forEach var="l" items="${levels }">
<tr class="danger">
	<td class="center"><i class="icon-truck paddingRight"></i>${l.levelName }</a></td>
	<td class="center">[${l.lowerLimit },${l.upperLimit })</td>
	<td class="center">${l.discount }折</td>
</tr>
</c:forEach>
</table>

</div>
</div>
<div class="row personelrow">
	<label class="col-md-2 col-md-offset-4 control-label"><span class="h6">当前余额</span></label>
	<label class="col-md-3 col-md-offset-1 control-label"><span class="h6"><span id="balance">${user.information.balance }</span>元</span></label>
</div>

<div class="row personelrow">
	<label class="col-md-2 col-md-offset-4 control-label"><span class="h6">当前积分</span></label>
	<label class="col-md-3 col-md-offset-1 control-label"><span class="h6"><span id="credit">${user.information.credit }</span>分</span></label>
</div>

<div class="row personelrow">
	<div class="form-group">
			<div class="col-md-offset-4 col-md-3">
				<div class="input-group">
				<input type="text" id="exchange" placeholder="100积分=1元" class="form-control" onblur="check(this)"/>
				<span class="input-group-addon add-on"><i class="icon-money"></i></span>
				</div>
			</div>
			<a class="h4 btn btn-primary btn-md input-group" onclick="submit()">兑换&nbsp;&nbsp;&nbsp;<i class="icon-plus-sign-alt"></i></a>
	</div>
</div>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/js/creditExchange.js"></script>
<script>
      $(function () {
        $('[data-toggle=tooltip]').tooltip();
      });
</script>
</body>
</html>