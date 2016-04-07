<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>注册</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="CSS/StyleBase.css" />
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css" />
<script src="JS/jquery-1.11.3.js"></script>
<script src="JS/jquery.livequery.js"></script>
<script src="JS/knockout-3.4.0.debug.js"></script>
<script src="JS/knockout.multimodels-0.1.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/register.js"></script>
</head>
<body data-model="RegisterModel">
	<div class="container">
		<div class="row">
			<h3 class="text-center" style="margin-bottom: 30px">注册用户</h3>
		</div>
		<form class="form-horizontal">
			<div class="form-group" data-bind="showVisible : isDupName ">
				<div class="col-sm-10 col-sm-offset-4 ">
					<p class="form-control-static warning">该用户名已被使用</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control " placeholder="用户名"
						data-bind='value : userName, valueUpdate: "afterkeydown"'>
				</div>
			</div>
			<div class="form-group" data-bind="showVisible : isIncorrectMail ">
				<div class="col-sm-10 col-sm-offset-4 ">
					<p class="form-control-static warning">请输入正确的Email格式</p>
				</div>
			</div>
			<div class="form-group" data-bind="showVisible : isDupMail ">
				<div class="col-sm-10 col-sm-offset-4 ">
					<p class="form-control-static warning">该Email已被注册</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">Email</label>
				<div class="col-sm-4">
					<input type="email" class="form-control " id="inputEmail3" placeholder="Email"
						data-bind='value : userMail, valueUpdate: "afterkeydown"'>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-offset-2 col-sm-2 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword3" placeholder="密码"
						data-bind='value : password, valueUpdate: "afterkeydown"'>
				</div>
			</div>
			<div class="form-group" data-bind="showVisible : isIncorrectPassword ">
				<div class="col-sm-10 col-sm-offset-4 ">
					<p class="form-control-static warning">两次密码不一致</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-offset-2 col-sm-2 control-label">再次输入密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword3" placeholder="再次输入密码"
						data-bind='value : passwordT, valueUpdate: "afterkeydown"'>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-2">
					<button type="submit" class="btn btn-primary btn-block"
						data-bind='click : register , disable : isRegisting'>注册用户</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
