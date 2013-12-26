<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page  import="cn.com.jobedu.blog.User"%>
<%
User user=(User)session.getAttribute("user");
  if(user==null){
	  request.getRequestDispatcher("/admin/login.jsp").forward(request,response);
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link href="/blog/admin/style.css" type="text/css" rel="stylesheet"> 	
</head>
<body>
<div id="container">	
<div id="banner">
		<h1>老刘的博客</h1>
</div>
<div id="menu">
	欢迎, <% if(user!=null){
			out.print(user.getUsername());
			}%>用户
	 | <a href="/blog/servlet/PreAddBlogServlet">发博文</a>
	 | <a href="/blog/servlet/AdminBlogListServlet">博文管理</a>
	 | <a href="/blog/admin/addCategory.jsp">添加分类</a>
	 | <a href="/blog/servlet/CategoryServlet?method=list">分类管理</a>
 	 | <a href="/blog/servlet/CommentServlet">评论管理</a>
	 | <a href="/blog/admin/changePassword.jsp">修改密码</a>
	 | <a href="/blog/servlet/UserServlet?method=logout">退出</a>
</div>
<br/>
<div id="main">
