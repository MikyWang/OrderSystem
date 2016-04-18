
var adminModel = {
    foodName: ko.observable(''),
    foodPrice: ko.observable(''),
    ordersList: ko.observableArray([]),
    foodPicture: ko.observable('IMG/untitled.png'),
};

$(document).ready(function () {
    $('ul.nav > li').click(function (e) {
        $('ul.nav > li').removeClass('active');
        $(this).addClass('active');
    });

    $('.file').bind('change', function () {
        var file = $('.file')[0].files[0];
        if (!/image\/\w+/.test(file.type)) {
            alert("不是图片");
            return false;
        };
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            adminModel.foodPicture(this.result);
        };
    });
    getOrders();
});

function getOrders() {
    adminModel.ordersList.removeAll();
    $.ajax({
        url: 'getAllOrders.action',
        type: 'POST',
        success: function (data) {
            var orders = ko.observableArray([]);
            for (var i = 0; i < data.length; i++) {
                if (i > 0) {
                    if (data[i].orderId != data[i - 1].orderId) {
                        adminModel.ordersList.push({
                            orderId: ko.observable(orders()[0].orderId()),
                            spendMinutes: ko.observable(orders()[0].spendMinutes()),
                            orders: orders,
                            customerName: ko.observable(orders()[0].customerName())
                        });
                        orders = ko.observableArray([]);
                    }
                }
                orders.push({
                    orderId: ko.observable(data[i].orderId),
                    linePicture: ko.observable(data[i].linePicture),
                    status: ko.observable(data[i].status),
                    lineName: ko.observable(data[i].lineName),
                    linePrice: ko.observable(data[i].linePrice),
                    spendMinutes: ko.observable(data[i].spendMinutes),
                    customerName: ko.observable(data[i].customerName),
                    lineId: data[i].lineId,
                    isCompleted: ko.computed(function () {
                        var complete = false;
                        if (isNullOrEmpty(this.status)) {
                            if (data[i].status != "正在制作") {
                                complete = true;
                            };
                        } else {
                            if (this.status() != "正在制作") {
                                complete = true;
                            };
                        };
                        return complete;
                    }, this),
                    completeButton: ko.computed(function () {
                        var name = "完成订单";
                        if (isNullOrEmpty(this.status)) {
                            if (data[i].status == "已完成") {
                                name = "订单已完成";
                            };
                            if (data[i].status == "取消") {
                                name = "订单已取消";
                            };
                        } else {
                            if (this.status() == "已完成") {
                                name = "订单已完成";
                            };
                            if (this.status() == "取消") {
                                name = "订单已取消";
                            };
                        };
                        return name;
                    }, this),
                    completeOrder: function (param) {
                        $.ajax({
                            url: 'completeOrder.action?lineId=' + this.lineId,
                            type: 'POST',
                            success: function (params) {
                                if (params) {
                                    location.reload();
                                }
                            }
                        });
                    }
                });
                if (i == data.length - 1) {
                    adminModel.ordersList.push({
                        orderId: ko.observable(orders()[0].orderId()),
                        spendMinutes: ko.observable(orders()[0].spendMinutes()),
                        orders: orders,
                        customerName: ko.observable(orders()[0].customerName())
                    });
                }
            }
        }
    });
    setTimeout(getOrders, 60000);
}

adminModel.uploadFood = function () {
    $('.file').click();
};

adminModel.upload = function () {
    var foodPicturePrefix = adminModel.foodPicture().toString().split('base64,')[0] + 'base64,';
    var foodPicture = adminModel.foodPicture().toString().split('base64,')[1];
    var food = {
        foodName: adminModel.foodName(),
        foodPrice: adminModel.foodPrice(),
        foodPicture: foodPicture,
        foodPicturePrefix: foodPicturePrefix
    };
    $.ajax({
        type: "POST",
        url: "uploadFood.action",
        async: true,
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(food),
        success: function (data) {
            if (data) {
                alert("成功");
            }
        }
    });
};

ko.attach("adminModel", adminModel);
