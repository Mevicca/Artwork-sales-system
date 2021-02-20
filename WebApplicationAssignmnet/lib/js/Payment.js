"use strict";

function openTab(tabName, elmnt) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }

    document.getElementById(tabName).style.display = "block";
    document.getElementById('payMethod').value = tabName;
    elmnt.style.backgroundColor = "#d4a59a";
}

$(function () {
    $(window).ready(function () {
        document.getElementById("defaultOpen").click();
    });
});