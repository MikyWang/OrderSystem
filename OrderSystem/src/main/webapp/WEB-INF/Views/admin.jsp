<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>管理员界面</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="CSS/StyleBase.css" />
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css" />
<script src="JS/jquery-1.11.3.js"></script>
<script src="JS/jquery.livequery.js"></script>
<script src="JS/knockout-3.4.0.debug.js"></script>
<script src="JS/knockout.multimodels-0.1.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/admin.js"></script>
</head>
<body>
	<div class="embed-responsive " style="height: 100px;">
		<iframe class="embed-responsive-item" src="/OrderSystem"></iframe>
	</div>
	<div class="container" data-model="adminModel">
		<div class="row" id="menuUploader">
			<div class="col-sm-2 hidden-xs ">
				<div class="panel panel-primary" role="navigation"   data-spy="affix">
					<div class="panel-heading">
						<h3 class="panel-title">厨师操作</h3>
					</div>
					<div class="panel-body">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="#menuUploader">上传菜单</a></li>
							<li><a href="#orders">客户订单</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">上传一个新菜品</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">菜品名称:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" placeholder="菜品名称"
										data-bind='value : foodName, valueUpdate: "afterkeydown"'>
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">菜品单价:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" placeholder="菜品单价"
										data-bind='value : foodPrice, valueUpdate: "afterkeydown"'>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">菜品照片:</label>
								<div class="col-sm-4">
									<button type="button" class="btn btn-primary" data-bind="click : uploadFood ">上传菜品照片</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-4">
									<img alt="food" class="image" data-bind="attr : {src : foodPicture}">
									<input style="display: none" type="file" class="file" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-4">
									<button type="button" class="btn btn-primary" data-bind="click : upload">确定</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row" data-bind='foreach : ordersList' id="orders">
			<div class="panel panel-success col-sm-offset-2">
				<div class="panel-heading">
					<h3 class="panel-title">
						订单编号:&nbsp;<span class="text-info" data-bind="html :orderId"></span><span class="pull-right">已等待：<span
							data-bind="html : spendMinutes"></span>分钟
						</span>
					</h3>
				</div>
				<div class="panel-body">
					<div data-bind="foreach : orders">
						<div class=" media col-md-12 well" style="margin: 5px 5px !important;">
							<div class="media-left media-middle">
								<a href="javascript:void(0);"> <img style="width: 100px; height: 100px;"
									class="media-object" alt="..." data-bind="attr : {src : linePicture}">
								</a>
							</div>
							<div class="media-body">
								<div class="pull-right">
									<span class="text-warning" data-bind="html : status"></span>
								</div>
								<h4 class="media-heading text-info" data-bind="html : lineName"></h4>
								<p>
									<span class="text-danger">￥</span> <span class="text-danger" data-bind="html : linePrice"></span>
								</p>
								<p style="margin-top: 25px;">
									<a href="#" class="text-primary" data-bind="html : customerName"></a>
								</p>
								<div class="pull-right">
									<button class="btn btn-primary" data-bind="click : completeOrder">完成菜品</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>