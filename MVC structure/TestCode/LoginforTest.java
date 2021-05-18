package TestCode;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Login;
import model.InitDB;
public class LoginforTest extends Login  {
	
	private static final long serialVersionUID = 1L;
	private PreparedStatement statement;
	private ResultSet resultSet;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		try {
			statement = InitDB.getConnection().prepareStatement("SELECT password, userId FROM user WHERE email = ?");
			statement.setString(1, email);

			resultSet = statement.executeQuery();
			ServletContext sc = request.getServletContext();

			if (resultSet.next()) {
				if (resultSet.getString("password").equals(password)) {
					HttpSession session = request.getSession();
					Cookie ck = new Cookie("userId", resultSet.getString("userId"));
					response.addCookie(ck);
					session.setAttribute("email", email);
					session.setAttribute("userId", resultSet.getString("userId"));

					response.sendRedirect("dashboard.jsp");
				} else {
					String htmlMessage = "<p class='text-center text-danger'>*** Password Does Not Match ***</p>";

					sc.setAttribute("messages", htmlMessage);
					response.sendRedirect("login.jsp");
				}
			} else {
				String htmlMessage = "<p class='text-center text-danger'>*** Invalid Credentials ***</p>";

				sc.setAttribute("messages", htmlMessage);
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			InitDB.closeConnection();
		}
	}

}
