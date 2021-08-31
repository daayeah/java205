package mem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mem.domain.Mem;
import jdbc.util.JdbcUtil;

public class MemDao {
	private MemDao() {
	}

	private static MemDao dao = new MemDao();

	public static MemDao getInstance() {
		return dao == null ? new MemDao() : dao;
	}

	public List<Mem> getMemList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Mem> list = null;

		try {
			stmt = conn.createStatement();

			String sql = "select * from member";

			rs = stmt.executeQuery(sql);
			list = new ArrayList<Mem>();

			while (rs.next()) {
				list.add(new Mem(rs.getInt("idx"), rs.getString("id"), rs.getString("pw"),
						rs.getString("name"), rs.getString("regdate")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
		return list;
	}

	public int insertMem(Connection conn, Mem mem) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "insert into member(id, pw, name) values (?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPw());
			pstmt.setString(3, mem.getName());

			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}
}
