$(document).ready(function() {
    $.ajax({
        url : 'getUser.action',
        success : function(data) {
            if (!isNullOrEmpty(data)) {
                indexModel.userName(data.userName);
                indexModel.isLogin(true);
                indexModel.contentUrl('menu.action');
            } else {
                indexModel.contentUrl('register.action');
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

indexModel.login = function() {
    var user = {
        userName : indexModel.userName(),
        userMail : indexModel.userName(),
        password : indexModel.password()
    };
    $.ajax({
        type : "POST",
        url : 'login.action',
        async : true,
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(user),
        success : function(data) {
            if (data) {
                location.reload();
            } else {
                alert("该用户不存在");
            };
        }
    });
};

ko.attach("IndexModel", indexModel);
