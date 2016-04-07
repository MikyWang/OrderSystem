var registerModel = {
    userName : ko.observable(''),
    userMail : ko.observable(''),
    password : ko.observable(''),
    passwordT : ko.observable(''),
    isIncorrectMail : ko.observable(false),
    isIncorrectPassword : ko.observable(false),
    isDupMail : ko.observable(false),
    isDupName : ko.observable(false),
};

registerModel.isRegisting = ko.computed(function() {
    //@formatter:off
    return isNullOrEmpty(registerModel.userName()) ||
        isNullOrEmpty(registerModel.userMail()) ||
         isNullOrEmpty(registerModel.password()) ||
         isNullOrEmpty(registerModel.passwordT())||
         registerModel.isIncorrectMail()||
         registerModel.isIncorrectPassword()||
         registerModel.isDupMail();
         //@formatter:on
}, this);

registerModel.userName.subscribe(function(userName) {
    var user = {
        userName : userName
    };
    $.ajax({
        type : "POST",
        url : 'verify.action',
        async : true,
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(user),
        success : function(data) {
            if (data == false) {
                registerModel.isDupName(true);
            } else {
                registerModel.isDupName(false);
            };
        }
    });
});

registerModel.userMail.subscribe(function(mail) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(mail) && !isNullOrEmpty(mail)) {
        registerModel.isIncorrectMail(true);
    } else {
        registerModel.isIncorrectMail(false);
        var user = {
            userMail : mail
        };
        $.ajax({
            type : "POST",
            url : 'verify.action',
            async : true,
            contentType : "application/json; charset=utf-8",
            data : JSON.stringify(user),
            success : function(data) {
                if (data == false) {
                    registerModel.isDupMail(true);
                } else {
                    registerModel.isDupMail(false);
                };
            }
        });
    };
});

registerModel.passwordT.subscribe(function(password) {
    if (registerModel.password() != registerModel.passwordT()) {
        registerModel.isIncorrectPassword(true);
    } else {
        registerModel.isIncorrectPassword(false);
    };
});

registerModel.register = function() {
    var user = {
        userName : registerModel.userName(),
        password : registerModel.password(),
        userMail : registerModel.userMail()
    };
    $.ajax({
        type : "POST",
        url : "registing.action",
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(user),
        success : function() {
            parent.location.reload();
        }
    });
};

ko.attach("RegisterModel", registerModel);
