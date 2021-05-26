package ch05;

public class MemberMain {
	public static void main(String[] args) {
		Member member1 = new Member("익명1", "010-0000-0000", 
									"수학", 3, 
									"anon1@gmail.com", 
									"2000-01-01", "신촌");
		
		member1.setName("익명3");
		member1.showInfo();
		System.out.println(member1.getName());
	}
}
