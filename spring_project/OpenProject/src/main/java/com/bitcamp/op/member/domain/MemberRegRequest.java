package com.bitcamp.op.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class MemberRegRequest {

	private String memberid;
	private String memberpw;
	private String membername;
	private MultipartFile memberphoto;

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

	public MultipartFile getMemberPhoto() {
		return memberphoto;
	}

	public void setMemberPhoto(MultipartFile memberphoto) {
		this.memberphoto = memberphoto;
	}

	@Override
	public String toString() {
		return "MemberRegRequest [memberid=" + memberid	+ ", memberpw="	+ memberpw
				+ ", membername=" + membername + ", memberphoto=" + memberphoto.getOriginalFilename() + "]";
	}

	public Member toMember() {
		return new Member(0, memberid, memberpw, membername, null, null);
	}
}
