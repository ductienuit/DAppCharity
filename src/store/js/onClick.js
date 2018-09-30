function getCartSummary(){
	var text = document.getElementById("cartSummary").innerHTML;
	var value = text.slice(10,-3);
	var value2 = parseFloat(value);
	return value2;
}

function calculateSummary(deal){
	var value2 = getCartSummary();
	value2 =value2 + deal;
	console.log(value2);
	var element = document.getElementById("cartList").childNodes;
	var count =0;
	for (var i = element.length - 1; i >= 0; i--) {
		if(element[i].className == "product-widget")
		{
			count+=1;
		}
	}

	document.getElementById("countItems").innerHTML = count;
	document.getElementById("cartSummary").innerHTML="SUBTOTAL: "+value2.toString()+"ETH";
}

function onClick1() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product01.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.004ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>'; 
	calculateSummary(0.002);
}
function onClick2() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product02.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.005ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.003);
}
function onClick3() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product03.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.002ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.002);
}
function onClick4() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product04.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.007ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.007);
}
function onClick5() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product05.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.005ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.005);
}
function onClick6() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product06.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.002ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.002);
}
function onClick7() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product07.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.009ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.009);
}
function onClick8() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product08.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.004ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.004);
}
function onClick9() {
   document.getElementById("cartList").innerHTML += 
   '<div class="product-widget">'+
	'<div class="product-img"><img src="./img/product09.png" alt=""></div>'+
	'<div class="product-body">'+
	'<h3 class="product-name"><a href="#">product name goes here</a></h3>'+
	'<h4 class="product-price"><span class="qty">1x</span>0.006ETH</h4>'+
	'</div>'+
	'<button class="delete" ><i class="fa fa-close"></i></button>'+
	'</div>';
	calculateSummary(0.006);
}

function checkOut(){
	console.log(getCartSummary());
	$('#modalCartView').modal('show');
}
function addAllCheckOut(){
	checkOut();


	var allElementDiv = document.getElementById("cartList");
	var temp = allElementDiv.cloneNode(true);
	document.getElementById("cartView").appendChild(temp);	
}
function barcodeEnable(){
	$('#livestream_scanner').modal('show');
}