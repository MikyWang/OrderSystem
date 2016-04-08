<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>小型餐馆点菜系统</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="CSS/StyleBase.css" />
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css" />
<script src="JS/jquery-1.11.3.js"></script>
<script src="JS/jquery.livequery.js"></script>
<script src="JS/knockout-3.4.0.debug.js"></script>
<script src="JS/knockout.multimodels-0.1.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/login.js"></script>
</head>
<body>
	<div class="embed-responsive" style="height: 100px;">
		<iframe class="embed-responsive-item" src="/OrderSystem"></iframe>
	</div>
	<div class="container" data-model="loginModel">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">登录</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">用户名/邮箱</label>
						<div class="col-sm-4">
							<input type="text" class="form-control " placeholder="用户名/邮箱"
								data-bind='value : userName, valueUpdate: "afterkeydown"'>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-offset-2 col-sm-2 control-label">密码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="inputPassword3" placeholder="密码"
								data-bind='value : password, valueUpdate: "afterkeydown"'>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-2">
							<button type="button" class="btn btn-primary btn-block" data-bind='click : login '>登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>