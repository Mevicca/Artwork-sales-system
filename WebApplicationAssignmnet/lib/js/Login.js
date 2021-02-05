$(window).on('load', function () {
    adjustContainerPadding();
});

$(window).resize(function () {
    adjustContainerPadding();
});

function adjustContainerPadding() {
    //For the content height
    var screen = window.innerHeight;
    var header = parseInt(document.querySelector('header').offsetHeight);
    var footerHeight = document.getElementById("footer").offsetHeight;
    var newHeight = (screen - header - footerHeight);
    $(".card").css("height", '280px');

    if (newHeight - 280 > 0) {
        var paddingTable = (newHeight - 280) / 2;
        $(".col-md-6").css("margin-top", paddingTable);
        $(".col-md-6").css("margin-bottom", paddingTable);
    }
    else {
        newHeight = screen - header + footerHeight;
    }

    $("#content").css("height", newHeight);

    //For the scroll control
    var footerHeight = document.getElementById("footer").offsetHeight;
    $("#nav-bar").css("margin-bottom", footerHeight);

    if (window.innerHeight < 340) {
        $("#nav-bar").css("margin-bottom", "200px");
    }
}