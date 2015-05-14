function check(obj){
	var balance=parseInt(document.getElementById("balance").innerHTML);
	var credit=parseInt(document.getElementById("credit").innerHTML);
	if(obj.value=="" || obj.value==null){
		return;
	}
	if(isNaN(obj.value)){
		obj.value="";
		obj.placeholder="兑换积分必须为数字";
		obj.focus();
		return;
	}
	if(credit<parseInt(obj.value)){
		obj.value="";
		obj.placeholder="兑换积分不能多于已有积分";
		obj.focus();
	}
}

function submit(){
	var exchange=document.getElementById("exchange").value;
	if(exchange==""||exchange==null){
		$('#exchange').focus();
	}else{
		$.ajax({
			type:"POST",
			url:"/imovie/json/ajaxCreditExchangeAction.do",
			data:{credit:exchange},
			dataType:"json",
			success:function(data){
				if(data.loginFlag){
					var balance=document.getElementById("balance");
					var credit=document.getElementById("credit");
					balance.innerHTML=data.balance;
					credit.innerHTML=data.credit;
					document.getElementById("exchange").value="";
				}else{
					alert("兑换失败，请重试");
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
}