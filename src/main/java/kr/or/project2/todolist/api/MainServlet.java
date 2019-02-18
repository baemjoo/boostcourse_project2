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
			
			List<TodoDto> todo_list = dao.getTodos("TODO");
			List<TodoDto> doing_list = dao.getTodos("DOING");
			List<TodoDto> done_list = dao.getTodos("DONE");
			
			ObjectMapper objectMapper = new ObjectMapper();
			
			String todo_json = objectMapper.writeValueAsString(todo_list);
			String doing_json = objectMapper.writeValueAsString(doing_list);
			String done_json = objectMapper.writeValueAsString(done_list);
			
			req.setAttribute("todo_list",todo_json);
			req.setAttribute("doing_list",doing_json);
			req.setAttribute("done_list",done_json);

			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/main.jsp");
			requestDispatcher.forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

}
