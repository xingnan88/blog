<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.com.jobedu.blog.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>老刘的博客</title>
<link rel="stylesheet" type="text/css" href="/blog/style.css" />
</head>
<body>
<div id="container">	
	<div id="banner">
		<h1><a href="/blog">老刘的博客</a></h1>
	</div>

<div id="center">
<div class="content">

<% Blog blog=(Blog)request.getAttribute("blog"); 
   List list=(List)request.getAttribute("commentList");	  
%>
<table id="tab">
  <tr>
    <td><h2><%=blog.getTitle()%></h2></td>
  </tr>
  <tr>
    <td><%=blog.getContent()%></td>
  </tr>
 
  <tr>
    <td><%=blog.getCreatedTime()%></td>
  </tr>
 
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="79">
    
  <% 
  if(list!=null){
  for(int i=0;i<list.size();i++){ 
	  Comment comment=(Comment)list.get(i);
	  %>  
    <table id="tab">
      <tr>
        <td><%=comment.getUsername()%>的评论</td>
        </tr>
      <tr>
        <td><%=comment.getContent()%></td>
        </tr>
      <tr>
        <td><%=comment.getCreatedTime()%></td>
        </tr>
    </table>
    <br><br>
      <%}
  }
  %>
   <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td><form id="form1" action="/blog/servlet/CommentServlet" method="post" >
    <input type="hidden" name="method" value="add"/>
    <input type="hidden" name="blog_id" value="<%=blog.getId()%>"/>
      <table id="tab">
        <tr>
          <td >评论人：</td>
          <td><label>
            <input name="name" type="text" id="name" size="20" />
          </label></td>
        </tr>
        <tr>
          <td>内容：</td>
          <td><label>
            <textarea name="content" cols="40" rows="10" id="content"></textarea>
          </label></td>
        </tr>
        <tr>
          <td><label>
            <input type="submit" name="button" id="button" value="提交" />
          </label></td>
          <td>&nbsp;</td>
        </tr>      
      </table>
        </form>
    </td>
  </tr>
</table>


<br clear="all" />
</div><!-- end content -->
</div><!-- end center -->


<div id="right">
<div class="sidebar">
        <ul>
    	<li>刘伟自己的博客，欢迎大家访问！</li>
      </ul>
 
   <h2>分类</h2>
   <ul>		
	<li><a href="/blog">全部</a></li>	
	<% List categorys=(List)request.getAttribute("categorys"); 
	   for(int i=0;i<categorys.size();i++){	
		Category category=(Category)categorys.get(i);
	%>
	    <li><a href="<%=request.getContextPath()%>/servlet/HomeServlet?cid=<%=category.getId()%>"><%=category.getName()%></a></li>        
     <%} %>  
   </ul>

  		    <h2>最近的主题</h2>
		<ul>	
			<%List recentBlogs=(List)request.getAttribute("blogs");
			  for(int i=0;i<recentBlogs.size();i++){
				Blog blog2=(Blog)recentBlogs.get(i);
				%>
	    		<li><a href="<%=request.getContextPath()%>/servlet/HomeServlet?method=get&id=<%=blog2.getId()%>" target="_blank"><%=blog2.getTitle()%></a></li>
            <%}%>
      </ul>
  	
	   
	   <h2>最近的评论</h2>
	  <ul>		
	  <% List comments=(List)request.getAttribute("comments");
	  	 for(int i=0;i<comments.size();i++){
	  		 Comment c=(Comment)comments.get(i);
	  		 
	  %>
	  	    <li><a href="<%=request.getContextPath()%>/servlet/HomeServlet?method=get&id=<%=c.getBlogId()%>" target="_blank"><%=c.getContent()%></a></li>
        <%} %>        
      </ul>
   	
  	   	
</div><!-- end sidebar -->	
</div><!-- end right -->
</div><!-- end container -->
</body>
</html>
  
