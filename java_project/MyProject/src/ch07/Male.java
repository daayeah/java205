package ch07;

class Male extends Person {
	void MaleInfo() {
		super.name = "익명1";
		super.idNo = "900101-1000000";
		super.Hello();

		if(super.gender() == '1' || super.gender() == '3') {
			System.out.println("저의 성별은 남성입니다.");
		} else if(super.gender() == '2' || super.gender() == '4') {
			System.out.println("저의 성별은 여성입니다.");
		}
	}
}
