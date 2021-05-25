package ch03;

import java.util.Scanner;
import java.util.Calendar;

public class Member {
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		int thisYear = cal.get(Calendar.YEAR);
		int inputYear, age;

		System.out.print("태어난 해(년도)를 입력하세요 : ");
		Scanner sc = new Scanner(System.in);
		inputYear = sc.nextInt();		
		age = thisYear - inputYear;

		if(age < 15 || age >= 65) {
			System.out.println("무료 예방접종이 가능합니다.");
		} else {
			System.out.println("무료 접종 대상이 아닙니다.");
		}

		if(thisYear % 2 == 0) {
			if(age >= 20 && inputYear % 2 == 0) {
				System.out.println("무료 건강검진이 가능합니다.");
				if(age >= 40) {
					System.out.println("암 검사도 가능합니다.");
				}
			}  else {
				System.out.println("무료 검진 대상이 아닙니다.");
			}
		} else if(thisYear % 2 != 0){
			if(age >= 20 && inputYear % 2 != 0) {
				System.out.println("무료 건강검진이 가능합니다.");
				if(age >= 40) {
					System.out.println("암 검사도 가능합니다.");
				}
			} else {
				System.out.println("무료 검진 대상이 아닙니다.");
			}
		}
	}
}
