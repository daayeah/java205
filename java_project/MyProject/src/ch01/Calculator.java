package ch01;

public class Calculator {
	void plus(int n1, int n2) {
		System.out.println(n1 + n2);
	}
	void minus(int n1, int n2) {
		System.out.println(n1 - n2);
	}
	void multi(int n1, int n2) {
		System.out.println(n1 * n2);
	}
	void div(int n1, int n2) {
		System.out.println(n1 / n2);
	}
	
	public static void main(String[] args) {
		Calculator cal = new Calculator();
		cal.plus(10, 20);
		cal.minus(20, 10);
		cal.multi(2, 5);
		cal.div(10, 4);
	}
}
