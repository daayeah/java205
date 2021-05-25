package ch02;

public class Person {
	String name;
	String phoneNo = "010-0000-0000";
	String idNo1 = "100000-0000000";
	long idNo2 = 2000000000000L;

	void showData() {
		System.out.println("회원 이름 : " + this.name);
		System.out.println("회원 전화번호 : " + this.phoneNo);
		System.out.println("회원 주민등록번호1 : " + this.idNo1);
		System.out.println("회원 주민등록번호2 : " + this.idNo2);
	}
	
	public static void main(String[] args) {
		Person person = new Person();
		
		System.out.println("이름 : " + person.name);
		person.name = "익명";
		person.showData();
	}
}
