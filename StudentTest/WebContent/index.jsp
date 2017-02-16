<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生校园网</title>
    <style type="text/css">
        footer{
            width:100%;
            padding:3rem 0 5rem;
            background-color: #222222;
        }
        footer p{
            text-align: center;
            color: #fff;
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

<!--轮播图-->
<div id="carousel-example-generic" class=" carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active center-block">
            <img src="images/02.jpg" alt="图片"   style="width: 100%;height: 470px">
            <div class="carousel-caption">
                <h3>【毕业季】</h3>
                <p>你总说毕业遥遥无期,才发现时间从不停留</p>
            </div>
        </div>
        <div class="item">
            <img src="images/01.jpg" alt="图片" style="width: 100%;height: 470px">
        <div class="carousel-caption">
            <h3>【毕业季】</h3>
            <p>你总说毕业遥遥无期,才发现时间从不停留</p>
        </div>
         </div>
        <div class="item">
            <img src="images/03.jpg" alt="图片"  style="width: 100%;height: 470px">
            <div class="carousel-caption">
                <h3>【毕业季】</h3>
                <p>你总说毕业遥遥无期,才发现时间从不停留</p>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>



<footer>
    <p> 朱文强  刘忠林  虞崇湖  罗齐</p>
    <p> Copyright © 2016 All Rights Reserved</p>
</footer> <!--最底部信息结束-->

<!-- 引入js文件 -->
<script src="js/lib/jquery.js"></script>
<script src="js/lib/bootstrap.js"></script>
</body>
</html>