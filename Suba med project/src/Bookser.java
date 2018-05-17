

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
 * Servlet implementation class Bookser
 */
public class Bookser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bookser() {
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
				String med1 = request.getParameter("m1");
				String qu1 = request.getParameter("q1");
				String med2 = request.getParameter("m2");
				String qu2 = request.getParameter("q2");
				HttpSession ses=request.getSession();

				String recmsg = ses.getAttribute("msg")!=null?(String)ses.getAttribute("msg"):" ";
				System.out.println(recmsg);


				System.out.println(med1);
				System.out.println(qu2);
				System.out.println(med2);
				System.out.println(qu2);
				
				Connection con = null;
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
			    Statement st = con.createStatement();
			    st.executeUpdate("insert into med_tab values ('"+recmsg+"','"+med1+"','"+qu1+"','"+med2+"','"+qu2+"')");
				
			    RequestDispatcher rd =	request.getRequestDispatcher("med_book.jsp");
			    String error = "booked successfully"	;
			    request.setAttribute("msg2",error);
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
