package ex.collectionframework;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

public class IteratorTest {
	public static void main(String[] args) {
		// ArrayList<String> list = new ArrayList<String>();
		List<String> list = new ArrayList<String>(); // 다형성

		// 요소 저장 : add(T t)
		list.add("First");
		list.add("Second");
		list.add("Third");
		list.add("Frist"); // 중복 허용

		// 세가지 방법
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		System.out.println("-------");

		for (String str : list) {
			System.out.println(str);
		}

		System.out.println("-------");

		Iterator<String> itr = list.iterator();

		while (itr.hasNext()) {
			String currentStr = itr.next();
			System.out.println(currentStr);
		}
	}

}
