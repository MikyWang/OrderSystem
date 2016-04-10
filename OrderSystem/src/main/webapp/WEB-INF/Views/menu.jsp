<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>菜单</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="CSS/StyleBase.css" />
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css" />
<script src="JS/jquery-1.11.3.js"></script>
<script src="JS/jquery.livequery.js"></script>
<script src="JS/knockout-3.4.0.debug.js"></script>
<script src="JS/knockout.multimodels-0.1.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/menu.js"></script>
</head>
<body>
	<div class="embed-responsive" style="height: 80px;">
		<iframe class="embed-responsive-item" src="/OrderSystem"></iframe>
	</div>
	<div class="container" data-model="menuModel">
		<div class="row">
			<nav>
				<ul class="nav nav-tabs">
					<li role="presentation" data-bind="css :{ active : isShopping}"><a href="#foods"
						data-bind="click :shop">商品</a></li>
					<li role="presentation" data-bind=" css :{ active : isPicking}"><a href="#"
						data-bind="click :pick">购物车</a></li>
					<li role="presentation" data-bind="css :{ active : isWaiting}"><a href="#"
						data-bind="click :order">我的订单</a></li>
				</ul>
			</nav>
		</div>
		<div class="row" data-bind="showVisible : isPicking" style="margin-top: 10px;">
			<div class="panel panel-success">
				<div class="panel-body">
					<p data-bind="showVisible : isCartEmpty">购物车当前是空的哦~</p>
					<div data-bind="foreach : cartLines">
						<div class=" media col-md-12 well" style="margin: 5px 5px !important;">
							<div class="media-left media-middle">
								<a href="javascript:void(0);"> <img style="width: 100px; height: 100px;"
									class="media-object" alt="..." data-bind="attr : {src : linePicture}">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading text-info" data-bind="html : lineName"></h4>
								<p>
									<span class="text-danger">￥</span> <span class="text-danger" data-bind="html : linePrice"></span>
									<a href="javascript:void(0);" style="position: absolute; right: 5px; bottom: 5px;"
										class="btn btn-primary " role="button" data-bind=" click : remove">删除</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<span>当前总价为</span>:&nbsp;￥<span class="text-primary" data-bind="html : totalPrice"></span>
					<button class=" btn btn-primary" style="position: relative; float: right; bottom: 6px;"
						data-bind="showVisible : !isCartEmpty(), click : takeOrder" data-toggle="modal"
						data-target="#myModal">立即点餐</button>
				</div>
			</div>
		</div>
		<div id="foods" class="row" data-bind="showVisible : isShopping">
			<div class="hidden-xs hidden-sm" style="right: 50px; top: 120px;" data-spy="affix"
				role="navigation">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">购物车</h3>
					</div>
					<div class="panel-body">
						<p data-bind="showVisible : isCartEmpty">购物车当前是空的哦~</p>
						<ul class="nav nav-pills nav-stacked" data-bind="foreach : cartLines">
							<li><span data-bind="html : lineName"></span>:&nbsp;￥<span data-bind="html : linePrice"></span><span
								class="text-danger " role="button" data-bind=" click : remove">&nbsp;删除</span></li>
						</ul>
					</div>
					<div class="panel-footer">
						<span>当前总价为</span>:&nbsp;￥<span class="text-primary" data-bind="html : totalPrice"></span>
					</div>
					<button class="btn btn-primary btn-block" style="position: relative; top: 5px;"
						data-bind="showVisible : !isCartEmpty(), click : takeOrder" data-toggle="modal"
						data-target="#myModal">立即点餐</button>
				</div>
			</div>
			<div data-bind="foreach : foods">
				<div class="well media col-md-3" style="margin: 5px 5px !important;">
					<div class="media-left media-middle">
						<a href="javascript:void(0);"> <img style="width: 100px; height: 100px;"
							class="media-object" alt="..." data-bind="attr : {src : foodPicture}">
						</a>
					</div>
					<div class="media-body">
						<h4 class="media-heading text-info" data-bind="html : foodName"></h4>
						<p>
							<span class="text-danger">￥</span> <span class="text-danger" data-bind="html : foodPrice"></span>
							<a href="javascript:void(0);" style="position: absolute; right: 5px; bottom: 5px;"
								class="btn btn-primary " role="button" data-toggle="modal" data-target="#myModal"
								data-bind="click : add">加入购物车</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div data-bind='showVisible : isWaiting' style="margin-top: 10px;">
			<div class="row" data-bind='foreach : ordersList'>
				<div class="panel panel-success">
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
										菜品状态 :<span class="text-warning" data-bind="html : status"></span>
									</div>
									<h4 class="media-heading text-info" data-bind="html : lineName"></h4>
									<p>
										<span class="text-danger">￥</span> <span class="text-danger" data-bind="html : linePrice"></span>
									</p>
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