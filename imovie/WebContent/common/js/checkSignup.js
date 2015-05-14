$(function () {
  $('[data-toggle="popover"]').popover()
})

function checkForm(){
	var username=document.getElementById("username");
	if(username.value =="" || username.value ==null){
		username.placeholder="请输入用户名";
		username.focus();
		return false;
	}
	var age=document.getElementById("age");
	if(age.value=="" || age.value==null || isNaN(age.value)){
		age.value="";
		age.placeholder="请输入数字";
		age.focus();
		return false;
	}
	var image=document.getElementById("inputPic");
	if(image.value=="" || image.value==null){
		$("#inputPic").attr("data-content","请先上传头像");
		$("#inputPic").popover('show');
		return false;
	}
	var account=document.getElementById("bankAccount");
	if(account.value==""||account.value==null){
		account.placeholder="请输入银行账户";
		account.focus();
		return false;
	}
	var password=document.getElementById("password");
	if(password.value==null||password.value==""||password.value.length<6){
		password.placeholder="请输入长度大于5位的密码";
		password.focus();
		return false;
	}
	return true;
}

function setImagePreview() {
    var docObj=document.getElementById("inputPic");
    var img = document.getElementById("head"); 
    
    if(docObj.files && docObj.files[0]){ 
    	img.style.display = "block";
        img.src = window.URL.createObjectURL(docObj.files[0]);
    }
}