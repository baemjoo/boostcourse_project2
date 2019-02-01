package kr.or.project2.todolist.api;

import java.io.IOException;
import java.io.PrintWriter;

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
			request.setCharacterEncoding("utf-8");
			
			System.out.println("TodoType Servlet pass");
			
			String id = request.getParameter("id");

			
			if(id != null)
			{
				System.out.println(id +" -> 넘어온 id와 type 데이터");
			}
			else
			{
				System.out.println(" -> 넘어오지 않음");
			}
			
			
			PrintWriter pw = response.getWriter();
			pw.println("Success");
			pw.close();
			//String res = request.getAttribute("id").toString();
			//System.out.println(res);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
