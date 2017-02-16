<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Student_bbs_PO.*" %>
<%@ page import="Student_bbs_Dao.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入bootstrap.css文件 -->
    <link href="css/lib/bootstrap.css" rel="stylesheet">
    <style type="text/css">
   	.myname{
    		color:#fff;
    		line-height:45px;
    	}
    </style>
    <!--[if lt IE 8]>
    <script src="js/lib/html5.js"></script>
    <script src="js/lib/respond.js"></script>
    <![endif]-->
</head>

<body>
<!--导航栏-->
<div class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        　<!-- .navbar-toggle样式用于toggle收缩的内容，即nav-collapse collapse样式所在元素 -->
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
            <span class="sr-only">Toggle Navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- 确保无论是宽屏还是窄屏，navbar-brand都显示 -->
        <a href="index.html" class="navbar-brand">学生校园网</a>
    </div>
    <!-- 屏幕宽度小于768px时，div.navbar-responsive-collapse容器里的内容都会隐藏，显示icon-bar图标，当点击icon-bar图标时，再展开。屏幕大于768px时，默认显示。 -->
    <div class="collapse navbar-collapse navbar-responsive-collapse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">首页</a></li>
            <li><a href="post.jsp">论坛社区</a></li>
            <li><a href="product.jsp">闲鱼市场</a></li>
        </ul>
        		<%
					StudentBBS_Dao bbs = new StudentBBS_Dao();
					String user =(String)session.getAttribute("username");
					if(user!=null){%>
				 <p class="myname nav pull-right"><%=user %> |<a class="exit" href="#"> 退出</a></p> 
				<% } else{%>
        <ul class=" nav navbar-nav navbar-right">
            <li><a href="#" data-backdrop="static" data-toggle="modal" data-target="#loginPopUp">登录</a></li>
            <li><a href="#" data-backdrop="static" data-toggle="modal" data-target="#registerPopUp">注册</a></li>
        </ul>
        <% }%>
</div>
</div>


<!--登录弹框-->
<div class="modal fade" id="loginPopUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_modal1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="myModalLabel_modal1">欢迎登录</h3>
            </div>
            <div class="modal-body">
                <form action="loginAction" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                	    <s:fielderror name="error"/>
                        <label for="username" class="col-sm-2 control-label">帐号名称</label>
                        <div class="col-sm-10">
                        <s:textfield  class="form-control" id="username" name="username" placeholder="输入用户名" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">登录密码</label>
                        <div class="col-sm-10">
                        <s:password name="password" class="form-control" id="password" placeholder="输入密码"/>
                        </div>
                    </div>	
                      <div class="form-group" style="margin-right:10px;">
                    		<button type="button" class=" pull-right btn btn-danger" data-dismiss="modal">取消</button>
                    		<input type="submit" class=" pull-right btn btn-info "  value="登录"  style="margin-right:10px;">
                    </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--注册弹框-->
<div class="modal fade" id="registerPopUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="myModalLabel_modal">创建新用户</h3>
            </div>
            <div class="modal-body">
                <form action="registerAction" method="post" class="form-horizontal" role="form">
                   <div class="form-group">
                	    <s:fielderror name="error"/>
                        <label for="username" class="col-sm-2 control-label">帐号名称</label>
                        <div class="col-sm-10">
                        <s:textfield  class="form-control" id="username" name="username" placeholder="输入3~10个字符" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password1" class="col-sm-2 control-label">输入密码</label>
                        <div class="col-sm-10">
                        <s:password name="password1" class="form-control" id="password" placeholder="输入密码"/>
                        </div>
                    </div>	
                    <div class="form-group">
                        <label for="password2" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                        <s:password name="password2" class="form-control" id="password" placeholder="再输入一次密码"/>
                        </div>
                    </div>	
                     <div class="form-group" style="margin-right:10px;">
                    		<button type="button" class=" pull-right btn btn-danger" data-dismiss="modal">取消</button>
                    		<input type="submit" class=" pull-right btn btn-success "  value="注册"  style="margin-right:10px;">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 引入js文件 -->
<script src="js/lib/jquery.js"></script>
<script src="js/lib/bootstrap.js"></script>
</body>
</html>