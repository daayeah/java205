package ch07;

class Female extends Person {
	void FemaleInfo() {
		super.name = "익명2";
		super.idNo = "080101-4000000";
		super.Hello();

		if (super.gender() == '1' || super.gender() == '3') {
			System.out.println("저의 성별은 남성입니다.");
		} else if (super.gender() == '2' || super.gender() == '4') {
			System.out.println("저의 성별은 여성입니다.");
		}
	}
}
