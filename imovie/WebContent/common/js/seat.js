function clickSeat(obj){
	var row=obj.value.substr(4,1);
	var row=parseInt(row)+1;
	var seat=obj.value.substr(5,1);
	if(seat=="0"){
		seat=10;
	}
	var price=document.getElementById('price');
	var priceInt=parseInt(price.innerHTML);
	var total=document.getElementById('total');
	var totalInt=parseInt(total.innerHTML);
	var div=document.getElementById('bookedSeat');
	if(obj.checked==true){
		var newSeat=row+"排"+seat+"座";
		var newButton=document.createElement("button");
		newButton.type="button";
		newButton.className="btn btn-primary seatButton";
		newButton.innerHTML=newSeat;
		newButton.id="bt"+row+seat;
		div.appendChild(newButton);
		totalInt=totalInt+priceInt;
		total.innerHTML=totalInt;
	}else{
		var removeId="bt"+row+seat;
		var button=document.getElementById(removeId);
		div.removeChild(button);
		totalInt=totalInt-priceInt;
		total.innerHTML=totalInt;
	}
}

function check(){
	var div=document.getElementById('bookedSeat');
	if(div.childNodes.length>1){
		return true;
	}else{
		$('#checkbox01').focus();
		return false;
	}
}