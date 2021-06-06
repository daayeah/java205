package ch05;

public class Member {
	private String name;
	private String phoneNum;
	private String major;
	private int grade;
	private String email;
	private String birthday;
	private String address;

	Member(String name, String phoneNum, String major, int grade, String email, String birthday, String address) {
		this.name = name;
		this.phoneNum = phoneNum;
		this.major = major;
		this.grade = grade;
		this.email = email;
		this.birthday = birthday;
		this.address = address;
	}

	Member(String name, String phoneNum, String major, int grade, String email) {
//		this.name = name;
//		this.phoneNum = phoneNum;
//		this.major = major;
//		this.grade = gradde;
//		this.email = email;
		this(name, phoneNum, major, grade, email, null, null);
	}

	Member(String name, String phoneNum, String major) {
		this(name, phoneNum, major, 0, null, null, null);
	}

	void showInfo() {
		System.out.println("이름 : " + name);
		System.out.println("전화번호 : " + phoneNum);
		System.out.println("전공 : " + major);
		System.out.println("학년 : " + grade);
		System.out.println("이메일 : " + email);

		if (this.birthday == null) {
			System.out.println("생일 : 입력된 데이터가 없습니다.");
		} else {
			System.out.println("생일 : " + birthday);
		}

		if (this.address == null) {
			System.out.println("주소 : 입력된 데이터가 없습니다.");
		} else {
			System.out.println("주소 : " + address);
		}
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public static void main(String[] args) {
		Member member1 = new Member("익명1", "010-0000-0000", "수학", 3, "anon1@gmail.com", "2000-01-01", "신촌");
		member1.showInfo();

		System.out.println();
		Member member2 = new Member("익명2", "010-0000-0000", "영어", 4, "anon2@gmail.com");
		member2.showInfo();
	}
}