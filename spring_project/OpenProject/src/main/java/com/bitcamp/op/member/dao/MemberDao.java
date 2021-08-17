package com.bitcamp.op.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitcamp.op.jdbc.JdbcUtil;
import com.bitcamp.op.member.domain.Member;

@Repository
public class MemberDao {
	public int insertMember(Connection conn, Member member) throws SQLException {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql1 = "insert into member (memberid, memberpw, membername) values (?, ?, ?)";
		String sql2 = "insert into member (memberid, memberpw, membername, memberphoto) values (?, ?, ?,?)";

		try {
			if (member.getMemberPhoto() == null) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberPw());
				pstmt.setString(3, member.getMemberName());
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberPw());
				pstmt.setString(3, member.getMemberName());
				pstmt.setString(4, member.getMemberPhoto());
			}
			resultCnt = pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	public List<Member> selectList(Connection conn) {
		List<Member> list = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			String sql = "select * from member";
			rs = stmt.executeQuery(sql);
			list = new ArrayList<Member>();

			while (rs.next()) {
				list.add(new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getTimestamp(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		return list;
	}

	public Member selectByIdPw(Connection conn, String id, String pw) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where memberid=? and memberpw=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setMemberId(rs.getString("memberid"));
				member.setMemberPw(rs.getString("memberpw"));
				member.setMemberName(rs.getString("membername"));
				member.setRegdate(rs.getTimestamp("regdate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return member;
	}

	public int selectById(Connection conn, String memberId) throws SQLException {
		int cnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from member where memberid=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return cnt;
	}
}
