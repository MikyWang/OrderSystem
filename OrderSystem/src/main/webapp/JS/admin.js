var adminModel = {
    foodName : ko.observable(''),
    foodPrice : ko.observable(''),
    foodPicture : ko.observable('IMG/untitled.png'),
};

$(document).ready(function() {
    $('.file').bind('change', function() {
        var file = $('.file')[0].files[0];
        if (!/image\/\w+/.test(file.type)) {
            alert("不是图片");
            return false;
        };
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function() {
            adminModel.foodPicture(this.result);
        };
    });
});

adminModel.uploadFood = function() {
    $('.file').click();
};

ko.attach("adminModel", adminModel);
