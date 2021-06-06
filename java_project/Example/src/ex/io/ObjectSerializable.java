package ex.io;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;

public class ObjectSerializable {
	public static void main(String[] args) {
		try {
			// 인스턴스 저장
			ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("Object.ser"));

			out.writeObject(new Circle(1, 2, 3.4));
			out.writeObject(new Circle(3, 5, 7.9));
			out.writeObject("Hello");

			ArrayList<Circle> list = new ArrayList<>();

			list.add(new Circle(1, 2, 3.4));
			list.add(new Circle(5, 6, 7.8));
			list.add(new Circle(9, 12, 13.14));
			list.add(new Circle(21, 22, 23.24));
			list.add(new Circle(31, 32, 33.34));
			out.writeObject(list);

			out.close();

			System.out.println("인스턴스 저장 완료");

			// 인스턴스 복원
			ObjectInputStream in = new ObjectInputStream(new FileInputStream("Object.ser"));

			// 저장 순서에 맞게 복원
			Circle c1 = (Circle) in.readObject();
			Circle c2 = (Circle) in.readObject();
			String str = (String) in.readObject();

			ArrayList<Circle> list2 = (ArrayList<Circle>) in.readObject();

			for (Circle circle : list2) {
				System.out.println(circle);
			}
			System.out.println("복원된 인스턴스의 데이터를 출력");

			c1.showData();
			c2.showData();

			in.close();

			System.out.println(str);
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}

class Circle implements Serializable { // 직렬화 대상임을 의미(마킹)
	int x;
	int y;
	double r;
	// transient double r; // 저장 안 됨 -> 0.0으로 출력

	public Circle(int x, int y, double r) {
		this.x = x;
		this.y = y;
		this.r = r;
	}

	@Override
	public String toString() {
		return "Circle [x=" + x + ", y=" + y + ", r=" + r + "]";
	}

	public void showData() {
		System.out.println("원점 [" + x + ", " + y + "]");
		System.out.println("반지름 : " + r);
	}
}
