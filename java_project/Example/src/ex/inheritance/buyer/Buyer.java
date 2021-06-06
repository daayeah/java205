package ex.inheritance.buyer;

public class Buyer {
	int money;
	int point;
	Product[] item;
	int cnt; // 배열 index 역할, 정보의 개수

	public Buyer() {
		this.money = 10000;
		this.point = 0;
		this.item = new Product[10];
		this.cnt = 0;
	}

	void buy(Product p) {
		if (this.money < p.price) {
			System.out.println("잔액이 부족합니다.");
			return;
		}
		this.money -= p.price;
		this.point += p.point;

		item[cnt++] = p;

		System.out.println(p + " 구매");
	}

	void summary() {
		int sum = 0;
		int point = 0;
		String itemList = "";

		for (int i = 0; i < cnt; i++) {
			sum += item[i].price;
			point += item[i].point;
			itemList += item[i] + ", ";
		}
		System.out.println("구매하신 제품은 " + itemList + "입니다.");
		System.out.println("구매하신 제품의 총 금액은 " + sum + "원입니다.");
		System.out.println("구매하신 제품의 적립 포인트는 " + point + "점입니다.");
	}
}
