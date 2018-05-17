

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin_ser
 */
public class Admin_ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_ser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try
		{
		
			String name1 = request.getParameter("aname");
			String pass1 = request.getParameter("apass");
			
			Connection con = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
		    Statement st = con.createStatement();
		    
		    ResultSet rs =st.executeQuery("select * from user_tab where name='"+name1+"' and password='"+pass1+"'" );
		    if(rs.next())
		    {
		    	response.sendRedirect("view.jsp");	
		    }
		    else
		    { 
		    	RequestDispatcher rd=request.getRequestDispatcher("admin2.jsp");
		    	String error="invalid data";
		    	request.setAttribute("msg",error);
		    	rd.include(request,response);
			}
	    }
		catch (Exception e)
		{ 			System.out.println(e.getMessage());
 
		}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
