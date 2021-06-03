package ch02;

public class Member {
	public static void main(String[] args) {
		String name = "익명";
		int age = 20;
		double height = 160.5;
		boolean hasBook = false;

		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("키 : " + height);
		System.out.println("책 보유 여부 : " + hasBook);

		if (hasBook) {
			System.out.println("책을 갖고 있습니다.");
		} else {
			System.out.println("책을 갖고 있지 않습니다.");
		}
	}
}
