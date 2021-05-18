package TestCode;

import static org.junit.Assert.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class LoginforTestTest {
	
	LoginforTest lg;
	InitDBfortest db;
	HttpServletRequest mockReq;
	HttpServletResponse mockRes;
	PreparedStatement smrt;
	ResultSet rs;
	

	@Before
	public void setUp() throws Exception {

		mockReq = Mockito.mock(HttpServletRequest.class);
		mockRes =Mockito.mock(HttpServletResponse.class);
		db = Mockito.mock(InitDBfortest.class);
		smrt = Mockito.mock(PreparedStatement.class);
		rs = Mockito.mock(ResultSet.class);
		lg = new LoginforTest(); 	
		Mockito.when(db.getConnection().prepareStatement("SELECT password, userId FROM user WHERE email = ?")).thenReturn(smrt);
		Mockito.when(smrt.executeQuery()).thenReturn(rs);
	}

	@Test
	public void test() throws Exception {
		Mockito.when(rs.getString("password")).thenReturn("password");
		Mockito.when(mockReq.getParameter("email")).thenReturn("email");
		Mockito.when(mockReq.getParameter("password")).thenReturn("password");
		new LoginforTest().doPost(mockReq, mockRes);
		assertEquals(mockReq.getParameter("password"), rs.getString("password"));
		
	}

}
