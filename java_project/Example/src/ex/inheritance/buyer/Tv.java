package ex.inheritance.buyer;

public class Tv extends Product {
	Tv(int price) {
		super(price);
	}

	public String toString() {
		return "TV";
	}
}
