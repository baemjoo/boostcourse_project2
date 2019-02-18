package kr.or.project2.todolist.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.project2.todolist.dao.TodoDao;
import kr.or.project2.todolist.dto.TodoDto;

/**
 * Servlet implementation class MainServlet
 */
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		TodoDao dao = new TodoDao();
		try {
			
			List<TodoDto> todolist = dao.getTodos("TODO");
			List<TodoDto> doinglist = dao.getTodos("DOING");
			List<TodoDto> donelist = dao.getTodos("DONE");
			
			ObjectMapper objectMapper = new ObjectMapper();
			
			String todojson = objectMapper.writeValueAsString(todolist);
			String doingjson = objectMapper.writeValueAsString(doinglist);
			String donejson = objectMapper.writeValueAsString(donelist);
			
			req.setAttribute("todo_list",todojson);
			req.setAttribute("doing_list",doingjson);
			req.setAttribute("done_list",donejson);

			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/main.jsp");
			requestDispatcher.forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

}
