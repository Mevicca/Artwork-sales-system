function deleteItems() {
    var x = confirm("Are you sure you want to remove from wishlist ?");
    var p = event.target.parentNode;
    var index = p.parentNode;
    if (x == true)
        index.parentNode.remove(index);
    return false;
}