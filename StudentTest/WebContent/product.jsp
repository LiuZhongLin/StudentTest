<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>闲鱼市场-学生校园网</title>
<style type="text/css">

.btn_product {
	margin-left: 15px;
}

.headermenu {
	width: 100%;
	height: 50px;
	text-align: center;
	line-height: 50px;
	margin-bottom: 20px;
}

footer {
	width: 100%;
	padding: 3rem 0 5rem;
	background-color: #222222;
	margin-top: 30px;
}

footer p {
	text-align: center;
	color: #fff;
}

.price {
	color: #FD6C46;
}
</style>

<!-- 引入bootstrap.css文件 -->
<link href="css/lib/bootstrap.css" rel="stylesheet">
<!--[if lt IE 8]>
    <script src="js/lib/html5.js"></script>
    <script src="js/lib/respond.js"></script>
    <![endif]-->
</head>
<body>

 <!-- 导入顶部导航栏 -->
 	<%@ include file="header.jsp" %>
	<div class="headermenu">
		<a href="#" class="btn_product btn btn-danger" data-backdrop="static"
			data-toggle="modal" data-target="#productPopUp">发布我的闲置用品</a>
	</div>

	<!--商品展示-->
	<div class="container">
		<div class="row">
			<%
				List list3 = bbs.findAllProduct();
				List list4 = bbs.findAllUser();
				ProductPO ui3 = new ProductPO();
				for (int i = list3.size() - 1; i >= 0; i--) {
					ui3 = (ProductPO) list3.get(i);
					int productid = ui3.getProductid();
					String productTitle = ui3.getProductTitle();
					String productContent = ui3.getProductContent();
					String price = ui3.getPrice();
					String photoPath = "save/" + ui3.getPhotoPath();
					String publishTime = ui3.getPulishTime();
					publishTime = publishTime.substring(0, 19);
					int uid = ui3.getUid();

					UserPO ui2 = new UserPO();
					for (int j = list4.size() - 1; j >= 0; j--) {
						ui2 = (UserPO) list4.get(j);
						int id = ui2.getId();
						String username = ui2.getUsername();
						if (id == uid) {
			%>
			<div class="col-xs-6 col-md-3">
				<a href="m_product.jsp?send_productid=<%=productid %>" class="thumbnail"> <img alt="图片"
					src="<%=photoPath%>"
					style="height: 180px; width: 100%; display: block;">
				</a>
				<div class="caption">
					<h4 class="price">
						价格：￥<%=price%>元
					</h4>
					<p>
						<a href="m_product.jsp?send_productid=<%=productid %>"><%=productTitle%></a>
					</p>
					<p>
						<a href="m_product.jsp?send_productid=<%=productid %>" class="btn btn-primary">查看详情</a>
					</p>
				</div>
			</div>
			<%
				}
					}
				}
			%>

		</div>
	</div>


	<!-- 发布弹框 -->
	<div class="modal fade" id="productPopUp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel_modal2" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="myModalLabel_modal1">发布我的闲置</h3>
				</div>
				<div class="modal-body">
					<form action="productAction" method="post" enctype ="multipart/form-data" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<s:textfield name="title" class="form-control" id="title"
									label="商品名称" placeholder="输入商品名称" />
							</div>
						</div>
						<div class="form-group">
							<label for="upload" class="col-sm-2 control-label">上传图片</label>
							<div class="col-sm-10">
								<s:file name="upload" class="form-control" id="upload"
									label="相关图片" />
								<br>
							</div>
						</div>
						<div class="form-group">
							<label for="price" class="col-sm-2 control-label">价格描述</label>
							<div class="col-sm-10">
									<s:textfield name="price" class="form-control" id="price" label="转卖价格" placeholder="输入要拍卖的价格" />
								<br>
							</div>
						</div>
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">详情描述</label>
							<div class="col-sm-10">
							<s:textarea name="content" class="form-control" id="content" label="详情描述" placeholder="输入商品详情介绍"/>
								<br>
							</div>
						</div>
						<div class="form-group" style="margin-right:10px;">
                    		<input type="submit"  class=" pull-right btn btn-info" value="发布" >
                    </div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<p>朱文强  刘忠林  虞崇湖  罗齐</p>
		<p>Copyright © 2016 All Rights Reserved</p>
	</footer>
	<!--最底部信息结束-->
	<!-- 引入js文件 -->
	<script src="js/lib/jquery.js"></script>
	<script src="js/lib/bootstrap.js"></script>
</body>
</html>