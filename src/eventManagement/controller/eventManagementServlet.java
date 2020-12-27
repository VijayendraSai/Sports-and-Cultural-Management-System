	package eventManagement.controller;
	
	import java.io.IOException;
	import java.io.PrintWriter;
	
	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import eventManagement.dao.eventdao;
	import eventManagement.model.event;

	
	@WebServlet("/home")
	public class eventManagementServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    private eventdao employeeDao;
	    public void init() {
	        employeeDao = new eventdao();
	    }
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	    	
	    	RequestDispatcher rd=request.getRequestDispatcher("/employeeregister.jsp");  
	        rd.forward(request, response);
	    	
	     }
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    	    throws ServletException, IOException {
	    	        doGet(request, response);
	    	    }
	
	
	
	}
