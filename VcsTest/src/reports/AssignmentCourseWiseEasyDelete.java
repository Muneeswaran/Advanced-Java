package reports;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybest.Fortable;
import mybest.Styles;

/**
 * Servlet implementation class for Servlet: AssignmentCourseWiseEasyDelete
 *
 */
 public class AssignmentCourseWiseEasyDelete extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public AssignmentCourseWiseEasyDelete() {
		super();
	}   	
	static String myerror=null;

	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter kout=response.getWriter();
		kout.println("<html><head><title>Easy Deletion Of Assignment CourseWise Which Are Currently Allocated In VCS</title></head>");
		HttpSession my=request.getSession(false);
		Connection mycon=null;
		String tdate=new Date().toGMTString().toString(),forrole=my.getAttribute("urole").toString();
		Statement st;
		
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			mycon=DriverManager.getConnection("jdbc:odbc:myvcs");
			//kout.println("<br><br>**************************************************************************************************************");
			//kout.println("<br><h1>Your Connection With Mentioned DataSource Was Established Successfully </h1>");
			//kout.println("<br><br>**************************************************************************************************************");
			if(mycon!=null)
			{
			try
			{
				kout.println("<br><br><center>**************************************************************************************************************");
				kout.println("<table border=0>");
				kout.println("<tr><td colspan=100%><center><h2>"+Styles.ccase("Organisation : virtual class room system")+"</center>");
				kout.println("<tr><td><br>");
				kout.println("<tr><td colspan=75%><blockquote><h2>"+Styles.ccase("Operation For : "+forrole)+"<td><h2>"+Styles.ccase(tdate));
				kout.println("<tr><td colspan=75%><blockquote><h2>"+Styles.ccase("Operation On : "+" Assignment CourseWise")+"<td><h2><a href='javascript:history.go(-1)'>Back</a>");
				kout.println("</table>");
				kout.println("<br><br><br>**************************************************************************************************************</center><br>");
				//kout.println("<br><br><h1>Assignment CourseWise Which Are Currently Allocated In VCS</h1>");
	
				st=mycon.createStatement();
				ResultSet rs=st.executeQuery("select distinct coursename from subject_master");
					
				int c=1;
				kout.println("<center><table align='right' border=2 bordercolor=black width=95%>");
				kout.println("<form action='/VcsTest/AssignmentCourseWiseEasyHelp' method='post'>");
				
				while(rs.next())
				{
					String str=rs.getString("coursename");
					//kout.println("<br><tr><td colspan=11>********************************************************************************************************");
					kout.println("<tr><td colspan=100%><center>"+Fortable.display(153,"*"));
					
					if(c%2==1)
					kout.println("<tr><td>Sr No:"+c+"<td colspan=95%><center><h1>Course Id : " +str+"</center></h1>");
					else
					kout.println("<tr><td>Sr No:"+c+"<td colspan=95%><center><h2>Course Id : "+str+"</center></h2>");
					
					st=mycon.createStatement();
					ResultSet rs1=st.executeQuery("select * from assign_allocation where coursename='"+str+"'");
					
					int k=1;
					while(rs1.next())
					{
					str=rs1.getString("aid");
					
					kout.println("<tr><td colspan=100%><center>"+Fortable.display(153,"-"));
					kout.println("<tr><td><input type='submit' value='Delete'><td>Total:<td>Assign Id<td>Allocated On<td>For Subject<td>Total Marks<td>Submission Date<td>");
					kout.println("<tr><td>"+k);
					kout.println("<input type='checkbox' name='"+"c"+k+"' value='"+str+"'>");
					
					kout.println("<td>"+str);
					kout.println("<td>"+rs1.getString("alloc_date"));
					kout.println("<td>"+rs1.getString("subject"));
					kout.println("<td>"+rs1.getString("marks"));
					kout.println("<td>"+rs1.getString("submission_date"));
					k=k+1;
					kout.println("<tr><td colspan=100%><center>"+Fortable.display(33,"<<->>"));
					
					}
					rs1.close();
					
					if(k==1)
					kout.println("<center><h3>Sorry No Assignment Is Currently Available In VCS For This Course</h3></center>");
					c=c+1;
				}
				kout.println("<tr><td colspan=100%><center>"+Fortable.display(33,"<<->>"));
				kout.println("</table></center>");
				
				kout.println("<input type='hidden' name='total' value="+c+">");
				kout.println("</form>");
				
				rs.close();
				st.close();

				if(c==1)
					kout.println("<br><br><br><h1>Sorry No Course Is Currently Available In VCS");
			}
			catch(Exception e)
			{
				System.out.println(e);
				myerror=e.getMessage();
			}
			finally
			{
				mycon.close();
			}
			}
			else
			kout.println("<br><br><h2><center>Sorry Connection Is Not Active Now");
		}
		catch(Exception k)
		{
			System.err.println(k);
			myerror=myerror +"<br>"+ k.getMessage();
		}
		finally
		{
			kout.println("<html><body background='myreport1.jpg'>");
			kout.println("</body></html>");

			if(myerror!=null)
			kout.println("There Is A Error From Server-Side="+myerror);

	 		kout.close();
		}
}   	  	    
}