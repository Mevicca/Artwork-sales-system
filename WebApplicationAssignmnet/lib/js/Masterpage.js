var isFixedNav;

$(function () {
    isFixedNav = localStorage.getItem("isFixedNavKey");
    if (isFixedNav === null) {
        isFixedNav = true;
    }
    checkNav();
});

function nav_openning() {
    document.getElementById("mySidebar").style.width = "180px";
    document.getElementById("nav-bar").style.marginLeft = "180px";
    document.getElementById("content").style.marginLeft = "180px";
    document.getElementById("footer").style.marginLeft = "180px";
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("btnNavOpen").style.display = 'none';
}

function nav_open() {
    isFixedNav = false;
    nav_openning();
}
function nav_close() {
    isFixedNav = false;
    document.getElementById("nav-bar").style.marginLeft = "0%";
    document.getElementById("footer").style.marginLeft = "0%";
    document.getElementById("content").style.marginLeft = "0%";
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
        document.getElementById("pinIcon").className = "fa fa-ban";
        document.getElementById("btnPin").title = "Unpin it";
        document.getElementById("menuLabel").style.paddingLeft = "50px";
    }
    else { /*The nav bar not going to fixed*/
        document.getElementById("btnClose").style.display = "block";
        document.getElementById("pinIcon").className = "fa fa-map-pin";
        document.getElementById("btnPin").title = "Pin it";//padding-left
        document.getElementById("menuLabel").style.paddingLeft = "20px";

    }
}