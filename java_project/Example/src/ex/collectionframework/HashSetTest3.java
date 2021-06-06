package ex.collectionframework;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class HashSetTest3 {
	public static void main(String[] args) {
		Set<SimpleNumber2> hashSet = new HashSet<SimpleNumber2>();

		hashSet.add(new SimpleNumber2(10));
		hashSet.add(new SimpleNumber2(20));
		hashSet.add(new SimpleNumber2(20));

		Iterator<SimpleNumber2> itr = hashSet.iterator();

		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
	}
}

class SimpleNumber2 {
	int num;

	SimpleNumber2(int num) {
		this.num = num;
	}

	@Override
	public int hashCode() {
		return num % 3; // 0, 1, 2
	}

	@Override
	public boolean equals(Object obj) {
		boolean result = false;

		// obj는 null이 아님 & SimpleNumber 타입으로 형변환 가능
		if (obj != null && obj instanceof SimpleNumber2) {
			SimpleNumber2 sNum = (SimpleNumber2) obj;
			if (this.num == sNum.num) {
				result = true;
			}
		}
		return result;
	}

	public String toString() {
		return String.valueOf(num);
	}
}
