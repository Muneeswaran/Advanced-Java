<%int status=0;String sid="";try{HttpSession my=request.getSession(false);if(my!=null)
{sid=my.getId().toString();String str=my.getAttribute("urole").toString();
if(str.compareToIgnoreCase("admin")==0)status=12;
else	status=36;}}
catch(Exception e)
{System.out.println(e+"session is expired ok");}
finally{%>
<%if(status==12){%>
<!DOCTYPE html>
<%@page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,javax.servlet.ServletException,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse;"%>
<html lang="en">
<head>
<title>Home | Welcome To Administrator</title>
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
<script language=JavaScript>
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
<body id="page1">
<div class="wrap"><!-- header --> <header>
<div class="container">
<h1><a href="AdminReports.jsp">Student's site</a></h1>
<nav>
<ul>
	<li><a href="AdminHome.jsp" class="m1">STUDENT</a></li>
	<li><a href="AdminFaculty.jsp" class="m2">FACULTY</a></li>
	<li><a href="AdminMgt.jsp" class="m3">MANAGEMENT</a></li>
	<li><a href="AdminCourses.jsp" class="m4">COURSE</a></li>
	<li><a href="AdminBlogs.jsp" class="m5">BLOGS</a></li>
	<li class="current"><a href="AdminReports.jsp" class="m6">Reports</a></li>
</ul>
</nav>
<form action="" id="search-form" OnSubmit="srch()">
<fieldset>
<div class="rowElem"><input type="text" id="srchkey"> <a
	href="#" onClick="srchbyfun()">Search</a></div>
</fieldset>
</form>
</div>
</header>
<div class="container"><!-- aside --> <aside>
<h3>&nbsp;</h3>
<h3>Reports</h3>
<ul class="categories">
	<li><span><a href="/VcsTest/StudentReport">Students</a></span></li>
	<li><span><a href="/VcsTest/FacultyReport">Faculties</a></span></li>
	<li><span><a href="/VcsTest/MgtReport">Management</a></span></li>
	<li><span><a href="/VcsTest/AssignmentReport">Assignment's</a></span></li>
	<li><span><a href="/VcsTest/QuizReport">Quiz</a></span></li>
	<li><span><a href="/VcsTest/ActivityReport">Activities</a></span></li>
	<li><span><a href="/VcsTest/CompetitionReport">Competition's</a></span></li>
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
<div id="global"><b><a href="AdminNewsCreate.jsp">News</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><a href="AdminNoticeCreate.jsp">Notice</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><a href="AdminLoginLock.jsp">Login Lock</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><a href="AdminLoginUnlock.jsp">Login Unlock</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><a href="AdminLoginDelete.jsp">Login Delete</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><a href="AdminCommentCreate.jsp">Comment</a></b></div>
<p align="right"><b>
Hi &nbsp;<%out.println(session.getAttribute("uid").toString());%>
<a href="/VcsTest/ServletSignout" title="Log Out">Log Out</a> </b></p>
<!-- content --> <section id="content">
<fieldset><legend><font>
<h4>All Types Of Report</h4>
</font></legend>
<dd><br>
<table width="625" border="0" align="center">
	<tr>
		<th width="197">&nbsp;</th>
		<th width="198">&nbsp;</th>
		<th width="206">&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/FacultyAlluminiReport">FacultyAlumni</a>&nbsp;</span></th>
		<th></th>
		<th><span class="fleft"><a href="/VcsTest/BlogsReport">Blogs</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/CommentsReport">Comment's</a>&nbsp;
		</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/CompWinnerReport">CompWinners</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/CourseReport">Courses</a>&nbsp;
		</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/CommentsCourseWiseReport">CommentsCourseWise</a>&nbsp;</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/MgtAlluminiReport">MgtAllumini</a>&nbsp;
		</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/QuizAttendedReport">QuizAttended</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/QuizResultReport">QuizResults</a></span></th>
		&nbsp;
		<th></th>
		<th><span class="fleft"><a href="/VcsTest/StudentCourseWiseReport">StudentCourseWise</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/BlogsCourseWiseReport">BlogsCourseWise</a>&nbsp;
		</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/AssignmentCourseWiseReport">AssignmentCourseWise</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/QuizCourseWiseReport">QuizCourseWise</a>&nbsp;
		</span></th>
		<th></th>
		<th><span class="fleft"><a href="/VcsTest/FacultyAttendanceReport">FacultyAttendence</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/MgtAttendanceReport">MgtAttendence</a>&nbsp;
		</span></th>
		<th></th>
		<th><span class="fleft"><a href="/VcsTest/LoggingReport">Logins</a>&nbsp;
		</span></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th></th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/StudentAttendanceReport">StudentAttendence</a>&nbsp;</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/LoggingRoleWiseReport">LoggingRoleWise</a>&nbsp;</span></th>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th></th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/StudentBlogsReport">StudentBlogs</a>&nbsp;</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/FacultyBlogsReport">FacultyBlogs</a>&nbsp;</span></th>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th></th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/MgtBlogsReport">Management
		Blogs</a>&nbsp;</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/NewsLetterReport">News
		Letters</a>&nbsp;</span></th>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th></th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/StudentPendingReport">Student
		Pending</a>&nbsp;</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/FacultyPendingReport">Faculty
		Pending</a>&nbsp;</span></th>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th></th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/MgtPendingReport">Management
		Pending</a>&nbsp;</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/AssignmentMarksReport">AssignmentMarks</a>&nbsp;</span></th>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th></th>
	</tr>
	<tr>
		<th><span class="fleft"><a href="/VcsTest/FacultyVideoReport">Videos</a>&nbsp;</span></th>
		<th>&nbsp;</th>
		<th><span class="fleft"><a href="/VcsTest/FacultyLibraryReport">Library</a>&nbsp;</span></th>
	</tr>
	<tr>
	  <th>&nbsp;</th>
	  <th>&nbsp;</th>
	  <th></th>
	  </tr>
	<tr>
	  <th><span class="fleft"><a href="/VcsTest/NoticeReport">Notice</a></span></th>
	  <th>
	    <span class="fleft">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      &nbsp;</span></th>
	  <th><span class="fleft"><a href="/VcsTest/CompParticipantsReport">Competition
	    Participants</a>&nbsp;</span></th>
	  </tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
    <tr>
	  <th>&nbsp;</th>
	  <th>&nbsp;</th>
	  <th></th>
	  </tr>
      <tr>
	  <th>&nbsp;</th>
	  <th>&nbsp;</th>
	  <th></th>
	  </tr>
</table>
<dd><br>
</fieldset>
</section></div>
</div>
<!-- footer -->
<footer>
<div class="container">
<div class="inside">
<div class="wrapper">
<div class="fleft">24/7 Customer Service <span>8.800.146.56.7</span></div>
<div class="aligncenter"><a href="http://www.templatemonster.com"
	class="new_window">Website template</a> designed by TemplateMonster.com<br>
<a href="http://www.templates.com/product/3d-models/" class="new_window">3D
Models</a> provided by Templates.com</div>
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
