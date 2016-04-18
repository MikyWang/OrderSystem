var loginModel = {
    userName : ko.observable(''),
    password : ko.observable(''),
};

loginModel.login = function() {
    var user = {
        userName : loginModel.userName(),
        userMail : loginModel.userName(),
        password : loginModel.password()
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
                    location.href = "/OrderSystem";
                } else {
                    parent.location.href = "/OrderSystem";
                };
            } else {
                alert("该用户不存在");
            };
        }
    });
};

ko.attach("loginModel", loginModel);