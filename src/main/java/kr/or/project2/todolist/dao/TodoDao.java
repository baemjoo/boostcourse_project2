package kr.or.project2.todolist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.or.project2.todolist.dto.TodoDto;

public class TodoDao {

	private static String dburl = "jdbc:mysql://localhost:3306/todolist?serverTimezone=Asia/Seoul";
	private static String dbuser = "todouser";
	private static String dbpassword = "1234";

	public int addTodo(TodoDto todo) {

		int addCount = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql = "insert into todo(title,name,sequence) values(?,?,?)";
		
		try(Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			PreparedStatement ps = conn.prepareStatement(sql);) {

			try{
			ps.setString(1, todo.getTitle());
			ps.setString(2, todo.getName());
			ps.setInt(1, todo.getSequence());
			}catch (Exception e) {
				e.printStackTrace();
			}//ps set try 
		} catch (Exception e) {
			e.printStackTrace();
		}//sql try
		
		return addCount;
	}

	public List<TodoDto> getTodos() {

		List<TodoDto> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String sql = "select id, title, name, sequence, type, regdate from todo "
				+ "order by regdate desc select id, title, name, sequence, type, regdate from todo "
				+ "where type = 'TODO' order by regdate desc";

		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					Long id = rs.getLong("id");
					String title = rs.getString("title");
					String name = rs.getString("name");
					int sequence = rs.getInt("sequence");
					String type = rs.getString("type");
					String regdate = rs.getString("regdate");
					
					//(long id, String name, String regdate, Integer sequence, String title, String type)
					TodoDto tododto = new TodoDto(id,name,regdate,sequence,title,type);
					list.add(tododto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
