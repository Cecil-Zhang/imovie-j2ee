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
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />

<!-- 包括font-awesome样式 -->
<link href="/imovie/common/css/font-awesome.min.css" rel="stylesheet"/>



<!-- 包括日期时间选择器样式 -->
<link href="/imovie/common/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<title>制定放映计划</title>
</head>
<body>

<jsp:include page="/jsp/worker/navbar.jsp" >

<jsp:param name="location" value="plan" /> 

</jsp:include>

<div class="container-fluid">

<div class="row personelrow">
	<div class="center text heading">
		<h1>制定放映计划</h1>
	</div>
</div>

<form action="movieMakePlanAction.do" method="post" onsubmit="return checkForm()">
<input type="hidden" name="planId" id="planId" <c:if test="${screeningPlan!=null }">value="${screeningPlan.planId }"</c:if> />
<div class="row personelrow">
	<div class="form-group">
		<label for="videoHall" class="col-md-2 col-md-offset-3 control-label inputLabel">放映厅</label>
		<div class="input-group col-md-6">
			<ul class="list-inline">
					<li><label class="radio inputLabel" for="videoHall1">
						<input name="videoHall" type="radio" data-toggle="radio" value="1号厅" id="videoHall1" <c:if test="${screeningPlan==null || screeningPlan.screeningHall=='1号厅' }">checked</c:if>>
						1号厅
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="videoHall2">
						<input name="videoHall" type="radio" data-toggle="radio" value="2号厅" id="videoHall2" <c:if test="${screeningPlan!=null && screeningPlan.screeningHall=='2号厅' }">checked</c:if>>
						2号厅
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="videoHall3">
						<input name="videoHall" type="radio" data-toggle="radio" value="3号厅" id="videoHall3" <c:if test="${screeningPlan!=null && screeningPlan.screeningHall=='3号厅' }">checked</c:if>>
						3号厅
						</label>
					</li>
				</ul>
		</div>
	</div>
</div>

<div class="row personelrow">
		<div class="form-group">
			<label for="payWay" class="col-md-2 col-md-offset-3 control-label inputLabel">放映电影</label>
				<div class="input-group col-md-3">
					<select data-toggle="select" class="form-control select select-primary mrs mbm" name="screeningMovie">
						<c:forEach var="movieItem" items="${movieList }">
							<option value="${movieItem.movieId}" <c:if test="${screeningPlan!=null && screeningPlan.movie.name==movieItem.name }">selected="selected"</c:if>>${movieItem.name }</option>
						</c:forEach>
					</select>
				</div>
		</div>
</div>

<div class="row personelrow">
	<div class="form-group">
		<label for="videoHall" class="col-md-2 col-md-offset-3 control-label inputLabel">放映语言</label>
		<div class="input-group col-md-6">
			<ul class="list-inline">
					<li><label class="radio inputLabel" for="English">
						<input name="language" type="radio" data-toggle="radio" value="英语" id="English" <c:if test="${screeningPlan==null || screeningPlan.language=='英语' }">checked</c:if>>
						英语
						</label>
					</li>
					<li><label class="radio inputLabel genderButton" for="Chinese">
						<input name="language" type="radio" data-toggle="radio" value="国语" id="Chinese" <c:if test="${screeningPlan!=null && screeningPlan.language=='国语' }">checked</c:if>>
						国语
						</label>
					</li>
				</ul>
		</div>
	</div>
</div>

<div class="row personelrow">
		<div class="form-group">
                <label for="dtp_input1" class="col-md-2 col-md-offset-3 control-label inputLabel">放映时间</label>
                <div class="input-group date form_datetime col-md-3" data-date="2013-03-16 21:00:00" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                    <input class="form-control" size="16" type="text" value="${screeningPlan.screeningTime }" name="screeningTime" id="screeningTime" required="required" onchange="checkTime()" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
				
        </div>
</div>
			
<div class="row personelrow">
		<div class="form-group">
			<label for="price" class="col-md-2 col-md-offset-3 control-label inputLabel">座位单价(元)</label>
			
			<div class="input-group col-md-3">
				<input type="text" name="price" id="price" class="form-control" value="${screeningPlan.seatPrice }" required="required"/>
				<span class="input-group-addon add-on"><i class="icon-legal"></i></span>
			</div>
		</div>
</div>

<div class="row personelrow">
		<input type="submit" class="btn btn-success btn-lg col-md-2 col-md-offset-5" id="submit" value="提交放映计划" />
</div>
</form>
</div>


<script type="text/javascript" src="/imovie/common/js/jquery.min.js"></script>
<script type="text/javascript" src="/imovie/common/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/imovie/common/js/flat-ui.min.js"></script>
<script type="text/javascript" src="/imovie/common/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/imovie/common/assets/js/application.js"></script>

<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        startDate: "2015-03-26 10:00"
    });
    
    var flag=false;
    function checkForm(){
    	var price=document.getElementById("price");
    	if(price.value=="" || price.value==null || isNaN(price.value)){
    		price.value="";
    		price.placeholder="价格必须为数字";
    		price.focus();
    		return false;
    	}
    	var time=document.getElementById("screeningTime");
    	if(time.value=="" || time.value==null){
    		time.focus();
    		return false;
    	}
    	var hall;
    	if(document.getElementById("videoHall1").checked){
    		hall="1号厅";
    	}else if(document.getElementById("videoHall2")){
    		hall="2号厅";
    	}else if(document.getElementById("videoHall3")){
    		hall="3号厅";
    	}
   		var planId=document.getElementById("planId").value;
    	var time=document.getElementById("screeningTime");
    	$.ajax({
    		type: "POST",
    		url: "/imovie/json/ajaxCheckTimeForHallAction.do",
    		data: {screeningTime:time.value,videoHall:hall,planId:planId},
    		dataType: "json",
    		success: function(data){
    			if(!data.loginFlag){
    				flag=true;
    			}else{
    				alert(hall+time.value+"忙，请选择其他时间");
    				time.focus();
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
    	if(flag){
    		return true;
    	}else{
    		return false;
    	}
    }
    
</script>
</body>
</html>