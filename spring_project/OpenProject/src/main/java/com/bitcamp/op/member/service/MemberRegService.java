package com.bitcamp.op.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.op.jdbc.ConnectionProvider;
import com.bitcamp.op.jdbc.JdbcUtil;
import com.bitcamp.op.member.dao.MemberDao;
import com.bitcamp.op.member.domain.Member;
import com.bitcamp.op.member.domain.MemberRegRequest;

@Service
public class MemberRegService {

	@Autowired
	private MemberDao dao;

	final String UPLOAD_URI = "/uploadFile1";
	
	public int regMember(MemberRegRequest regRequest, HttpServletRequest request) {
	int result = 0;
		Connection conn = null;
		Member member = new Member();
		
		try {
			conn = ConnectionProvider.getConnection();

			member.setMemberId(regRequest.getMemberId());
			member.setMemberPw(regRequest.getMemberPw());
			member.setMemberName(regRequest.getMemberName());

			if (regRequest.getMemberPhoto() != null) {
				member.setMemberPhoto(regRequest.getMemberPhoto().getOriginalFilename());
				saveFile(request, regRequest.getMemberPhoto());
			}
			System.out.println(member.getMemberPhoto());
			result = dao.insertMember(conn, member);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return result;
	}

	private void saveFile(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		String saveDir = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
		File newFile = new File(saveDir, file.getOriginalFilename());
		file.transferTo(newFile);
	}
}
