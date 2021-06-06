package ch04;

import java.util.Scanner;
import java.util.Calendar;

public class Member {
	public static void main(String[] args) {
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		int inputYear;
		int age;

		System.out.print("태어난 해(년도)를 입력하세요 : ");
		Scanner sc = new Scanner(System.in);
		inputYear = sc.nextInt();
		age = thisYear - inputYear;
		System.out.println();

		if (age < 15 || age >= 65) {
			System.out.println("무료 예방접종이 가능합니다.");
		} else {
			System.out.println("무료 접종 대상이 아닙니다.");
		}

		if (age >= 20) {
			if (thisYear % 2 == inputYear % 2) {
				System.out.println("무료 건강검진이 가능합니다.");
				if (age >= 40) {
					System.out.println("무료 암 검사가 가능합니다.");
				}
			} else {
				System.out.println("내년에 무료 건강검진이 가능합니다.");
			}
		} else {
			System.out.println("무료 검진 대상이 아닙니다.");
		}
		sc.close();
	}
}
