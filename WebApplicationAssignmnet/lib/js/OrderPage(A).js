function comfirmMsg() {
    var x = confirm("Are you sure you want to cancel the order ?");
    var p = event.target.parentNode;
    var index = p.parentNode;
    if (x == true)
        index.parentNode.removeChild(index);
}