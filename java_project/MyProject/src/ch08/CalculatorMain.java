package ch08;

public class CalculatorMain {
	public static void main(String[] args) {
		Calculator cal = new CalculatorImpl();

		System.out.println(cal.add(2, 5));
		System.out.println(cal.minus(2, 5));
		System.out.println(cal.multi(2, 5));
		System.out.println(cal.div(2, 5));
	}
}