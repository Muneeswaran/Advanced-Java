<%@page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,javax.servlet.ServletException,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse;"%>

<%int status=0;String sid="";try{HttpSession my=request.getSession(false);if(my!=null)
{sid=my.getId().toString();String str=my.getAttribute("urole").toString();
if(str.compareToIgnoreCase("faculty")==0)status=12;
else	status=36;}}
catch(Exception e)
{System.out.println(e+"session is expired ok");}
finally{%>
<%if(status==12){%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Question Creation</title>
<meta charset="utf-8">
<meta name="description" content="Place your description here">
<meta name="keywords" content="put, your, keyword, here">
<meta name="author" content="Templates.com - website templates provider">
<link rel="stylesheet" href="../css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../css/style.css" type="text/css"
	media="all">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
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
	position: absolute;
	width: 295px;
	height: 27px;
	z-index: 1;
	left: 650px;
	top: 74px;
}
-->
</style>
<script language="JavaScript">

</script>
</head>
<body id="page1">
<div class="wrap"><!-- header --> <header>
  <div class="container">
    <h1><a href="FacultyHome.jsp">Student's site</a></h1>
    <nav>
      <ul>
        <li><a href="FacultyHome.jsp" class="m1">LECTURE</a></li>
        <li class="current"><a href="FacultyAssignment.jsp" class="m2">ASSIGNMENT</a></li>
        <li><a href="FacultyQuiz.jsp" class="m3">QUIZ</a></li>
        <li><a href="FacultyBlogs.jsp" class="m4">BLOGS</a></li>
        <li><a href="#" class="m5">NOTICE</a></li>
        <li><a href="FacultyLibrary.jsp" class="m6">LIBRARY</a></li>
      </ul>
    </nav>
    <form action="" id="search-form">
      <fieldset>
        <div class="rowElem">
          <input type="text">
          <a href="#"
	class="srch" onClick="document.getElementById('search-form').submit()">Search</a></div>
      </fieldset>
    </form>
  </div>
</header>
<div class="container"><!-- aside --> <aside>
<h3>&nbsp;</h3>
<h3>Categories</h3>
<ul class="categories">
	<li><span><a href="FacultyReports.jsp">All Reports</a></span></li>
	<li><span><a href="FacultyAssignmentCreate.jsp">Create
	Assignment</a></span></li>
	<li><span><a href="FacultyAssignmentMarks.jsp">Assignment
	Marks</a></span></li>
	<li><span><a href="/VcsTest/AssignSubmittedReport"
		target="_blank">Submitted Assignment</a></span></li>
	<li><span><a href="FacultyAssignmentDelete.jsp">Delete
	Assignment</a></span></li>
	<li><span><a href="/VcsTest/AssignmentMarksReport">View Submitted Assignment Marks</a></span></li>
</ul>
<h2>Fresh <span>News</span></h2>
<%Connection mycon=null; %> <%
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
		%> </aside>
<p align="right"><b>
Hi &nbsp;<%out.println(session.getAttribute("uid").toString());%>
<a href="/VcsTest/ServletSignout" title="Log Out">Log Out</a> </b></p>
<!-- content --> <section id="content">
<fieldset><legend><font>
<h4>Submitted Assignment</h4>
</font></legend>
<dd><br>
<dd>
<dd><br>
<br>
</fieldset>
</section></div>
</div>
<!-- footer -->
<footer>
<div class="container">
<div class="inside">
<div class="wrapper">
<div class="fleft">24/7 Customer Service <span> 94286-91034</span></div>
<div class="aligncenter">This Website Under Construction. <br>
Due To Lack Of Time We Are Unable To Create Online Conference And
Others.</div>
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

