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

$(window).on('load', function () {
    adjustContainerPadding();
});

function throttle(method, waitTime) {
    var working = false;
    return function () {
        if (working) return;
        working = true;
        setTimeout(function () {
            method(); working = false;
        }, waitTime);
    };
}

//call when after load page and resize page
function adjustContainerPadding() {
    //For the content height
    var screen = window.innerHeight;
    var header = parseInt(document.querySelector('header').offsetHeight);
    var newHeight = (screen - header-1) + "px";
    $("#content").css("height", newHeight);
}

function nav_openning() {
    document.getElementById("mySidebar").style.width = "180px";
    document.getElementById("nav-bar").style.marginLeft = "180px";
    document.getElementById("footer").style.marginLeft = "180px";
    document.getElementById("mySidebar").style.display = "block";
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
    document.getElementById("nav-bar").style.marginLeft = "0%";
    document.getElementById("footer").style.marginLeft = "0%";
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("btnNavOpen").style.display = "inline-block";
}
function nav_pin() {
    isFixedNav = !isFixedNav;
    checkNav();
    localStorage.setItem("isFixedNavKey", isFixedNav);
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