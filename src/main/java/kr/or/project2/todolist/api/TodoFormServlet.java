package kr.or.project2.todolist.api;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodoFormServlet
 */
public class TodoFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TodoFormServlet() {
        super();
    
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TodoFormServlet pass");
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/todoForm.jsp");
		requestDispatcher.forward(request, response);
	}

    

}
