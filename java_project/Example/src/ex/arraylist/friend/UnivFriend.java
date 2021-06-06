package ex.arraylist.friend;

public class UnivFriend extends Friend {
	String major;

	public UnivFriend(String name, String phoneNum, String address, String major) {
		super(name, phoneNum, address);
		this.major = major;
	}

	@Override
	public void AllInfo() {
		super.AllInfo();
		System.out.println("전    공 : " + major);
		System.out.println("------------------------------");
	}

	@Override
	public void BasicInfo() {
		System.out.println("이    름 : " + name);
		System.out.println("전화번호 : " + phoneNum);
		System.out.println("주    소 : " + address);
		System.out.println("------------------------------");
	}
}
