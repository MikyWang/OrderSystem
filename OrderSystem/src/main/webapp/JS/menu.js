$(document).ready(
    function () {
        $.ajax({
            url: 'getFoods.action',
            async: true,
            success: function (data) {
                data.forEach(function (food) {
                    menuModel.foods.push({
                        foodName: ko.observable(food.foodName),
                        foodPrice: ko.observable(food.foodPrice),
                        foodPicture: ko.observable(food.foodPicturePrefix
                            + food.foodPicture),
                        add: function () {
                            menuModel.cartLines.push({
                                lineName: this.foodName(),
                                linePrice: this.foodPrice(),
                                linePicture: this.foodPicture(),
                                remove: function () {
                                    menuModel.cartLines.remove(this);
                                },
                            });
                            initModal("加入购物车", "添加<span class='text-info'>"
                                + this.foodName() + "</span>成功");
                        },
                    });
                });
            }
        });
    });

var menuModel = {
    foods: ko.observableArray([]),
    cartLines: ko.observableArray([]),
    ordersList: ko.observableArray([]),
    isShopping: ko.observable(true),
    isPicking: ko.observable(false),
    isWaiting: ko.observable(false),
    customerName: ko.observable('')
};

menuModel.shop = function () {
    menuModel.isShopping(true);
    menuModel.isPicking(false);
    menuModel.isWaiting(false);
};

menuModel.totalPrice = ko.computed(function () {
    var totalAmout = 0;
    menuModel.cartLines().forEach(function (line) {
        totalAmout += line.linePrice;
    });
    return totalAmout;
}, this);

menuModel.pick = function () {
    menuModel.isShopping(false);
    menuModel.isPicking(true);
    menuModel.isWaiting(false);
};

menuModel.order = function () {
    menuModel.ordersList.removeAll();
    $.ajax({
        url: "getUserOrders.action?customerOrOrderName=" + '桌号' + menuModel.customerName(),
        type: 'POST',
        success: function (data) {
            var orders = [];
            for (var i = 0; i < data.length; i++) {
                if (i > 0) {
                    if (data[i].orderId != data[i - 1].orderId) {
                        menuModel.ordersList.push({
                            orderId: ko.observable(orders[0].orderId),
                            spendMinutes: ko
                                .observable(orders[0].spendMinutes),
                            orders: ko.observableArray(orders)
                        });
                        orders = [];
                    }
                }
                orders.push(data[i]);
                if (i == data.length - 1) {
                    menuModel.ordersList.push({
                        orderId: ko.observable(orders[0].orderId),
                        spendMinutes: ko.observable(orders[0].spendMinutes),
                        orders: orders
                    });
                }
            }
        }
    });
    menuModel.isShopping(false);
    menuModel.isPicking(false);
    menuModel.isWaiting(true);
};

menuModel.canTakeOrder = ko.computed(function () {
    return isNullOrEmpty(menuModel.customerName())
}, this)

menuModel.isCartEmpty = ko.computed(function () {
    return menuModel.cartLines().length == 0;
}, this);

menuModel.takeOrder = function () {
    initModal("客户下单", "下单成功");
    var orders = [];
    menuModel.cartLines().forEach(
        function (line) {
            var foodPicturePrefix = line.linePicture.split('base64,')[0]
                + 'base64,';
            var foodPicture = line.linePicture.split('base64,')[1];
            orders.push({
                lineName: line.lineName,
                linePrice: line.linePrice,
                customerName: "桌号" + menuModel.customerName(),
                linePicturePrefix: foodPicturePrefix,
                linePicture: foodPicture,
            });
        });
    $.ajax({
        type: 'POST',
        url: "insertOrder.action",
        async: true,
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(orders),
        success: function (data) {
            menuModel.cartLines.removeAll();
        }
    });
};

ko.attach("menuModel", menuModel);
