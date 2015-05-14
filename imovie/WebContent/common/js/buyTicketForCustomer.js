function chooseWay(obj){
	var way=obj.value;
	var num=document.getElementById("account");
	if(way=="0"){
		num.disabled="disabled";
		var pbalance=document.getElementById("Balance");
		pbalance.setAttribute("hidden","hidden");
		num.removeAttribute("required");
		var bt=document.getElementById("submit");
		if(bt.disabled){
			bt.removeAttribute("disabled");
		}
	}else{
		num.removeAttribute("disabled");
		num.setAttribute("required","required");
	}
}

function displayBalance(obj){
	var pbalance=document.getElementById("Balance");
	
	var num=parseInt(obj.value);
	var balance=document.getElementById("balance");
	
	var account=document.getElementById("account");
	if(account.value==null || account.value==""){
		return;
	}
	var price=document.getElementById("price");
	$.ajax({
		type: "POST",
		url: "/imovie/json/ajaxCheckBalanceAction.do",
		data: {userId:account.value,price:price.value},
		dataType: "json",
		success: function(data){
			if(data.loginFlag){
				pbalance.removeAttribute("hidden");
				if(parseFloat(data.balance)<parseFloat(data.price)){
					balance.innerHTML=data.balance+"元 余额不足";
					var bt=document.getElementById("submit");
					bt.disabled="disabled";
				}else{
					balance.innerHTML=data.balance+"元";
					var bt=document.getElementById("submit");
					bt.removeAttribute("disabled");
				}
				return true;
			}else{
				account.value="";
				pbalance.setAttribute("hidden","hidden");
				account.placeholder="账户不存在，请重试";
				account.focus();
				return false;
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
	});
}	