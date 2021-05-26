package ch07;

class Female extends Person {
	void FemaleInfo() {
		super.name = "익명2";
		super.idNo = "080101-4000000";
		super.Hello();
		
		char ch = idNo.charAt(7);
		if(ch == '2' || ch == '4') {
			System.out.print("저의 성별은 여성입니다.");
		}
	}
}
