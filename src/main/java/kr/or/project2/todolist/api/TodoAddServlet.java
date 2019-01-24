package kr.or.project2.todolist.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodoAddServlet
 */
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TodoAddServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.sendRedirect("/main");
	}

}
