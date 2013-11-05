﻿<!DOCTYPE html>
<%@page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,javax.servlet.ServletException,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse;"%>
<html lang="en">
<head>
<title>About Us - About Us | Student's Site - Free Website
Template from Templates.com</title>
<meta charset="utf-8">
<meta name="description" content="Place your description here">
<meta name="keywords" content="put, your, keyword, here">
<meta name="author" content="Templates.com - website templates provider">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
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
<script language="JavaScript">
            function search()
            {   var search;
                search=document.getElementById('keyword').value;
                if(search!="")
                {
                window.open("http://www.google.co.in/search?q="+search+"&cad=b&cad=h");
                }
                else
                {
                }
            }
            function searchviafunction()
            {
                search();
            }
function redirect()
{
    var role=document.getElementById('role').value;
    if(role=="student")
    {
        window.location.href="Register.jsp";
    }
    else if(role=="faculty")
    {
        window.location.href="FacultyRegister.jsp";
    }
    else if(role=="management")
    {
        window.location.href="MgtRegister.jsp";
    }
}
function subs()
{
document.getElementById('newsletter-form').action="/VcsTest/ServletSubscribe";
data=document.getElementById('newsletter-form').submit();
}

function unsub()
{
document.getElementById('newsletter-form').action="/VcsTest/ServletUnSubscribe";
data=document.getElementById('newsletter-form').submit();
}
</script>
</head>
<body id="page2">
<div class="wrap"><!-- header --> <header>

<div class="container">
<h1><a href="staff.jsp"></a></h1>
<nav>
<ul>
	<li><a href="home.jsp" class="m1">Home </a></li>
	<li><a href="courses.jsp" class="m2">courses</a></li>
	<li><a href="activities.jsp" class="m3">Activities</a></li>
	<li><a href="gallary.jsp" class="m4">gallery</a></li>
	<li class="current"><a href="staff.jsp" class="m5">staff</a></li>
	<li><a href="contactus.jsp" class="m6">contact us</a></li>
</ul>
</nav>
<form action="" OnSubmit="search()" id="search-form">
<fieldset>
<div class="rowElem"><input type="text" id="keyword"> <a
	href="#" OnClick="searchviafunction()">Search</a></div>
</fieldset>
</form>

</div>
</header>
<div class="container"><!-- aside --> <aside>
<h3>&nbsp;</h3>
<h3>Categories</h3>
<ul class="categories">
	<li><span><a href="/VcsTest/VStudentReport">Student Info</a></span></li>
           <li><span><a href="/VcsTest/VFacultyReport">Vacancies</a></span></li>
           <li><span><a href="/VcsTest/VMgtReport">Management</a></span></li>
</ul>
<form action="" id="newsletter-form" method="post">
<%
String sb=request.getParameter("subscribe");
%>
<input type="text" id="total" value="<%if(sb!=null){out.println(sb);}%>" size="35"
			style="background: url(images/errorbg.jpg) no-repeat top left; color: red; border: 0px solid; height: 14px; font-family: Trebuchet MS;"
			readonly>
<fieldset>
<div class="rowElem">
<h2>Newsletter</h2>
<input type="email" value="Enter Your Email Here"
	onFocus="if(this.value=='Enter Your Email Here'){this.value=''}"
	onBlur="if(this.value==''){this.value='Enter Your Email Here'}">
<div class="clear"><a href="#" class="fleft" OnClick="unsub()">Unsubscribe</a><a
	href="#" class="fright"
	onClick="subs()">Submit</a></div>
</div>
</fieldset>
</form>
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
				out.println("<li><strong>"+rs.getString("ndate")+"</strong>");
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
<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color="maroon">Register As:&nbsp;&nbsp;</font> <select id="role"
	name="role"
	style="border: 1px solid #a52a2a; font-family: arial; color: #FFFFFF; background-color: #26b6e8;">
	<option value="student">Student</option>
	<option value="faculty">Faculty</option>
	<option value="management">Management</option>
</select>&nbsp;&nbsp; <input type="button" name="go" value=" Go "
	OnClick="redirect()"> &nbsp; &nbsp;&nbsp;&nbsp;|&nbsp;
&nbsp;&nbsp;&nbsp; <a href="login.jsp"
	title="Already Registerd, Sign In">Log In</a> </b></p>
<!-- content --> <section id="content">
<fieldset><legend><font>
<h4>Faculties</h4>
</font></legend>
<dd><br>

<%
        try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			mycon=DriverManager.getConnection("jdbc:odbc:myvcs");			
			Statement stt;			
			stt=mycon.createStatement();
			ResultSet rs=stt.executeQuery("select * from faculty_master");
			out.println("<table border=1>");
			
			out.println("<tr>");

			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;");
			out.println("</td>");			

			
			out.println("<td>");
			out.println("Name");
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;");
			out.println("</td>");			
			
			out.println("<td>");
			out.println("Gender");
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			

			out.println("<td>");
			out.println("Mobile");
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			
			
			out.println("<td>");
			out.println("E-Mail");
			out.println("</td>");
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			
			
			out.println("<td>");
			out.println("Qualification");
			out.println("</td>");			

			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			
			
			out.println("</tr>");

			out.println("<tr>");
			
			out.println("<td>");
			out.println("<br><br>");
			out.println("</td>");			
			
			out.println("</tr>");
			
			while(rs.next())
			{
			out.println("<tr>");
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;");
			out.println("</td>");			
			
			out.println("<td>");
			out.println(rs.getString("f_fname"));
			out.println("</td>");
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			
			
			out.println("<td>");
			out.println(rs.getString("gender"));
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			

			out.println("<td>");
			out.println(rs.getString("mobileno"));
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			

			out.println("<td>");
			out.println(rs.getString("email"));
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			
			
			out.println("<td>");
			out.println(rs.getString("qualification"));
			out.println("</td>");			
			
			out.println("<td>");
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp");
			out.println("</td>");			
		
			out.println("</tr>");
			
			out.println("<tr>");
			
			out.println("<td>");
			out.println("<br>");
			out.println("</td>");			
			
			out.println("</tr>");
								
			}
			out.println("</table>");
		}
		catch(Exception k)
		{
			System.err.println(k);
		}
		finally
		{
		}
		%>

</fieldset>
</section>
<h2>Move Forward <span>With Your Education</span></h2>
<p><span class="txt1">Student’s Site </span>is a free e-learning
Website using which registered user can attend online/offline lectures
and can join their favourite Course.</p>
<div class="img-box"><img src="images/1page-img.jpg">This
Website offers you a online/Offline Education using Video conference
Technology. Registered user can attend online Lectures and Quizes. Users
can also read E-books in Library and Many more.</div>
<p class="p0">&nbsp;</p>
</div>
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
