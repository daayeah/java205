package ch02;

import java.util.Scanner;

public class Person {
	public static void main(String[] args) {
		String name, phoneNo, idNo;
		
		System.out.print("이름을 입력하세요 : ");
		Scanner sc = new Scanner(System.in);
		name = sc.nextLine();
		System.out.print("전화번호를 입력하세요 : ");
		Scanner sc2 = new Scanner(System.in);
		phoneNo = sc2.nextLine();		
		System.out.print("주민등록번호를 입력하세요 : ");
		Scanner sc3 = new Scanner(System.in);
		idNo = sc3.nextLine();

		System.out.println();
		System.out.print("회원정보 : " + name + " / " + phoneNo + " / "+  idNo);
	}
}
