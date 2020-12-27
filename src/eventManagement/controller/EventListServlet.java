package eventManagement.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eventManagement.dao.eventsdb_jdbc_dao;
import eventManagement.model.eventsdb;
import eventManagement.model.users_registered_events;

@WebServlet("/Home")
public class EventListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private eventsdb_jdbc_dao eventDao_conn;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(){
		// TODO Auto-generated method stub
		eventDao_conn = new eventsdb_jdbc_dao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println(">>>>>>"+action+"<<<<<<");
		try {
			String[] arrOfStr = action.split("/" , 10);
			System.out.println(arrOfStr[1]);
			switch(action)
			{
			case "/cultural":
					CulturalPage(request,response);
					break;
				
			case "/sports":
					SportsPage(request,response);
					break;
					
			case "/Home":
				HomePage(request,response);
				break;
						
			case "/success":
				Registered(request,response);
				break;
				
				default: 
					HomePage(request,response);
					break;
			}
		}catch(SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void CulturalPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
		String eventtype = "cultural";
		try {
			List<eventsdb> events_list = eventDao_conn.selectEvents(eventtype); 
//			System.out.println(events_list.get(0));
			
			request.setAttribute("events_list", events_list);
			System.out.println();
			
			System.out.println(events_list.get(0).getTitle()+"okay");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Cultural-Page.jsp");
			dispatcher.forward(request,response);
		}catch(Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			e.printStackTrace();
		}
	}
	

	private void SportsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
		String eventtype = "sports";
		try {
			List<eventsdb> events_list = eventDao_conn.selectEvents(eventtype);  
			request.setAttribute("events_list", events_list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sports-Page.jsp");
			dispatcher.forward(request,response);
		}catch(Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			e.printStackTrace();
		}
	}
	
	private void HomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Home-Page.jsp");
		dispatcher.forward(request,response);
	}
	
	private void Registered(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		PrintWriter out = response.getWriter(); 
		try {
		Timestamp Reg_Date_time = new Timestamp(System.currentTimeMillis());
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		String username = request.getParameter("Username");

		users_registered_events user = new users_registered_events(event_id, username, Reg_Date_time);
		if(eventDao_conn.insert_Registered_Users(user)) {
			
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal(\"Good job!\", \"Registered Succesfully!\", \"success\");");
			out.println("});");
			out.println("</script>");
		
		}
		else {
			
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal(\"Already Registered!\", \"You clicked the button Multiple times!\", \"warning\");");
			out.println("});");
			out.println("</script>");
			System.out.println("Registering Multiple Times");
			
		}
		}catch(Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
