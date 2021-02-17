var slideIndex = 1;
var wishcheck = 0;
slides(slideIndex);

function changeDisplayImg(image) {
	var displaying = document.getElementsByClassName("display");
	displaying.setAttribute("src", image);
	//document.getElementById('display').src = image
}

function plusDivs(n) {
	slides(slideIndex += n);
}

function slides(n) {
	var i;
	var x = document.getElementsByClassName("slidesImg");
	if (n > x.length) { slideIndex = 1 }
	if (n < 1) { slideIndex = x.length }
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	x[slideIndex - 1].style.display = "inline-block";
}

function wishLsit() {
	if (wishcheck == 0) {
		document.getElementById('wishL').style.color = "red";
		alert("Added To Wishlist !")
		wishcheck++;
	}
	else {
		document.getElementById('wishL').style.color = "black";
		wishcheck = 0;
	}
}



