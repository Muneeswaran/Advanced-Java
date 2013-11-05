package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import mybest.*;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: ServletAdminFacultyUpdate
 *
 */
 public class ServletAdminFacultyUpdate extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public ServletAdminFacultyUpdate() {
		super();
	}   	
	static String myerror=null;
	
	static String mystr="";	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter kout=response.getWriter();
		kout.println("<html><head><title>Faculty Information Updation</title></head>");

		String tfid="",tf_fname="",tf_iname="",tf_surname="";
		String tfday="",tfmonth="",tfyear="";
		String tfbdate="",tgender="",tmobileno="";
		String tcountry="",tstate="",tcity="";
		String taddress="",tzipcode="",temail="",tqualification="";
		String query1="",query2="";

		Connection mycon=null;
		Statement st,st1;
		
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
				/*kout.println("<br><br><center>**************************************************************************************************************");
				kout.println("<br><h1>Faculty Information Updation In VCS</h1>");
				kout.println("<br><br><br>**************************************************************************************************************</center><br>");*/

			
				tfid="11fact05";
				tfid=request.getParameter("fid");
				st1=mycon.createStatement();
				ResultSet rs1=st1.executeQuery("select * from faculty_master where fid='"+tfid+"'");
				int tot=0;
				while(rs1.next())
				{
				tot=rs1.getRow();
				}
				if(tot!=0)
				{
				tf_fname="ketan new";
				tf_iname="arjun";
				tf_surname="chawda";
				tfday="19";
				tfmonth="10";
				tfyear="1989";
				tfbdate=tfmonth+"/"+tfday+"/"+tfyear;//access
				//tfbdate=tfyear+"-"+tfmonth+"-"+tfday;//db2
				tgender="male";
				tmobileno="99792";
				tcountry="india";
				tstate="gujarat";
				tcity="surat";
				taddress="bamroli";
				tzipcode="3984";
				temail="gentleman@yahoo";
				tqualification="phd";
				
					tf_fname=request.getParameter("f_fname");
					tf_iname=request.getParameter("f_iname");
					tf_surname=request.getParameter("f_surname");
					kout.println("<br>="+tf_fname);
					//tfday=request.getParameter("f_bday");
					//tfmonth=request.getParameter("f_bmonth");
					//tfyear=request.getParameter("f_byear");
					tfbdate=request.getParameter("birth");
					//tfbdate=tfmonth+"/"+tfday+"/"+tfyear;//access
					//tfbdate=tfyear+"-"+tfmonth+"-"+tfday;//db2
					tgender=request.getParameter("gender");
					tmobileno=request.getParameter("mobileno");
					tcountry=request.getParameter("country");
					tstate=request.getParameter("state");
					tcity=request.getParameter("city");
					taddress=request.getParameter("address");
					tzipcode=request.getParameter("zipcode");
					temail=request.getParameter("email");
					tqualification=request.getParameter("qualification");
				
				query2="update faculty_master set f_fname='"+tf_fname+"',f_iname='"+tf_iname+"',f_surname='"+tf_surname+"',fbdate='"+tfbdate+"',gender='"+tgender+"',mobileno='"+tmobileno+"',country='"+tcountry+"',state='"+tstate+"',city='"+tcity+"',address='"+taddress+"',zipcode='"+tzipcode+"',email='"+temail+"',qualification='"+tqualification+"' where fid='"+tfid+"'";
				st=mycon.createStatement();
				st.executeUpdate(query2);
				//kout.println("<br><br><br><h1>Remember This Faculty's Previous Details Will Be Overriden By This New Values As Per Your Wish");
				mystr="Faculty Info Updated";
				}
				else
				mystr="Faculty Does Not Exists";
				//kout.println("<br><br><br><h1>Sorry This Faculty Is Not Exists Or Some Other Restriction Are Been Given ");
			}
			catch(Exception e)
			{
				System.err.println(e);
				myerror=e.getMessage();

			}
			finally
			{
				mycon.close();
			}
		}
		else
		mystr="Sorry Connection Is In-Active";

		}
		catch(Exception k)
		{
		System.err.println(k);
		myerror=myerror +"<br>"+ k.getMessage();

		}
		finally
		{
			/*kout.println("<html>");
			kout.println("<body OnLoad=document.getElementById('vcs').submit();>");
			kout.println("<form id=vcs method=post action=/VcsTest/Admin/AdminFacultyUpdate.jsp>");
			kout.println("<input type=hidden name=common value='"+mystr+"' >");
			kout.println("</form>");
			kout.println("</body></html");*/
			kout.println("<html><body background='myreport1.jpg'>");
			kout.println("</body></html>");

			if(myerror!=null)
			kout.println("There Is A Error From Server-Side="+myerror);
			
			kout.close();
}
}	    
}