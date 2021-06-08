package ex.arraylist;

public abstract class Friend implements ShowInfo {
	String name;
	String phoneNum;
	String address;

	public Friend(String name, String phoneNum, String address) {
		super();
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
	}

	public void allInfo() {
		System.out.println("이    름 : " + name);
		System.out.println("전화번호 : " + phoneNum);
		System.out.println("주    소 : " + address);
	}

	public abstract void basicInfo();
}
