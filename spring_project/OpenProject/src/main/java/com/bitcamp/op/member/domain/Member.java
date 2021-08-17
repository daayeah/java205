package com.bitcamp.op.member.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Member {

	private int idx;
	private String memberid;
	private String memberpw;
	private String membername;
	private String memberphoto;
	private Timestamp regdate;

	public Member(int idx, String memberid, String memberpw, String username, String memberphoto, Timestamp regdate) {
		this.idx = idx;
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.membername = membername;
		this.memberphoto = memberphoto;
		this.regdate = regdate;
	}

	public Member() {
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMemberId() {
		return memberid;
	}

	public void setMemberId(String memberid) {
		this.memberid = memberid;
	}

	public String getMemberPw() {
		return memberpw;
	}

	public void setMemberPw(String memberpw) {
		this.memberpw = memberpw;
	}

	public String getMemberName() {
		return membername;
	}

	public void setMemberName(String membername) {
		this.membername = membername;
	}

	public Timestamp getRegdate() {
		return new Timestamp(regdate.getTime() - (1000 * 60 * 60 * 9));
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getMemberPhoto() {
		return memberphoto;
	}

	public void setMemberPhoto(String memberphoto) {
		this.memberphoto = memberphoto;
	}

	public Date getDate() {
		return new Date(getRegdate().getTime());
	}

	@Override
	public String toString() {
		return "Member [idx=" + idx + ", memberid=" + memberid + ", memberpw=" + memberpw
				+ ", membername=" + membername + ", memberphoto=" + memberphoto + ", regdate=" + regdate + "]";
	}

	public LoginInfo toLoginInfo() {
		return new LoginInfo(this.idx, this.memberid, this.membername, this.memberphoto);
	}
}
