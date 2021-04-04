function openOffcanvas() {
        document.getElementById("myOffcanvas").style.width = "230px";
    document.getElementById("mainContent").style.marginLeft = "230px";
}
function openNav3() {
    document.getElementById("myCanvasNav").style.width = "100%";
    document.getElementById("myCanvasNav").style.opacity = "0.8";
}
function closeOffcanvas() {
    document.getElementById("myOffcanvas").style.width = "0%";
    document.getElementById("mainContent").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
    document.getElementById("myCanvasNav").style.width = "0%";
    document.getElementById("myCanvasNav").style.opacity = "0";
}

