$(document).ready(function() {
    $.ajax({
        url : 'getUser.action',
        success : function(data) {
            if (!isNullOrEmpty(data)) {
                indexModel.userName(data.userName);
                indexModel.isLogin(true);
                if (data.power == 1) {
                    navigate("admin.action");
                } else {
                    navigate("menu.action");
                };
            } else {
                if (top != self) {
                    var urls = parent.location.href.split('/');
                    var actuallUrl = urls[urls.length - 1];
                    if (actuallUrl == "login.action") {
                        navigate(actuallUrl);
                    };
                } else {
                    navigate("register.action");
                };
            };
        }
    });
});


function navigate(url) {
    if (top == self) {
        window.location.href = url;
    } else {
        var urls = parent.location.href.split('/');
        var actuallUrl = urls[urls.length - 1];
        if (actuallUrl != url) {
            parent.location.href = url;
        };
    };
}

var indexModel = {
    userName : ko.observable(''),
    password : ko.observable(''),
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
                if (top == self) {
                    location.reload();
                } else {
                    parent.location = "/OrderSystem";
                };
            } else {
                alert("该用户不存在");
            };
        }
    });
};

indexModel.loginPage = function() {
    if (top == self) {
        location.href = "login.action";
    } else {
        parent.location.href = "login.action";
    };
};

indexModel.logout = function() {
    $.ajax({
        url : 'logOut.action',
        async : true,
        success : function() {
            if (top == self) {
                location.reload();
            } else {
                parent.location = "/OrderSystem";
            };
        }
    });
};

ko.attach("IndexModel", indexModel);
