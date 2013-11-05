package mgt;

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
import mybest.*;


/**
 * Servlet implementation class for Servlet: ServletMgtCompetitionUpdate
 *
 */
 public class ServletMgtCompetitionUpdate extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public ServletMgtCompetitionUpdate() {
		super();
	}   	
	static String myerror=null;

	static String mystr="";
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter kout=response.getWriter();
		kout.println("<html><head><title>Competition Updation Process Only Management</title></head>");
		
		String mycompid="",tcompname="",tcompdate="";
		String tdesc="",tduration="",query1="",query2="";
		
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
				
				mycompid="11comp01";
				//mycompid=request.getParameter("compid");
				
				tcompname="comps";
				tcompdate="19/10/1989";
				tdesc="checking";
				tduration="6";
				
				/*tcompname=request.getParameter("compname");
				tcompdate=request.getParameter("compdate");
				tdesc=request.getParameter("desc");
				tduration=request.getParameter("duration");*/
				
				
				st1=mycon.createStatement();
				ResultSet rs1=st1.executeQuery("select * from competition_master where compid='"+mycompid+"'");
				int tot=0;
				while(rs1.next())
				{
				tot=rs1.getRow();
				}
				
				if(tot!=0)
				{
					query1="delete from competition_master where compid='"+mycompid+"'";
					st=mycon.createStatement();
					st.executeUpdate(query1);
					
					query2="insert into competition_master(compid,compname,compdate,cdesc,duration) values('"+mycompid+"','"+tcompname+"','"+tcompdate+"','"+tdesc+"','"+tduration+"')";
					st=mycon.createStatement();
					st.executeUpdate(query2);
					//kout.println("<br><br><br><h1>Competition Updated Successfully");
					mystr="Competition Details Updated";
				}
				else
					mystr="This Competition Does Not Exists";
				//kout.println("<br><br><br><h1>Sorry This Competition Does Not Exists");
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
		//kout.println("Sorry Connection Is Not Active Now");
		
		}
		catch(Exception k)
		{
		System.err.println(k);
		myerror=myerror +"<br>"+ k.getMessage();

		}
		finally
		{
			kout.println("<html>");
			kout.println("<body OnLoad=document.getElementById('vcs').submit();>");
			kout.println("<form id=vcs method=post action=/Mytest/Jleft.jsp>");
			kout.println("<input type=hidden name=common value='"+mystr+"' >");
			kout.println("</form>");
			kout.println("</body></html>");

			kout.println("<html><body background='myreport1.jpg'>");
			kout.println("</body></html>");

			if(myerror!=null)
			kout.println("There Is A Error From Server-Side="+myerror);
			
			kout.close();
}
}	    
}