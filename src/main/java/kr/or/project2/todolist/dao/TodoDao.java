package kr.or.project2.todolist.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Role;

import kr.or.project2.todolist.dto.TodoDto;

public class TodoDao {

	private static String dburl = "jdbc:mysql://localhost:3306/todolist?serverTimezone=Asia/Seoul";
	private static String dbuser = "todouser";
	private static String dbpassword = "1234";

	public int addTodo(TodoDto todo) {

		int addCount = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql = "insert into todo(id,title,name,sequence,type,regdate) values(?,?,?,?,?,?)";
		
		try(Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			try(ps.setLong(1, Long.parseLong(todo.getId()));
				ps.setString(2, todo.getTitle());
				ps.setString(3, todo.getName());
					ps.setInt(4,todo.getSequence());
					ps.setString(5,todo.getType());
					ps.setDate(6, todo.getRegdate())) {
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return addCount;

	}
	
	public int addRole(Role role)
	{
		int insertCount =0;  // database에 입력한 건수를 나타낼 객체
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dburl,dbuser,dbpassword);
			
			String sql = "INSERT INTO todo(,description) VALUES (?,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,role.getRoleId());
			ps.setString(2, role.getDescription());
			
			insertCount = ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(ps != null)
			{
				try {
					ps.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(conn != null)
			{
				try {
					conn.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return insertCount;
	}

	public List<Role> getRoles() {

		List<Role> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String sql = "SELECT description,role_id from role order by role_id desc";

		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					String description = rs.getString(1);
					int id = rs.getInt("role_id");
					Role role = new Role(id, description);
					list.add(role);
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
