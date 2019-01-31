package kr.or.project2.todolist.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodoTypeServlet
 */
public class TodoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TodoTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			//TODO 
			// update state
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			String id = request.getAttribute("id").toString();
			String type = request.getAttribute("type").toString();
			System.out.println(id + "-> id" + type + "-> type");
			
			//String res = request.getAttribute("id").toString();
			//System.out.println(res);
			//request.setAttribute("result", "success");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
