<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>帖子-学生校园网</title>
    <style type="text/css">
        .myleft{
            margin-bottom: 10px;
            padding-left: 10px;
            padding-right: 10px;
        }
        .myright{
            margin-bottom: 30px;
        }
        footer{
            width:100%;
            padding:3rem 0 5rem;
            background-color: #222222;
            margin-top: 80px;
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
    <div class="container"style="margin-top:20px;">
        <ol class=" breadcrumb">
            <li><a href="post.jsp">论坛社区首页</a></li>
          
        		<%
		
		String postid=request.getParameter("send_postid");
		Integer mypostid = Integer.parseInt(postid);
		
			List list1 = bbs.findAllPost();
			List list2 = bbs.findAllReply();
			List list3 = bbs.findAllUser();
			List list4 = bbs.findAllUser();
		    PostPO ui1 = new PostPO();
			for (int i=list1.size()-1;i>=0;i--){
	      	ui1 = (PostPO) list1.get(i);
			String title = ui1.getTitle();
			String content = ui1.getContent();
			String publishTime = ui1.getPublishTime();
			int uid = ui1.getUid();
	        publishTime = publishTime.substring(0, 19);
	        
				UserPO ui3 = new UserPO();
				for(int z=list3.size()-1;z>=0;z--){
				ui3 = (UserPO) list3.get(z);
				int id = ui3.getId();
				String username = ui3.getUsername();
			if(id==uid){
	        
	        if(ui1.getPostid()==mypostid){
	        %>
	          <li class="active"><%=title %></li>
        </ol>
        <div class=" myleft table-bordered">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h2 style="text-align: center"><strong><%=title %></strong></h2>
                    <small style="display:block;text-align: center">楼主：萧展华 发帖时间：<%=publishTime %></small>
                    <hr>
                    <h4 style="line-height: 30px">
                    <%=content %>
                    </h4>
                </div>
            </div>
        </div>
        <div class=" myright table-bordered">
            <h3 style="margin-left: 10px"><strong>最新评论</strong></h3>
                   <%
	        List list5 = bbs.queryReply(mypostid );
			if(list5.size()==0){%>
	        		<div  style="padding-left:10px;">
	        			<p>还没有评论，快去抢沙发！</p>
	        		</div>
	        		<%
	        	}
	         %>
         
              <%
	        ReplyPO ui2 = new ReplyPO();
	    	for (int j=list2.size()-1;j>=0;j--){
	      	ui2 = (ReplyPO) list2.get(j);
	      	int replyid = ui2.getReplyid();
	      	String content1 = ui2.getContent();
	      	int uid1 = ui2.getUid();
	      	int pid = ui2.getPid();
	      	String publishTime1 = ui2.getPublishTime();
	        publishTime1 = publishTime1.substring(0, 19);
	        
	        UserPO ui4 = new UserPO();
				for(int e=list3.size()-1;e>=0;e--){
				ui4 = (UserPO) list3.get(e);
				int id1 = ui4.getId();
				String username1 = ui4.getUsername();
			if(id1==uid1){
	        
	             if(ui2.getPid()==ui1.getPostid()){
	      %>
	         <div class="list-group myitem">
                <a href="#" class="list-group-item ">
                    <h4 class="list-group-item-heading"><%=username1%><small style="margin-left: 10px;"><%=publishTime %></small></h4>
                    <p class="list-group-item-text"><%=content1 %></p>
                </a>
            </div>
            <%  
	        }}}}}}}
			}	 
 		%>
            <a href="#" class="btn_post btn btn-danger" data-backdrop="static" data-toggle="modal" data-target="#postPopUp" style="margin-left: 10px;margin-bottom: 30px">我要回帖</a>
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
                    <form action="replyAction" method="post" class="form-horizontal" role="form">
               		    <div class="form-group">
                            <div class="col-sm-10">
                            <input type="hidden" name="pid" value="<%=postid%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">帖子内容</label>
                            <div class="col-sm-10">
                            <s:textarea name="content" class="form-control" id="content" placeholder="请输入内容..." cols="79" rows="10"/>
                            </div>
                        </div>
                        <div class="form-group" style="margin-right:10px;">
                    		<input type="submit" class=" pull-right btn btn-info "  value="回复" >
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