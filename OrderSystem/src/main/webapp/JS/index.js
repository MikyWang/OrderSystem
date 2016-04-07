$(document).ready(function() {
    $.ajax({
        url : 'getUser.action',
        success : function(data) {
            if (!isNullOrEmpty(data)) {
                indexModel.userName(data.userName);
                indexModel.isLogin(true);
            };
        }
    });
});

var indexModel = {
    userName : ko.observable(''),
    password : ko.observable(''),
    contentUrl : ko.observable(''),
    userUrl : ko.observable('#'),
    isLogin : ko.observable(false),
};

ko.attach("IndexModel", indexModel);
