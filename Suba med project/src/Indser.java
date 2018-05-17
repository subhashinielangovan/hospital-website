

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Indser
 */
public class Indser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Indser() {
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
			HttpSession ses=request.getSession();
			String name1 = request.getParameter("lname");
			String num1 = request.getParameter("lnum");

			System.out.println(name1);
			System.out.println(num1);

			
			Connection con = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
		    Statement st = con.createStatement();
		    
		    ResultSet rs =st.executeQuery("select * from patient where pname='"+name1+"' and pphonenumber='"+num1+"'" );
		    if(rs.next())
		    {
		    ses.setAttribute("msg", num1);	
			RequestDispatcher rd =	request.getRequestDispatcher("user_home.jsp");
		    rd.include(request,response);
		    	
		    }
		    else
		    {
		    RequestDispatcher rd =	request.getRequestDispatcher("index.jsp");
		    String error = "incorrect data"	;
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
