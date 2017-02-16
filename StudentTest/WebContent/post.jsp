<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>论坛社区-学生校园网</title>
    <style type="text/css">
        .navbar{
            margin-bottom:10px;
        }
        .btn_post{
            margin-left:15px;
        }
        footer{
            width:100%;
            padding:3rem 0 5rem;
            background-color: #222222;
        }
        footer p{
            text-align: center;
            color: #fff;;
        }
    </style>
    <!-- 引入bootstrap.css文件 -->
    <link href="css/lib/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 8]>
    <script src="js/lib/html5.js"></script>
    <script src="js/lib/respond.js"></script>

    <![endif]-->
</head>

<!-- 导入顶部导航栏 -->
 	<%@ include file="header.jsp" %>
<div class=" alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <strong>社区公告：</strong> 请各位小伙伴文明发帖！
</div>


<!--所有帖子-->
<div>
	<a href="#" class="btn_post btn btn-info" data-backdrop="static" data-toggle="modal" data-target="#postPopUp">前往发帖</a>
    <div class="panel-body">
        <table class="table table-hover">
            <tr>
                <th>帖子主题</th>
                <th>发帖人</th>
            </tr>
            <%
			List list1 = bbs.findAllPost();
			List list2 = bbs.findAllUser();
			PostPO ui = new PostPO();
			for (int i=list1.size()-1;i>=0;i--){
			ui = (PostPO) list1.get(i);
			int postid = ui.getPostid();
			String title = ui.getTitle();
			String publishTime = ui.getPublishTime();
			publishTime = publishTime.substring(0, 19);
			int uid = ui.getUid();
				
				UserPO ui2 = new UserPO();
				for(int j=list2.size()-1;j>=0;j--){
				ui2 = (UserPO) list2.get(j);
				int id = ui2.getId();
				String username = ui2.getUsername();
			if(id==uid){
	
	        %>
	          <tr>
                <td><a href="m_post.jsp?send_postid=<%=postid %>"><%=title %></td>
                <td><%=username %></td>
            </tr>
	              <%
			}}}      
 		%>
          
        </table>
    </div>
</div>

	
	<!--发帖弹框-->
    <div class="modal fade" id="postPopUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_modal2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel_modal2">发布我的帖子</h3>
                </div>
                <div class="modal-body">
                    <form action="postAction" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">帖子主题</label>
                            <div class="col-sm-10">
                            <s:textfield name="title" class="form-control" id="title" placeholder="请输入主题..." />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">帖子内容</label>
                            <div class="col-sm-10">
                            <s:textarea name="content" class="form-control" id="content" placeholder="请输入内容..." cols="79" rows="10" size="18"/>
                            </div>
                        </div>
                        <div class="form-group" style="margin-right:10px;">
                    		<input type="submit" class=" pull-right btn btn-info "  value="发布" >
                    </div>
                    </form>
                </div>
            </div>
        </div>
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