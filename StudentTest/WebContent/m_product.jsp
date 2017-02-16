<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>帖子-学生校园网</title>
<style type="text/css">
@media only screen and (min-width:982px) and (max-width: 1500px) {
	.myleft {
		width: 50%;
		height: 500px;
		padding-top: 20px;
		float: left;
		padding-right: 50px;
	}
	.myleft img {
		height: 450px;
	}
	.myright {
		float: right;
		width: 50%;
		height: 500px;
		padding: 15px;
	}
}

@media screen and (max-width: 980px) {
	.myleft {
		width: 100%;
	}
	.myleft img {
		height: 450px;
		width: 100%;
	}
	.myright {
		width: 100%;
	}
}

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
	<%@ include file="header.jsp"%>

	<%
		String productid = request.getParameter("send_productid");
		Integer myproductid = Integer.parseInt(productid);

		List list3 = bbs.findAllProduct();
		List list4 = bbs.findAllUser();
		ProductPO ui3 = new ProductPO();
		for (int i = list3.size() - 1; i >= 0; i--) {
			ui3 = (ProductPO) list3.get(i);
			int productid1 = ui3.getProductid();
			String productTitle = ui3.getProductTitle();
			String productContent = ui3.getProductContent();
			String price = ui3.getPrice();
			String photoPath = "save/" + ui3.getPhotoPath();
			String publishTime = ui3.getPulishTime();
			publishTime = publishTime.substring(0, 16);
			int uid = ui3.getUid();
			UserPO ui2 = new UserPO();
			for (int j = list4.size() - 1; j >= 0; j--) {
				ui2 = (UserPO) list4.get(j);
				int id = ui2.getId();
				String username = ui2.getUsername();
				if (id == uid) {

					if (productid1 == myproductid) {
	%>
	<div class="container">
		<div class="myleft">
			<img src="<%=photoPath%>">
		</div>
		<div class="myright">
			<h2 style="text-align: center; margin-bottom: 30px;"><%=productTitle%></h2>
			<h3>
				价格：￥<%=price%></h3>
			<h3>
				发布者：<%=username%></h3>
			<h3>
				发布时间：<%=publishTime%></h3>
			<h3>
				商品描述：<%=productContent%></h3>
			<a href="#" class="btn_post btn btn-danger">立即购买</a>
		</div>
	</div>

	<%
		}
				}
			}
		}
	%>


	<!-- 引入js文件 -->
	<script src="js/lib/jquery.js"></script>
	<script src="js/lib/bootstrap.js"></script>
</body>
</html>