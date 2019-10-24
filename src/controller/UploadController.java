package controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadController
 */
@WebServlet("/upload")
@MultipartConfig
public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
//		Part file = request.getPart("files");
		Collection<Part> parts = request.getParts();
		System.out.println(name);
		
		File folder = new File("C:\\Users\\user\\Documents\\projects20191025" + File.separator + name);
		System.out.println(folder.getName());
		System.out.println(folder.getAbsolutePath());
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		for (Part part : parts) {
			String filename = part.getSubmittedFileName();
			if (filename != null) {
				part.write(folder.getAbsolutePath() + File.separator + filename);
			}
		}
		
		session.setAttribute("name", name);
		session.setAttribute("message", "<i class=\"material-icons\">sentiment_very_satisfied</i> 전송 성공하였습니다.");
//		session.setAttribute("message", "전송에 실패하였습니다.");
		response.sendRedirect(request.getContextPath() + "/");
	}

}
