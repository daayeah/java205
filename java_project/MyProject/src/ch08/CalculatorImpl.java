package ch08;

public class CalculatorImpl implements Calculator {
	@Override
	public long add(long n1, long n2) {
		return n1 + n2;
	}

	@Override
	public long minus(long n1, long n2) {
		return n1 - n2;
	}

	@Override
	public long multi(long n1, long n2) {
		return n1 * n2;
	}

	@Override
	public double div(double n1, double n2) {
		return n1 / n2;
	}
}
