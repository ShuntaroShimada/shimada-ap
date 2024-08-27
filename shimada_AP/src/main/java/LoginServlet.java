import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:postgresql://az-shimada-db.postgres.database.azure.com:5432/postgres","shimada","syun053093A_");
			
			String sql = "SELECT * FROM users WHERE username ? AND password ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				response.sendRedirect("welcome.jsp");
			} else {
				request.setAttribute("errorMessage","Invalid username or password.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred while processing your request.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}