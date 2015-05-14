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

<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet" />
<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<title>登录</title>
</head>
<body>
	<div class="progress" style="height: 70px; top: 0px;">
		<div class="progress-bar progress-bar-striped active"
			role="progressbar" aria-valuenow="45" aria-valuemin="0"
			aria-valuemax="100" style="width: 100%;">
			<span class="sr-only">45% Complete</span>
			<div class="heading text">Cineplex -- 爱电影，爱生活</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="span4 col-md-3">
				<div class="todo mrm">
					<div class="todo-search">
						<h4 class="todo-name h3">Screening Schedule</h4>
					</div>
					<ul>
						<li class="todo-done">
							<div class="todo-icon fui-video"></div>
							<div class="todo-content">
								<h4 class="todo-name">《金刚狼》 3D 120分钟</h4>
								12:00 英语
							</div>
						</li>

						<li>
							<div class="todo-icon fui-video"></div>
							<div class="todo-content">
								<h4 class="todo-name">
									《蜘蛛侠3》 3D <br /> 130分钟
								</h4>
								13:00 英语
							</div>
						</li>

						<li>
							<div class="todo-icon fui-video"></div>
							<div class="todo-content">
								<h4 class="todo-name">
									《雪国列车》 3D <br /> 150分钟
								</h4>
								14:00 英语
							</div>
						</li>

						<li>
							<div class="todo-icon fui-video"></div>
							<div class="todo-content">
								<h4 class="todo-name">《金刚狼》 3D 120分钟</h4>
								14:00 国语
							</div>
						</li>

					</ul>
				</div>
			</div>


			<div id="carousel-example-generic" class="carousel slide col-md-9"
				data-ride="carousel" data-interval="4000">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<a href="#login" onclick="check()"><img src="/imovie/common/img/wolf.jpg" class="poster" alt="金刚狼" /></a>
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<a href="#login"><img src="/imovie/common/img/spider.jpg" class="poster" alt="蜘蛛侠3" /></a>
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<a href="#login"><img src="/imovie/common/img/snow.jpg" class="poster" alt="雪国列车" /></a>
						<div class="carousel-caption"></div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<div class="row personelrow" id="login">
		<div class="login col-md-8 col-md-offset-2" >
			<div class="login-screen">
				<div class="login-icon">
					<img src="/imovie/common/img/icon.ico" alt="Welcome to Cineplex" />
					<h4>
						Welcome to <small>Cineplex</small>
					</h4>
				</div>

				<form action="userAction.do" method="post" id="form" onsubmit="return check()">
					<div class="login-form">
						<div class="control-group" >
							<input type="text" class="login-field"	placeholder="Enter your ID" name="userid" id="login-name" />
							<label class="login-field-icon fui-man-16" for="login-name">账号</label>
						</div>

						<div class="control-group">
							<input type="password" class="login-field" name="password"
								placeholder="Password" id="login-pass" /> <label
								class="login-field-icon fui-lock-16" for="login-pass">密码</label>
						</div>


						<ul class="list-inline role">
							<li class="role rightMargin"><label class="radio"
								for="member"> <input name="role" type="radio"
									data-toggle="radio" value="member" id="member"  checked="checked" /> 会员
							</label></li>
							<li class="rightMargin"><label class="radio" for="waiter">
									<input name="role" type="radio" data-toggle="radio"
									value="worker" id="waiter" /> 服务员
							</label></li>
							<li><label class="radio" for="manager"> <input name="role" type="radio" data-toggle="radio" value="manager" id="manager" /> 经理
							</label></li>
						</ul>


					     <input type="submit" class="btn btn-primary btn-block col-md-2" tabindex="0" data-toggle="popover" data-placement="left" data-trigger="focus" id="submit" value="登录" /> 
						<!-- <input class="btn btn-primary btn-hg button" type="submit"
							value="登录"></input> <a
							class="btn btn-primary btn-large button" >注册</a> -->
						<a class="login-link" href="/imovie/jsp/signup.jsp">No account yet?</a>
					</div>
				</form>
			</div>
			
		</div>
	</div>
	
	

	<script src="/imovie/common/js/jquery.min.js"></script>
	<script src="/imovie/common/js/flat-ui.min.js"></script>
	<script src="/imovie/common/assets/js/application.js"></script>
	
	<script type="text/javascript">
		var flag=false;
		function check(){
			var id=document.getElementById("login-name");
			if(id.value=="" || id.value==null){
				id.placeholder="请输入会员账户";
				id.focus();
				return false;
			}
			var pass=document.getElementById("login-pass");
			if(pass.value=="" || pass.value==null){
				pass.placeholder="请输入密码";
				pass.focus();
				return false;
			}
			var role;
			var mem=document.getElementById("member");
			var worker=document.getElementById("waiter");
			var manager=document.getElementById("manager");
			if(mem.checked){
				role="member";
			}else if(worker.checked){
				role="worker";
			}else if(manager.checked){
				role="manager";
			}
			$.ajax({
				type: "POST",
				url: "/imovie/json/ajaxLoginAction.do",
				data: {userId:id.value,password:pass.value,role:role},
				dataType: "json",
				success: function(data){
					if(data.loginFlag){
						flag=true;
					}else{
						var form=document.getElementById("form");
						form.reset();
						id.placeholder="账户或密码错误，请重试";
						id.focus();
						flag=false;
					}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
					flag=false;
				}
			});
			return flag;
		}
		
		
	</script>
</body>
</html>