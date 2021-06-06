package ex.inheritance.box;

public class Overriding {
	public static void main(String[] args) {
		Box2 box1 = new Box2();
		PaperBox2 box2 = new PaperBox2();
		GoldPaperBox2 box3 = new GoldPaperBox2();

		wrapBox(box1);
		wrapBox(box2);
		wrapBox(box3);
	}

	public static void wrapBox(Box2 box) {
		box.wrap();
	}
}

class Box2 {
	public void simpleWrap() {
		System.out.println("SimpleWrap");
	}

	public void wrap() {
		System.out.println("SimpleWrap");
	}
}

class PaperBox2 extends Box2 {
	public void paperWrap() {
		System.out.println("PaperWrap");
	}

	public void wrap() {
		System.out.println("PaperWrap");
	}
}

class GoldPaperBox2 extends PaperBox2 {
	public void goldPaperWrap() {
		System.out.println("GoldPaperWrap");
	}

	public void wrap() {
		System.out.println("GoldPaperWrap");
	}
}
