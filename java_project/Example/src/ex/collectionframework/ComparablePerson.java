package ex.collectionframework;

import java.util.Iterator;
import java.util.TreeSet;

public class ComparablePerson {
	public static void main(String[] args) {
		TreeSet<Person> set = new TreeSet<Person>();

		// 데이터 저장
		set.add(new Person("Lee", 24));
		set.add(new Person("Hong", 29));
		set.add(new Person("Park", 21));

		// 정렬
		Iterator<Person> itr = set.iterator();

		while (itr.hasNext()) {
			itr.next().AllInfo();
		}
	}

}

class Person implements Comparable<Person> {
	String name;
	int age;

	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public void AllInfo() {
		System.out.printf("%s, %d \n", this.name, this.age);
	}

	@Override
	public int compareTo(Person o) {
		if (this.age > o.age) {
			return 1;
		} else if (this.age < o.age) {
			return -1;
		} else {
			return 0;
		}
		// line 40-46 대체 가능
		// return this.age - o.age;
		// return o.age - this.age; // 반대 정렬
	}
}
