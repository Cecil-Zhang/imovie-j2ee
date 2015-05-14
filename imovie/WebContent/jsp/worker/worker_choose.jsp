<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="主页">
<link rel="icon" href="/imovie/common/img/icon.ico" />
<link href="/imovie/common/css/style.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap -->
<link href="/imovie/common/css/bootstrap.min.css" rel="stylesheet" />
<!-- 包括flat ui样式 -->
<link href="/imovie/common/css/flat-ui.css" rel="stylesheet"/>
<title>选座</title>
</head>
<body>

<jsp:include page="navbar.jsp" >

<jsp:param name="location" value="sale" /> 

</jsp:include>
	
<div class="container-fluid">
	<form role="form" action="movieConfirmOrderAction.do" method="post" onsubmit="return check()">
	<div class="row personelrow">
		<div class="center text">
			<h1>选 &nbsp;座</h1>
		</div>
	</div>
	
	<div class="row personelrow">
		<div class="col-sm-6 col-md-4 col-md-offset-1">
          <div class="thumbnail">
            <img class="mythumbnail" src="/imovie/common/img/${screeningPlan.movie.poster }" alt="...">
            <div class="caption">
              <p><a class="h5">${screeningPlan.movie.name }&nbsp;&nbsp;</a><span id="price">${screeningPlan.seatPrice }元&nbsp;&nbsp;${screeningPlan.movie.type } &nbsp;-&nbsp;${screeningPlan.language }</span></p>
            <p>${screeningPlan.movie.duration }分钟   &nbsp;&nbsp;&nbsp;&nbsp;${screeningPlan.screeningTimeInString } &nbsp;&nbsp;&nbsp;&nbsp;${screeningPlan.screeningHall }</p>
			<p class="mydescription">&nbsp; &nbsp; &nbsp;${screeningPlan.movie.description }
			</p>
            </div>
          </div>
        </div>
		
		<div class="col-md-6 paddingForNav">
		
		<input type="hidden" name="planId" value="${screeningPlan.planId }" />
		<table class="table table-stripetable-hover table-condensed ">
			<tr class="active">
				<td>第一排</td>
				<td><label class="checkbox" for="checkbox01"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat01" id="checkbox01" <c:if test="${screeningPlan.seat01 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox02"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat02" id="checkbox02" <c:if test="${screeningPlan.seat02 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox03"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat03" id="checkbox03" <c:if test="${screeningPlan.seat03 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox04"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat04" id="checkbox04" <c:if test="${screeningPlan.seat04 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox05"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat05" id="checkbox05" <c:if test="${screeningPlan.seat05 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox06"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat06" id="checkbox06" <c:if test="${screeningPlan.seat06 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox07"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat07" id="checkbox07" <c:if test="${screeningPlan.seat07 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox08"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat08" id="checkbox08" <c:if test="${screeningPlan.seat08 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox09"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat09" id="checkbox09" <c:if test="${screeningPlan.seat09 }">disabled="disabled" checked</c:if>   ></label></td>	
			</tr>
			<tr class="active">
				<td>第二排</td>
				<td><label class="checkbox" for="checkbox11"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat11" id="checkbox11" <c:if test="${screeningPlan.seat11 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox12"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat12" id="checkbox12" <c:if test="${screeningPlan.seat12 }">disabled="disabled" checked</c:if> ></label></td>
				<td><label class="checkbox" for="checkbox13"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat13" id="checkbox13" <c:if test="${screeningPlan.seat13 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox14"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat14" id="checkbox14" <c:if test="${screeningPlan.seat14 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox15"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat15" id="checkbox15" <c:if test="${screeningPlan.seat15 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox16"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat16" id="checkbox16" <c:if test="${screeningPlan.seat16 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox17"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat17" id="checkbox17" <c:if test="${screeningPlan.seat17 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox18"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat18" id="checkbox18" <c:if test="${screeningPlan.seat18 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox19"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat19" id="checkbox19" <c:if test="${screeningPlan.seat19 }">disabled="disabled" checked</c:if>   ></label></td>

			</tr>
			<tr class="active">
				<td>第三排</td>
				<td><label class="checkbox" for="checkbox21"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat21" id="checkbox21" <c:if test="${screeningPlan.seat21}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox22"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat22" id="checkbox22" <c:if test="${screeningPlan.seat22}">disabled="disabled" checked</c:if> ></label></td>
				<td><label class="checkbox" for="checkbox23"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat23" id="checkbox23" <c:if test="${screeningPlan.seat23}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox24"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat24" id="checkbox24" <c:if test="${screeningPlan.seat24}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox25"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat25" id="checkbox25" <c:if test="${screeningPlan.seat25}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox26"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat26" id="checkbox26" <c:if test="${screeningPlan.seat26}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox27"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat27" id="checkbox27" <c:if test="${screeningPlan.seat27}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox28"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat28" id="checkbox28" <c:if test="${screeningPlan.seat28}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox29"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat29" id="checkbox29" <c:if test="${screeningPlan.seat29}">disabled="disabled" checked</c:if>   ></label></td>
			</tr>
			<tr class="active">
				<td>第四排</td>
				<td><label class="checkbox" for="checkbox31"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat31" id="checkbox31" <c:if test="${screeningPlan.seat31}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox32"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat32" id="checkbox32" <c:if test="${screeningPlan.seat32}">disabled="disabled" checked</c:if> ></label></td>
				<td><label class="checkbox" for="checkbox33"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat33" id="checkbox33" <c:if test="${screeningPlan.seat33}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox34"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat34" id="checkbox34" <c:if test="${screeningPlan.seat34}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox35"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat31" id="checkbox35" <c:if test="${screeningPlan.seat35}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox36"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat31" id="checkbox36" <c:if test="${screeningPlan.seat36}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox37"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat31" id="checkbox37" <c:if test="${screeningPlan.seat37}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox38"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat31" id="checkbox38" <c:if test="${screeningPlan.seat38}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox39"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat31" id="checkbox39" <c:if test="${screeningPlan.seat39}">disabled="disabled" checked</c:if>   ></label></td>
			</tr>
			
			<tr class="active">
				<td>第五排</td>
				<td><label class="checkbox" for="checkbox41"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat41" id="checkbox41" <c:if test="${screeningPlan.seat41}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox42"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat42" id="checkbox42" <c:if test="${screeningPlan.seat42}">disabled="disabled" checked</c:if> ></label></td>
				<td><label class="checkbox" for="checkbox43"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat43" id="checkbox43" <c:if test="${screeningPlan.seat43}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox44"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat44" id="checkbox44" <c:if test="${screeningPlan.seat44}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox45"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat45" id="checkbox45" <c:if test="${screeningPlan.seat45}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox46"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat46" id="checkbox46" <c:if test="${screeningPlan.seat46}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox47"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat47" id="checkbox47" <c:if test="${screeningPlan.seat47}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox48"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat48" id="checkbox48" <c:if test="${screeningPlan.seat48}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox49"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat49" id="checkbox49" <c:if test="${screeningPlan.seat49}">disabled="disabled" checked</c:if>   ></label></td>
			</tr>
			<tr class="active">
				<td>第六排</td>
				<td><label class="checkbox" for="checkbox51"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat51" id="checkbox51" <c:if test="${screeningPlan.seat51}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox52"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat52" id="checkbox52" <c:if test="${screeningPlan.seat52}">disabled="disabled" checked</c:if> ></label></td>
				<td><label class="checkbox" for="checkbox53"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat53" id="checkbox53" <c:if test="${screeningPlan.seat53}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox54"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat54" id="checkbox54" <c:if test="${screeningPlan.seat54}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox55"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat55" id="checkbox55" <c:if test="${screeningPlan.seat55}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox56"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat56" id="checkbox56" <c:if test="${screeningPlan.seat56}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox57"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat57" id="checkbox57" <c:if test="${screeningPlan.seat57}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox58"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat58" id="checkbox58" <c:if test="${screeningPlan.seat58}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox59"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat59" id="checkbox59" <c:if test="${screeningPlan.seat59}">disabled="disabled" checked</c:if>   ></label></td>
			</tr>
			<tr class="active">
				<td>第七排</td>
				<td><label class="checkbox" for="checkbox61"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat61" id="checkbox61" <c:if test="${screeningPlan.seat61}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox62"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat62" id="checkbox62" <c:if test="${screeningPlan.seat62}">disabled="disabled" checked</c:if>  ></label></td>
				<td><label class="checkbox" for="checkbox63"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat63" id="checkbox63" <c:if test="${screeningPlan.seat63}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox64"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat64" id="checkbox64" <c:if test="${screeningPlan.seat64}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox65"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat65" id="checkbox65" <c:if test="${screeningPlan.seat65}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox66"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat66" id="checkbox66" <c:if test="${screeningPlan.seat66}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox67"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat67" id="checkbox67" <c:if test="${screeningPlan.seat67}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox68"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat68" id="checkbox68" <c:if test="${screeningPlan.seat68}">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox69"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat69" id="checkbox69" <c:if test="${screeningPlan.seat69}">disabled="disabled" checked</c:if>   ></label></td>
			</tr>
			<tr class="success">
				<td>第八排</td>
				<td><label class="checkbox" for="checkbox71"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat71" id="checkbox71" <c:if test="${screeningPlan.seat71 }">disabled="disabled" checked</c:if>     ></label></td>
				<td><label class="checkbox" for="checkbox72"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat72" id="checkbox72" <c:if test="${screeningPlan.seat72 }">disabled="disabled" checked</c:if> ></label></td>
				<td><label class="checkbox" for="checkbox73"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat73" id="checkbox73" <c:if test="${screeningPlan.seat73 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox74"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat74" id="checkbox74" <c:if test="${screeningPlan.seat74 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox75"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat75" id="checkbox75" <c:if test="${screeningPlan.seat75 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox76"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat76" id="checkbox76" <c:if test="${screeningPlan.seat76 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox77"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat77" id="checkbox77" <c:if test="${screeningPlan.seat77 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox78"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat78" id="checkbox78" <c:if test="${screeningPlan.seat78 }">disabled="disabled" checked</c:if>   ></label></td>
				<td><label class="checkbox" for="checkbox79"><input type="checkbox" data-toggle="checkbox" onclick="clickSeat(this)" name="seat" value="seat79" id="checkbox79" <c:if test="${screeningPlan.seat79 }">disabled="disabled" checked</c:if>   ></label></td>
			</tr>
		</table>
		</div>
	</div>
	
	<div class="row personelrow">
		<div class="col-md-6 col-md-offset-3">
				<h4 id="bookedSeat">已选座位</h4>
		</div>
	</div>
	
	<div class="row personelrow">
		<div class="col-md-7 col-md-offset-5">
				<h4>费用合计：<span id="total">0</span>元 
				</h4>
		</div>
	</div>
	
	<div class="row personelrow">
		<input type="submit" class="btn btn-success btn-lg col-md-2 col-md-offset-5" value="下一步"/>
	</div>
	</form>
</div>

<script src="/imovie/common/js/jquery.min.js"></script>
<script src="/imovie/common/js/flat-ui.min.js"></script>
<script src="/imovie/common/assets/js/application.js"></script>
<script src="/imovie/common/js/seat.js"></script>
</body>
</html>