﻿<%int status=0;String sid="";try{HttpSession my=request.getSession(false);if(my!=null)
{sid=my.getId().toString();String str=my.getAttribute("urole").toString();
if(str.compareToIgnoreCase("student")==0)status=12;
else	status=36;}}
catch(Exception e)
{System.out.println(e+"session is expired ok");}
finally{%>
<%if(status==12){%>
<!DOCTYPE html>
<%@page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,javax.servlet.ServletException,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse;" %>
<html lang="en">
<head>
<title>Home - Welcome To Students</title>
<meta charset="utf-8">
<meta name="description" content="Place your description here">
<meta name="keywords" content="put, your, keyword, here">
<meta name="author" content="Templates.com - website templates provider">
<link rel="stylesheet" href="../css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_300.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<!--[if lt IE 7]>
     <link rel="stylesheet" href="css/ie/ie6.css" type="text/css" media="screen">
     <script type="text/javascript" src="js/ie_png.js"></script>
     <script type="text/javascript">
        ie_png.fix('.png, footer, header nav ul li a, .nav-bg, .list li img');
     </script>
<![endif]-->
<!--[if lt IE 9]>
  	<script type="text/javascript" src="js/html5.js"></script>
  <![endif]-->
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:295px;
	height:27px;
	z-index:1;
	left: 650px;
	top: 74px;
}
-->
</style>
<script language=JavaScript>
var i=1,n=5,j,timer;
var c=new Array(),p=0;
c[0]="maroon";
c[1]="#006caa";
c[2]="orange";
c[3]="#26b6e8";
c[4]="#8e8e8e";
var a=new Array();
a[1]="../images/banner1.jpg";
a[2]="../images/banner2.jpg";
a[3]="../images/banner3.jpg";
a[4]="../images/banner4.jpg";
a[5]="../images/banner5.jpg";
function image()
{
if (document.all) {
document.images.bnr.style.filter="blendTrans(duration=0)";
document.images.bnr.style.filter="blendTrans(duration=1)";
document.images.bnr.filters.blendTrans.Apply();
}
if(i<=n)
{
	if (document.all) 
	{
	document.images.bnr.filters.blendTrans.Play();
	}	
	document.bnr.src=a[i];	
	
	if(i==n)
	{
		i=1;
	}
	else
	{
		i++;
	}
	timer=setTimeout('image()',2500);
}
}
function text_color()
{
if(p>4)
{
p=0;
}
	document.getElementById('scroll').style.color=c[p];
	p++;
id=setTimeout("text_color()",1330);
}
function srch()
{   var s;
    s=document.getElementById('srchkey').value;
    if(s!="")
    {
    window.open("http://www.google.co.in/search?q="+s+"&cad=b&cad=h");
    }
}
function srchbyfun()
{
    srch();
}
</script>
</head>
<body id="page1" OnLoad="image();text_color();">
<div class="wrap">
   <!-- header -->
   <header>
     <div class="container">
       <h1><a href="StudBlogs.jsp">Student's site</a></h1>
       <nav>
         <ul>
           <li><a href="StudHome.jsp" class="m1">LECTURE</a></li>
           <li><a href="StudQuiz.jsp" class="m2">QUIZ</a></li>
           <li><a href="StudActivity.jsp" class="m4">ACTIVITY</a></li>
           <li><a href="StudCompetition.jsp" class="m5">COMPETITION</a></li>
           <li class="current"><a href="StudBlogs.jsp" class="m6">BLOGS</a></li>
           <li><a href="StudLibrary.jsp" class="m3">LIBRARY</a></li>
         </ul>
       </nav>
       <form action="" id="search-form" onSubmit="srch()">
         <fieldset>
           <div class="rowElem">
             <input type="text" id="srchkey">
             <a href="#" onClick="srchbyfun()">Search</a></div>
         </fieldset>
       </form>
     </div>
   </header>
   <div class="container">
      <!-- aside -->
<aside>
         <h3>&nbsp;</h3>
         <h3>Categories</h3>
         <ul class="categories">
         <li><span><a href="StudentReports.jsp">All Reports</a></span></li>
         <li><span><a href="StudBlogsCreate.jsp">Create Blogs</a></span></li>
            <li><span><a href="StudBlogsDelete.jsp">Delete Blogs</a></span></li>
            <li><span><a href="StudCommentCreate.jsp">Comment</a></span></li>
            <li><span><a href="StudCommentDelete.jsp">Delete Comment</a></span></li>
            <li class="last"><span><a href="/VcsTest/BlogsReport">View Blogs</a></span></li>
       </ul>
<h2>Fresh <span>News</span></h2>
<%Connection mycon=null; %>
<%
        try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			mycon=DriverManager.getConnection("jdbc:odbc:myvcs");			
			Statement stt;
			String date="",msg="";
			stt=mycon.createStatement();
			ResultSet rs=stt.executeQuery("select * from news");
			out.println("<ul class=\"news\">");
			
			while(rs.next())
			{
				out.println("<li><h5>"+rs.getString("ndate")+"</h5>");
				out.println("<h4><a href=\"#\">"+rs.getString("newsmsg")+"</a></h4></li>");
			}
			out.println("</ul>");
		}
		catch(Exception k)
		{
			System.err.println(k);
		}
		finally
		{
		}
		%>     </aside>
      <div id="global">
    <b><a href="/VcsTest/NoticeReport">View Notice</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b><a href="/VcsTest/AssignmentReport">View Assignment</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b><a href="/VcsTest/AssignmentReport">Take Assignment</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b><a href="StudAssignmentSubmit.jsp">Submit Assignment</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
   <p align="right"><b>
Hi &nbsp;<%out.println(session.getAttribute("uid").toString());%>
<a href="/VcsTest/ServletSignout" title="Log Out">Log Out</a> </b></p>
<!-- content -->
               <section id="content">
<marquee behavior="alternate"><font face="Kristen ITC"><b id="scroll">Virtual Classroom System</b></font></marquee>
<br><p></p>
<img src="../images/banner1.jpg" width="691" height="300" name="bnr"> 
       <div class="inside">
            <h2>Recent <span>blogs</span></h2>
            <ul class="list">
               <li> </li>
               <li> </li>
               <li class="last"> </li>
            </ul>
            <h2>Move Forward <span>With Your Education</span></h2>
            <p><span class="txt1">Student’s Site</span> is a free e-learning Website using which registered user can attend online/offline lectures and can join their favourite Course. </p>
            <div class="img-box"><img src="images/1page-img.jpg">This website template can be delivered in two packages - with PSD source files included and without them. If you need PSD source files, please go to the template download page at TemplateMonster to leave the e-mail address that you want the template ZIP package to be delivered to.</div>
            <p class="p0">This website template has several pages: <a href="../home.jsp">Home</a>, <a href="../contactus.jsp">About us</a>, <a href="articles.html">Articles</a> (with Article page), <a href="contact-us.html">Contact us</a> (note that contact us form – doesn’t work), <a href="sitemap.html">Site Map</a>.</p>
        </div>
     </section>
  </div>
</div>
<!-- footer -->
<footer>
   <div class="container">
      <div class="inside">
         <div class="wrapper">
            <div class="fleft">24/7 Customer Service <span>  94286-91034</span></div>
            <div class="aligncenter">
           This Website Under Construction. <br> Due To Lack Of Time We Are Unable To Create Online Conference And Others.
               </div>
         </div>
      </div>
   </div>
</footer>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
<%}else if(status==36){%>
<h1><center>Sorry Page Exists But You Are Unauthorized User For
This Page Thanks Best Luck Next Time
<br><br><br><a href="/VcsTest/login.jsp">Login Again</a><br><br><br><a href="/VcsTest/home.jsp">Go To Home</a></center><%}
else{%><h1>
<center>Your Session Has Been Expired
<br><br><br><a href="/VcsTest/login.jsp">Login Again</a><br><br><br><a href="/VcsTest/home.jsp">Go To Home</a></center>
<%}}%>
