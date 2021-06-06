package ex.inheritance.buyer;

public class BuyerMain {
	public static void main(String[] args) {
		Buyer buyer = new Buyer();
		Tv tv = new Tv(5000);
		Computer com = new Computer(300);

		System.out.println("현재 소지한 금액은 " + buyer.money + "원입니다.");
		System.out.println("현재 보유한 적립 포인트는 " + buyer.point + "점입니다.");
		System.out.println();

		buyer.buy(tv);
		buyer.buy(com);
		buyer.buy(tv);
		buyer.buy(com);
		System.out.println();

		buyer.summary();
		System.out.println();

		System.out.println("현재 소지한 금액은 " + buyer.money + "원입니다.");
		System.out.println("현재 보유한 적립 포인트는 " + buyer.point + "점입니다.");
	}
}
