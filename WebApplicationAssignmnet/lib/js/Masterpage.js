var isFixedNav;
var i = 0;
var txt = 'M E N U';
var speed = 50;

$(function () {
    "use strict";

    isFixedNav = localStorage.getItem("isFixedNavKey");
    if (isFixedNav === null) {
        isFixedNav = true;
    }

    checkNav();

});

function nav_openning() {
    document.getElementById("leftSide").style.width = "180px";
    document.getElementById("hideNavBar").style.width = "180px";
    document.getElementById("bottom-footer").style.marginLeft = "180px";
    document.getElementById("leftSide").style.display = "block";
    document.getElementById("rightSide").style.marginLeft = "180px";
    document.getElementById("btnNavOpen").style.display = 'none';
    typeWriter();
}

function typeWriter() {
    if (i < txt.length) {
        document.getElementById("menuLabel").innerHTML += txt.charAt(i);
        i++;
        setTimeout(typeWriter, speed);
    }
}

function nav_open() {
    isFixedNav = false;
    nav_openning();
}

function nav_close() {
    isFixedNav = false;
    document.getElementById("leftSide").style.display = "none";    //left nav bar
    document.getElementById("hideNavBar").style.width = "0px";
    document.getElementById("btnNavOpen").style.display = "flex";
    document.getElementById("rightSide").style.marginLeft = "0px";
    document.getElementById("bottom-footer").style.marginLeft = "0px";
}

function nav_pin() {
    isFixedNav = !isFixedNav;
    checkNav();
    localStorage.setItem("isFixedNavKey", isFixedNav);
    var userType = document.getElementById("Userrole").value;
    if (userType === "Customer") {
        $('#cust-productGallery').style.visibility = "visible";
    }
    else if(userType === "Artist"){

    }
    else {//unknown
        
    }
}

function checkNav() {
    if (isFixedNav === true || isFixedNav === "true") {
        nav_openning();
        document.getElementById("btnClose").style.display = "none";/*Close button disappear*/
        document.getElementById("pinIcon").className = "fa fa fa-ban";
        document.getElementById("btnPin").title = "Unpin it";
        document.getElementById("menuLabel").style.paddingLeft = "50px";
    }
    else { /*The nav bar not going to fixed*/
        document.getElementById("btnClose").style.display = "block";
        document.getElementById("pinIcon").className = "fa fa fa-map-pin";
        document.getElementById("btnPin").title = "Pin it";//padding-left
        document.getElementById("menuLabel").style.paddingLeft = "20px";

    }
}