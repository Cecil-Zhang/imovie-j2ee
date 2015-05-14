$(function () {
  $('[data-toggle="popover"]').popover()
})

function check(){
	var account=document.getElementById("bankAccount");
	if(account.value==""||account.value==null){
		account.placeholder="请输入银行账户";
		account.focus();
		return false;
	}
	var password=document.getElementById("loginPassword");
	if(password.value==null||password.value==""){
		password.placeholder="请输入登录密码";
		password.focus();
		return false;
	}
	var amount=document.getElementById("amout");
	if(amount.value=="" || amount.value==null || isNaN(amount.value)){
		amount.value="";
		amount.placeholder="请输入数字";
		amount.focus();
		return false;
	}
	return $.ajax({
		type: "POST",
		url: "/imovie/json/ajaxRechargeCheckAction.do",
		data: {password:password.value,bank:bank.value,bankAccount:account.value},
		dataType: "json",
		success:function(data){
			if(Boolean(data.loginFlag)){
				return true;
			}else{
				$('#reset').popover('show');
				$('#reset').focus();
				return false;
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
			return false;
		}
	});
}

function hide(){
	$('#reset').popover('hide');
}