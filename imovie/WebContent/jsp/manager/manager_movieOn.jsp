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

<title>电影上线</title>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="location" value="movie" />
</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text">
		<h1>电影上线</h1>
	</div>
</div>
	
	<form method="post" enctype="multipart/form-data" action="managerMovieOnAction.do" role="form" id="info" onsubmit="return check()">
	<!-- 电影名称 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="inputUsername" class="col-md-2 col-md-offset-3 control-label inputLabel">电影名称</label>
			<div class="col-md-4">
				<div class="input-group">
				<input type="text" name="name" id="name" class="form-control" required/>
				<span class="input-group-addon add-on"><i class="icon-camera-retro"></i></span>
				</div>
			</div>
			<div class="col-md-3 text" id="nameerror"></div>
		</div>
	</div>
	
	<!-- 类型 -->
	<div class="row personelrow">
		<div class="form-group">
			<label for="type" class="col-md-2 col-md-offset-3 control-label inputLabel">电影类型</label>
			<div class="col-md-4">
				<div class="input-group">
				<input type="text" name="type" id="type" class="form-control" required/>
				<span class="input-group-addon add-on"><i class="icon-bookmark"></i></span>
				</div>
			</div>
			<div class="col-md-3 text" id="nameerror"></div>
		</div>
	</div>
	
	<!-- 海报 -->
	<div class="row personelrow">
		<div class="col-md-4 col-md-offset-4">
			<div class="text" id="inerror"></div>
		</div>
	</div>
	<div class="row personelrow">
		<div class="form-group">
			<label for="inputPic" class="col-md-2 col-md-offset-3 control-label inputLabel">电影海报</label>
			<div class="col-md-3">
				<div class="input-group">
				<input type="file" id="inputPic" name="poster" onchange="setImagePreview()" accept="image/gif,image/jpeg,image/png,image/pjpeg" alt="头像">
                <p class="help-block">支持JPG、PNG、GIF格式,不超过2M。</p>
				</div>
			</div>
		</div>
		<div class="col-md-2" id="headImg">
			<img src="/imovie/common/img/conan.jpg" alt="头像" class="img-rounded img-responsive" id="head" style="display:none">
		</div>
	</div>
	
	
	
	<!-- 电影时长 -->
	<div class="row personelrow">
		<div class="form-group">
			  <label for="duration" class="col-md-2 col-md-offset-3 control-label inputLabel">电影时长</label>
			  <div class="col-md-4">
				<div class="input-group">
				<input type="text" name="duration" id="duration" class="form-control" required/>
				<span class="input-group-addon add-on"><i class="icon-coffee"></i></span>
				</div>
			</div>
         </div>
	</div>
	
	<!-- 剧情简介 -->
	
	<div class="row personelrow">
	
		<div class="form-group">
			<label for="description" class="col-md-2 col-md-offset-3 control-label inputLabel">剧情简介</label>
			<div class="col-md-4">
				<div class="input-group">
				<textarea rows="4" name="description" id="description" class="form-control" required></textarea>
				<span class="input-group-addon add-on"><i class="icon-edit"></i></span>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 提交和重置按钮 -->
	<div class="row personelrow">
		<div class="form-group">
			<div class="col-md-3 col-md-offset-4">
			<input name="submit" type="submit"  value="发布" class="btn btn-inverse btn-embossed btn-lg col-md-4"></input>			
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
      
      function setImagePreview() {
    	    var docObj=document.getElementById("inputPic");
    	    var img = document.getElementById("head"); 
    	    
    	    if(docObj.files && docObj.files[0]){ 
    	    	img.style.display = "block";
    	        img.src = window.URL.createObjectURL(docObj.files[0]);
    	    }
    	}
      
      function check(){
    	  var age=document.getElementById("duration");
    		if(age.value=="" || age.value==null || isNaN(age.value)){
    			age.value="";
    			age.placeholder="请输入数字";
    			age.focus();
    			return false;
    		}
      }
</script>
  
</body>
</html>