window.userName = null;

var modalModel = {
    title : ko.observable(''),
    body : ko.observable('')
};

$.ajax({
    url : 'getUser.action',
    success : function(data) {
        if (!isNullOrEmpty(data)) {
            window.userName = data.userName;
        }
    }
});

function initModal(title, body) {
    modalModel.title(title);
    modalModel.body(body);
}

ko.attach("modalModel", modalModel);
