$(document).ready(function () {
    $("#FileImageUpload").change(function () {
        var previewimages = $("#showImage");
        previewimages.html("");

        $($(this)[0].files).each(function () {
            var file = $(this);
            var reader = new FileReader();

            reader.onload = function (e) {
                var img = $("<img />");
                img.attr("style", "height:150px; width:150px;");
                img.attr("src", e.target.result);
                previewimages.append(img);
            }
            reader.readAsDataURL(file[0]);
        });
    });
});