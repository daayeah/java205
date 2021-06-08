package ex.arraylist;

public class HighFriend extends Friend {
	String work;

	public HighFriend(String name, String phoneNum, String address, String work) {
		super(name, phoneNum, address);
		this.work = work;
	}

	@Override
	public void allInfo() {
		super.allInfo();
		System.out.println("직    업 : " + work);
		System.out.println("------------------------------");
	}

	@Override
	public void basicInfo() {
		System.out.println("이    름 : " + name);
		System.out.println("전화번호 : " + phoneNum);
		System.out.println("------------------------------");
	}

}
