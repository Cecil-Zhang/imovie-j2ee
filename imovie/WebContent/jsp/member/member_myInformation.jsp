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

<title>个人信息</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="member" />
</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>个人信息</h1>
	</div>
</div>
	
	<form method="post" enctype="multipart/form-data" action="userEditInformationAction.do" role="form" id="info" onSubmit="return edit()">
	<!-- 用户名 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="inputUsername" class="col-md-2 col-md-offset-3 control-label inputLabel">用户名</label>
			<div class="col-md-4">
				<div class="input-group">
				<input type="text" name="username" id="username" class="form-control disableInput" value="${user.information.username }" readonly="readonly"/>
				<span class="input-group-addon add-on"><i class="icon-user-md"></i></span>
				</div>
			</div>
			<div class="col-md-3 text" id="nameerror"></div>
		</div>
	</div>
	
	<!-- 年龄 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="age" class="col-md-2 col-md-offset-3 control-label inputLabel">年龄</label>
			<div class="col-md-4">
				<div class="input-group">
				<input type="text" name="age" id="age" value="${user.information.age }" class="form-control disableInput" readonly="readonly"/>
				<span class="input-group-addon add-on"><i class="icon-coffee"></i></span>
				</div>
			</div>
			<div class="col-md-3 text" id="nameerror"></div>
		</div>
	</div>
	
	<!-- 居住地 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="residence" class="col-md-2 col-md-offset-3 control-label inputLabel">居住地</label>
				<div class="input-group col-md-4" id="bankDiv">
					<select data-toggle="select" class="form-control select select-primary mrs mbm" name="residence" id="residence" disabled="disabled">
						<optgroup label="南京">
						  <option value="鼓楼区" <c:if test="${user.information.residence=='鼓楼区' }">selected</c:if>>鼓楼区</option>
						  <option value="栖霞区" <c:if test="${user.information.residence=='栖霞区' }">selected</c:if>>栖霞区</option>
						  <option value="浦口区" <c:if test="${user.information.residence=='浦口区' }">selected</c:if>>浦口区</option>
						  <option value="玄武区" <c:if test="${user.information.residence=='玄武区' }">selected</c:if>>玄武区</option>
						</optgroup>
					</select>
				</div>
		</div>
	</div>
	
	<!-- 头像 -->
	<div class="row personelrow">
		<div class="col-md-4 col-md-offset-4">
			<div class="text" id="inerror"></div>
		</div>
	</div>
	<div class="row personelrow">
		<div class="form-group">
			<label for="inputPic" class="col-md-2 col-md-offset-3 control-label inputLabel">头像</label>
			<div class="col-md-3">
				<div class="input-group">
				<input type="file" id="inputPic" name="image"  accept="image/gif,image/jpeg,image/png,image/pjpeg" alt="头像" data-toggle="popover" data-placement="left" data-trigger="focus" onchange="setImagePreview()" disabled="disabled">
                <p class="help-block">支持JPG、PNG、GIF格式,不超过2M。</p>
				</div>
			</div>
		</div>
		<div class="col-md-2" id="headImg">
			<img src="/imovie/common/img/${user.information.image }" alt="头像" class="img-rounded img-responsive" id="head">
		</div>
	</div>
	
	
	
	<!-- 性别 -->
	<div class="row personelrow">
		<div class="form-group">
			  <label class="col-md-2 col-md-offset-3 control-label inputLabel">性别</label>
			  <div class="col-md-3">
				<ul class="list-inline">
					<li><label class="radio inputLabel" for="male">
						<input name="gender" type="radio" data-toggle="radio" value="male" id="male" disabled="disabled" <c:if test="${user.information.gender=='male' }"> checked</c:if>>
						男
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="female">
						<input name="gender" type="radio" data-toggle="radio" value="female" id="female" disabled="disabled" <c:if test="${user.information.gender=='female' }"> checked</c:if>>
						女
						</label>
					</li>
				</ul>
			</div>
         </div>
	</div>
	
	<!-- 银行 -->
	
	<div class="row personelrow">
	
		<div class="form-group">
			<label for="bank" class="col-md-2 col-md-offset-3 control-label inputLabel">银行</label>
				<div class="input-group col-md-4" id="bankDiv">
					<select data-toggle="select" class="form-control select select-primary mrs mbm" id="bank" name="bank" disabled="disabled">
						<optgroup label="银行">
						  <option value="中国工商银行" <c:if test="${user.information.bank=='中国工商银行' }"> selected</c:if>>中国工商银行</option>
						  <option value="中国建设银行" <c:if test="${user.information.bank=='中国建设银行' }">selected</c:if>>中国建设银行</option>
						  <option value="中国农业银行" <c:if test="${user.information.bank=='中国农业银行' }"> selected</c:if>>中国农业银行</option>
						  <option value="中国招商银行" <c:if test="${user.information.bank=='中国招商银行' }">selected</c:if>>中国招商银行</option>
						  <option value="中国银行" <c:if test="${user.information.bank=='中国银行' }">selected</c:if>>中国银行</option>
						</optgroup>
						<optgroup label="其他">
						  <option value="支付宝" <c:if test="${user.information.bank=='支付宝' }">selected</c:if>>支付宝</option>
						  <option value="百度钱包" <c:if test="${user.information.bank=='百度钱包' }">selected</c:if>>百度钱包</option>
						  <option value="微信支付" <c:if test="${user.information.bank=='微信支付' }">selected</c:if>>微信支付</option>
						</optgroup>
					</select>
				</div>
		</div>
	</div>
	
	<!-- 银行卡账号 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="bankAccount" class="col-md-2 col-md-offset-3 control-label inputLabel">银行卡账号</label>
			<div class="col-md-4">
				<div class="input-group">
				<input type="text" class="form-control bank disableInput" id="bankAccount" name="bankAccount" value="${user.information.bankAccout }"  readonly="readonly"/>
				<span class="input-group-addon add-on"><i class="icon-money"></i></span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 密码 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="password" class="col-md-2 col-md-offset-3 control-label inputLabel">密码</label>
			<div class="col-md-4">
				<div class="input-group">
				<input type="password" class="form-control bank disableInput" name="password" id="password" readonly="readonly"/>
				<span class="input-group-addon add-on"><i class="icon-money"></i></span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 提交和重置按钮 -->
	<div class="row personelrow">
		<div class="form-group">
			<div class="col-md-3 col-md-offset-4">
			<input name="submit" type="submit" id="submit" value="编辑" class="btn btn-inverse btn-embossed btn-lg col-md-4"></input>			
			</div>
			<div class="col-md-3">
			<input name="reset" type="reset" value="取消"  class="btn btn-default btn-embossed btn-lg col-md-4"></input>
			</div>
		</div>
	</div>
	
	</form>	
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
<script src="/imovie/common/js/myInformation.js"></script>
<script>
      $(function () {
        $('[data-toggle=tooltip]').tooltip();
      });
</script>
  
</body>
</html>