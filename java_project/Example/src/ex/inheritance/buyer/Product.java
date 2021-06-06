package ex.inheritance.buyer;

public class Product {
	final int price;
	int point;

	Product(int price) {
		this.price = price;
		point = (int) (price / 10.0);
	}
}
