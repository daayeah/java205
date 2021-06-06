package ex.arraylist.friend;

public class HighFriend extends Friend {
	String work;

	public HighFriend(String name, String phoneNum, String address, String work) {
		super(name, phoneNum, address);
		this.work = work;
	}

	@Override
	public void AllInfo() {
		super.AllInfo();
		System.out.println("직    업 : " + work);
		System.out.println("------------------------------");
	}

	@Override
	public void BasicInfo() {
		System.out.println("이    름 : " + name);
		System.out.println("전화번호 : " + phoneNum);
		System.out.println("------------------------------");
	}

}
