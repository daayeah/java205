package ex.collectionframework;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class HashSetTest2 {
	public static void main(String[] args) {
		Set<SimpleNumber> hashSet = new HashSet<SimpleNumber>();

		hashSet.add(new SimpleNumber(10));
		hashSet.add(new SimpleNumber(20));
		hashSet.add(new SimpleNumber(20));

		Iterator<SimpleNumber> itr = hashSet.iterator();

		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
	}
}

class SimpleNumber {
	int num;

	SimpleNumber(int num) {
		this.num = num;
	}

	public String toString() {
		return String.valueOf(num);
	}
}
