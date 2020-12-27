package eventManagement.model;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import eventManagement.dao.FormUploadDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/Success")
@MultipartConfig(maxFileSize = 16177215)
public class Success extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private FormUploadDao uploadform;
    public Success() {
        super();
       uploadform = new FormUploadDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		
		
		
		//Store the data into a database!....:)
		String etitle = request.getParameter("title");
		String edescription = request.getParameter("description");
		InputStream eposter = null; // input stream of the upload file

        String message = null;
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("poster");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            eposter = filePart.getInputStream();
        }
        
        InputStream elogo = null;
        
        String logomessage = null;
        Part logofilePart = request.getPart("logo");
        if (logofilePart!=null) {
        	System.out.println(logofilePart.getName());
            System.out.println(logofilePart.getSize());
            System.out.println(logofilePart.getContentType());
            
            elogo = logofilePart.getInputStream();
        }
        //String org1id,String org1contact,String org1email,String org2id, String org2contact,String org2email,String eventtype,String rules
        String estart = request.getParameter("startdate");
        String eend = request.getParameter("enddate");
        String eregend = request.getParameter("regend");
        
        String org1id = request.getParameter("idone");
        String org1contact = request.getParameter("contactone");
        String org1email = request.getParameter("emailone");
        
        
        String org2id = null ;
        String org2contact = request.getParameter("contacttwo");
        String org2email = request.getParameter("emailtwo");
        
        String eventtype = request.getParameter("etypes");
        System.out.println(eventtype);
        String rules = request.getParameter("rules");
		
        uploadform.postForm(etitle, edescription, eposter, elogo, estart, eend, eregend, org1id, org1contact, org1email, org2id, org2contact, org2email, eventtype, rules);
		
		
		request.setAttribute("id",1);
		RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
		rd.forward(request, response);
	}

}
