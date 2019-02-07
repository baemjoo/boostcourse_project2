package kr.or.project2.todolist.api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.project2.todolist.dao.TodoDao;



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
		
		request.setCharacterEncoding("utf-8");
		
		int res = 0;
		
		System.out.println("TodoType Servlet pass");
		
		try{
			
			int id = Integer.parseInt(request.getParameter("id"));
			String type = request.getParameter("type");
			System.out.println("servlet ) id : " + id + " type : " + type);
			
			try {
				TodoDao tododao = new TodoDao();
				res = tododao.updateTodo(id, type);
			}catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("결과는 : "+ res);
		
		PrintWriter pw = response.getWriter();
		pw.println("Success");
		pw.close();

	}

}
