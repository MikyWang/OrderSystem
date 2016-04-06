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
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="text-center" style="margin-bottom: 30px">注册用户</h3>
		</div>
		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control " placeholder="用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">Email</label>
				<div class="col-sm-4">
					<input type="email" class="form-control " id="inputEmail3" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-offset-2 col-sm-2 control-label">Password</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-2">
					<button type="submit" class="btn btn-primary btn-block" >注册用户</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
