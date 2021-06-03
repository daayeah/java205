package ch04;

import java.util.Scanner;
import java.util.Calendar;

public class Member2 {
	void vaccinCheck(int birthYear) {
		int age = ageCal(birthYear);
		boolean check = age < 15 || age >= 65;

		if (check) {
			System.out.println("무료 예방접종이 가능합니다.");
		} else {
			System.out.println("무료 접종 대상이 아닙니다.");
		}
	}

	void checkUp(int birthYear) {
		int age = ageCal(birthYear);
		boolean check = 2021 % 2 == birthYear % 2;

		if (age >= 20 && check) {
			System.out.println("무료 건강검진이 가능합니다.");
			if (age >= 40) {
				System.out.println("무료 암 검사가 가능합니다.");
			}
		} else {
			System.out.println("무료 검진 대상이 아닙니다.");
		}
	}

	int ageCal(int year) {
		return Calendar.getInstance().get(Calendar.YEAR) - year;
	}

	public static void main(String[] args) {
		System.out.print("태어난 해(년도)를 입력하세요 : ");
		Scanner sc = new Scanner(System.in);
		int birthYear = sc.nextInt();

		Member2 m = new Member2();
		m.vaccinCheck(birthYear);
		m.checkUp(birthYear);
	}
}
