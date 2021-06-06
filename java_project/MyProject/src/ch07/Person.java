package ch07;

import java.util.Calendar;

public class Person {
	String name;
	String idNo = "800101-2000000";

	public char gender() {
		return idNo.charAt(7);
	}

	void Hello() {
		int age = Integer.parseInt(idNo.substring(0, 2));
		int year = Calendar.getInstance().get(Calendar.YEAR);

		if (gender() == '1' || gender() == '2') {
			age = year - (1900 + age) + 1;
		} else if (gender() == '3' || gender() == '4') {
			age = year - (2000 + age) + 1;
		}
		System.out.println("안녕하세요. 저는 " + name + "이고, " + age + "살입니다.");
	}

	public static void main(String[] args) {
		Person p = new Person();
		p.Hello();
		System.out.println();

		Male m = new Male();
		m.MaleInfo();
		System.out.println();

		Female f = new Female();
		f.FemaleInfo();
	}
}
