package ex.inheritance.friend;

// 변수, 메소드, 클래스, 컴파일 수정
public class Friend {
	String name;
	String phoneNum;
	String address;

	public Friend(String name, String phoneNum, String address) {
		super();
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
	}

	public void AllInfo() {
		System.out.println("이    름 : " + name);
		System.out.println("전화번호 : " + phoneNum);
		System.out.println("주    소 : " + address);
	}

	public void BasicInfo() {
	}
}
