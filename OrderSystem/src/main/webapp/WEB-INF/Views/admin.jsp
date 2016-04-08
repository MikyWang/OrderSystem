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
		<div class="row">
			<div class="col-sm-2 hidden-xs" role="navigation">
				<ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="125">
					<li class="active"><a href="#menuUploader">上传菜单</a></li>
					<li><a href="#section-2">客户订单</a></li>
					<li><a href="#section-3">第三部分</a></li>
					<li><a href="#section-4">第四部分</a></li>
					<li><a href="#section-5">第五部分</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">上传一个新菜品</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" id="menuUploader">
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
									<img alt="food" data-bind="attr : {src : foodPicture}">
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
	</div>
</body>
</html>