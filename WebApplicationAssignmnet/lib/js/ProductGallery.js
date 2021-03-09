//// Get the container element
//var btnContainer = document.getElementById("myBtnContainer");

//// Get all buttons with class="btn" inside the container
//var btns = btnContainer.getElementsByClassName("btn-status");

//// Loop through the buttons and add the active class to the current/clicked button
//for (var i = 0; i < btns.length; i++) {
//    btns[i].addEventListener("click", function () {
//        var current = document.getElementsByClassName("active");
//        current[0].className = current[0].className.replace(" active", "");
//        this.className += " active";
//    });
//}

// Add active class to the current button (highlight it)
var header = document.getElementById("myBtnContainer");
var btns = header.getElementsByClassName("btn-status");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
    });
}