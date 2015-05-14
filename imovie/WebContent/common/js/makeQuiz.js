$(function () {
  $('[data-toggle="popover"]').popover()
})

var count=1;
function addQuestion(){
	var form=document.getElementById("quiz");
	var mydiv=document.getElementById("btnGroup");
	var newDiv=document.createElement("div");
	newDiv.className="row personelrow";
	newDiv.innerHTML='<ul class="list-inline"><li class="col-md-offset-1 col-md-1"><label class="control-label inputLabel">题目</label></li><li class="col-md-3"><input type="text" name="questions" id="question'+count+'" class="form-control" required="required"/></li>'
	  +'<li class="col-md-1 col-md-offset-1"><input type="text" required="required" placeholder="奖励积分" name="credit" id="credit'+count+'" class="form-control" "/></li><li class="col-md-3 col-md-offset-1">'
	  +'<div class="form-group"><div><ul class="list-inline"><li><label title="请在第一个输入框输入正确答案" data-placement="top" data-toggle="tooltip" class="radio inputLabel" for="type1'+count+'"><input name="type'+count+'" id="type1'+count+'" type="radio" data-toggle="radio" value="strict" checked>标准试题</label></li><li>'
	  +'<label title="无正确答案，选择多的选项奖励积分" data-placement="top" data-toggle="tooltip" class="radio inputLabel genderButton" for="type2'+count+'"><input name="type'+count+'" id="type2'+count+'" type="radio" data-toggle="radio" value="open">开放试题</label></li></ul></div></div></li></ul>';
	newDiv.setAttribute("id","sdiv"+count);
	var newnewDiv=document.createElement("div");
	newnewDiv.className="row";
	newnewDiv.innerHTML='<ul class="list-inline"><li class="col-md-1 col-md-offset-1"><label class="control-label inputLabel">选项</label></li><li class="input-group col-md-3"><div class="input-group rightMargin" ><input type="text" name="answerA" id="answerA'+count+'" class="form-control" required="required"/><span class="input-group-addon add-on">'
	+'<i class="icon-ok"></i></span></div></li><li class="input-group col-md-3"><div class="input-group rightMargin" ><input type="text" name="answerB" id="answerB'+count+'" class="form-control" required="required" /><span class="input-group-addon add-on"><i class="icon-remove"></i></span></div></li><li class="input-group col-md-3">'
	+'<div class="input-group rightMargin" ><input type="text" name="answerC" id="answerC'+count+'" class="form-control" required="required" /><span class="input-group-addon add-on"><i class="icon-remove"></i></span></div></li></ul>';
	newnewDiv.setAttribute("id","bdiv"+count);
	form.insertBefore(newnewDiv,mydiv);
	form.insertBefore(newDiv,newnewDiv);
	count=count+1;
	var hid=document.getElementById("typeCount");
	hid.value=count;
}

function removeQuestion(){
	count=count-1;
	var sdiv=document.getElementById("sdiv"+count);
	var bdiv=document.getElementById("bdiv"+count);
	var form=document.getElementById("quiz");
	form.removeChild(sdiv);
	form.removeChild(bdiv);
}

function changeMovie(obj){
	var movie=obj.value;
	var table=document.getElementById("table");
	table.innerHTML="";
	var head=document.createElement("tr");
	head.className="success center";
	head.innerHTML='<td><p class="h6">影片</p></td><td><p class="h6">放映时间</p></td><td><p class="h6">是否参加</p></td>';
	table.appendChild(head);
	$.ajax({
		type: "POST",
		url: "/imovie/json/ajaxFetchPlanByMovieIdAction.do",
		data: {movieId:movie},
		dataType: "json",
		success: function(data){
			for(var i=0;i<data.planList.length;i++){
				var tr=document.createElement("tr");
				tr.className="active center";
				tr.innerHTML='<td><p class="h6"><a>'+data.planList[i].movie.name+'</a></p></td><td><p class="h6"><a>'+data.planList[i].screeningTime+'</a></p></td><td><p class="h6"><a>参加</a>	<input type="checkbox" data-toggle="checkbox" name="plans" value="'+data.planList[i].planId+'"></p></td>';
				table.appendChild(tr);
				/*var td=document.createElement("td");
				var label=document.createElement("label");
				label.className="checkbox";
				var p=document.createElement("p");
				p.className="h6";
				p.innerHTML="<a>参加</a>";
				var input=document.createElement("input");
				input.setAttribute("type","checkbox");
				input.setAttribute("name","plan");
				input.setAttribute("id","input"+i);
				input.value=data.planList[i].planId;
				table.appendChild(tr);
				tr.appendChild(td);
				td.appendChild(label);
				label.appendChild(p);
				label.appendChild(input);
				$("#input"+i).attr("data-toggle","checkbox");*/
			}
			var img=document.getElementById("poster");
			img.setAttribute("src","/imovie/common/img/"+data.planList[0].movie.poster);
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
	});
}


function check(obj){
	var flag=false;
	if(document.all("plans")==undefined){
		$("#moviePoster").attr("data-content","当前电影无放映计划");
		$("#moviePoster").popover('show');
		return false;
	}
	for(var i=0;i<document.getElementsByName("plans").length;i++){
		if(document.getElementsByName("plans")[i].checked){
			flag=true;
		}
	}
	if(!flag){
		$("#moviePoster").attr("data-content","当前电影无放映计划");
		$("#moviePoster").focus();
		return false;
	}
	
	for(var i=0;i<count;i++){
		var question=document.getElementById("question0");
		if(question.value=="" || question.value==null){
			question.placeholder="请输入问题";
			question.focus();
			return false;
		}
		var credit=document.getElementById("credit"+i);
		if(credit.value=="" || credit.value==null){
			credit.placeholder="请输入奖励积分";
			credit.focus();
			return false;
		}
		var answerA=document.getElementById("answerA"+i);
		if(answerA.value=="" || answerA.value==null){
			answerA.placeholder="请输入答案";
			answerA.focus();
			return false;
		}
		var answerB=document.getElementById("answerB"+i);
		if(answerB.value=="" || answerB.value==null){
			answerB.placeholder="请输入答案";
			answerB.focus();
			return false;
		}
		var answerC=document.getElementById("answerC"+i);
		if(answerC.value=="" || answerC.value==null){
			answerC.placeholder="请输入答案";
			answerC.focus();
			return false;
		}
	}
	return true;
}