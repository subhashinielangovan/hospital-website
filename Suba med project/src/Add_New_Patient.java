

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_New_Patient
 */
public class Add_New_Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_New_Patient() {
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
			String n = request.getParameter("pname");
			String a = request.getParameter("paddress");
			String num = request.getParameter("pnumber");
			String pr = request.getParameter("pprob");
			String dr = request.getParameter("pdoct");
			String da = request.getParameter("pdate");
			
			String m1 = request.getParameter("med1");
			
			String q1 = request.getParameter("qu1");
			String m2 = request.getParameter("med2");
			String q2 = request.getParameter("qu2");
			
			
			System.out.println(n);
			System.out.println(a);
			System.out.println(num);
			System.out.println(pr);
			System.out.println(dr);
			System.out.println(da);
			System.out.println(m1);
			System.out.println(q1);
			System.out.println(m2);
			System.out.println(q2);
			
		
			Connection con = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
		    Statement st = con.createStatement();
		    st.executeUpdate("insert into patient values('"+n+"','"+a+"','"+num+"','"+pr+"','"+dr+"','"+da+"','"+m1+"','"+q1+"','"+m2+"','"+q2+"')");
			
		    RequestDispatcher rd =	request.getRequestDispatcher("admin_add.jsp");
		    String error = "added successfully"	;
		    request.setAttribute("msg",error);
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
