package ex.inheritance.buyer;

public class Computer extends Product {

	Computer(int price) {
		super(price);
	}

	@Override
	public String toString() {
//		return "Computer [price=" + price + ", point=" + point + "]";
		return "Computer";
	}

}
