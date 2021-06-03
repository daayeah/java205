package ch03;

import java.util.Scanner;

public class Calculator {
	void plus(int num1, int num2) {
		System.out.println(" 덧셈  : " + num1 + "+" + num2 + "=" + (num1 + num2));
	}

	void minus(int num1, int num2) {
		System.out.println(" 뺄셈  : " + num1 + "-" + num2 + "=" + (num1 - num2));
	}

	void multi(int num1, int num2) {
		System.out.println(" 곱셈  : " + num1 + "*" + num2 + "=" + (num1 * num2));
	}

	void div(int num1, int num2) {
		System.out.println("나눗셈 : " + num1 + "/" + num2 + "=" + (num1 / num2));
	}

	void circum(double radius, double PI) {
		double circum = 2 * PI * radius;
		System.out.println("원의 둘레 : " + (Math.round(circum * 100) / 100.0));
	}

	void area(double radius, double PI) {
		double area = PI * radius * radius;
		System.out.println("원의 넓이 : " + (Math.round(area * 100) / 100.0));
	}

	public static void main(String[] args) {
		int num1, num2;
		double radius;
		final double PI = 3.14;

		System.out.print("첫번째 숫자 입력 : ");
		Scanner sc = new Scanner(System.in);
		num1 = sc.nextInt();

		System.out.print("두번째 숫자 입력 : ");
		Scanner sc2 = new Scanner(System.in);
		num2 = sc2.nextInt();

		Calculator cal = new Calculator();
		cal.plus(num1, num2);
		cal.minus(num1, num2);
		cal.multi(num1, num2);
		cal.div(num1, num2);
		System.out.println();

		System.out.print("실수 반지름 입력 : ");
		Scanner sc3 = new Scanner(System.in);
		radius = sc3.nextDouble();

		Calculator cal2 = new Calculator();
		cal2.circum(radius, PI);
		cal2.area(radius, PI);
	}
}