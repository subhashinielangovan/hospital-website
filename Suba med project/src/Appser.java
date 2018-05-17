

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Appser
 */
public class Appser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Appser() {
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
			String d = request.getParameter("pdate");
			String t = request.getParameter("ptime");
		
			
			HttpSession ses=request.getSession();

			String recmsg = ses.getAttribute("msg")!=null?(String)ses.getAttribute("msg"):" ";
			System.out.println(recmsg);


			System.out.println(d);
			System.out.println(t);
			
			Connection con = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
		    Statement st = con.createStatement();
		    st.executeUpdate("insert into appoint_tab values ('"+recmsg+"','"+d+"','"+t+"','0')");
			
		    RequestDispatcher rd =	request.getRequestDispatcher("app.jsp");
		    String error = "appointment has been sent"	;
		    request.setAttribute("msg3",error);
		    rd.include(request,response);
			
			
		}
	    
		catch (Exception e)
		{  
			System.out.println(e.getMessage());
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
