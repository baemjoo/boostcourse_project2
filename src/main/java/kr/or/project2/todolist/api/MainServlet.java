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

		// TODO
		// ajax 로 templating을 만들어서
		// todo, doing done class 별로 add해주면 될 듯

		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		
		TodoDao dao = new TodoDao();
		List<TodoDto> list = dao.getTodos();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(list);
	
		req.setAttribute("todolist",json);
		System.out.println(json);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/main.jsp");
		requestDispatcher.forward(req, resp);
	}

}
