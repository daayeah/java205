package ex.collectionframework;

import java.util.HashSet;
import java.util.Iterator;

public class HashSetTest {
	public static void main(String[] args) {
		// HashSet 저장 공간 생성 :
		// 인스턴스 저장, 중복 저장, 순서 저장을 허용하지 않는다.
		HashSet<String> hashSet = new HashSet<String>();
		HashSet<Integer> hashSet2 = new HashSet<Integer>();

		// 데이터 저장
		hashSet.add("First");
		hashSet.add("Second");
		hashSet.add("Third");
		hashSet.add("First");
		hashSet2.add(1);
		hashSet2.add(2);
		hashSet2.add(3);
		hashSet2.add(1);

		// 데이터 일괄 처리
		Iterator<String> itr = hashSet.iterator();
		Iterator<Integer> itr2 = hashSet2.iterator();

		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		while (itr2.hasNext()) {
			System.out.println(itr2.next());
		}
	}
}
