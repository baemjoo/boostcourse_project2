package kr.or.project2.todolist.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.project2.todolist.dao.TodoDao;
import kr.or.project2.todolist.dto.TodoDto;

/**
 * Servlet implementation class TodoAddServlet
 */
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TodoAddServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("TodoAdd Servlet pass");
		
		//TODO - add data
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		int sequence= Integer.parseInt(request.getParameter("sequence"));
		System.out.println("title " + title + "name " + name + "sequence" + sequence);
		TodoDto tododto = new TodoDto(title,name,sequence);
		
		TodoDao dao = new TodoDao();
		int res = dao.addTodo(tododto);
		System.out.println("DB에 추가한 결과는 " + res);
		response.sendRedirect("./main");
	}

}
