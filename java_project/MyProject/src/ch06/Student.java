package ch06;

public class Student {
	private String name;
	private int korScore;
	private int engScore;
	private int mathScore;

	Student(String name, int korScore, int engScore, int mathScore) {
		this.name = name;
		this.korScore = korScore;
		this.engScore = engScore;
		this.mathScore = mathScore;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKorScore() {
		return korScore;
	}

	public void setKorScore(int korScore) {
		this.korScore = korScore;
	}

	public int getEngScore() {
		return engScore;
	}

	public void setEngScore(int engScore) {
		this.engScore = engScore;
	}

	public int getMathScore() {
		return mathScore;
	}

	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	}

	public int getTotalSum() {
		return korScore + engScore + mathScore;
	}

	public double getAvrScore() {
		double avr = (korScore + engScore + mathScore) / 3.0;
		return Math.round(avr * 10) / 10.0;
	}

	public static void main(String[] args) {
		int korSum = 0;
		int engSum = 0;
		int mathSum = 0;

		Student[] stu = new Student[9];
		stu[0] = new Student("A", 100, 80, 96);
		stu[1] = new Student("B", 88, 90, 75);
		stu[2] = new Student("C", 90, 68, 77);
		stu[3] = new Student("D", 89, 76, 80);
		stu[4] = new Student("E", 87, 65, 75);
		stu[5] = new Student("F", 90, 93, 100);
		stu[6] = new Student("G", 80, 54, 86);
		stu[7] = new Student("H", 65, 82, 80);
		stu[8] = new Student("I", 93, 80, 64);
//		stu[9] = new Student("J", 76, 50, 98);

		System.out.println("이름\t국어 \t영어 \t수학 \t총점 \t평균");
		System.out.println("----------------------------------------------");
		for (int i = 0; i < stu.length; i++) {
			System.out.print(stu[i].name);
			System.out.print(" \t");
			System.out.print(stu[i].korScore);
			System.out.print(" \t");
			System.out.print(stu[i].engScore);
			System.out.print(" \t");
			System.out.print(stu[i].mathScore);
			System.out.print(" \t");
			System.out.print(stu[i].getTotalSum());
			System.out.print(" \t");
			System.out.println(stu[i].getAvrScore());

			korSum += stu[i].korScore;
			engSum += stu[i].engScore;
			mathSum += stu[i].mathScore;
		}
		System.out.println("----------------------------------------------");
		System.out.println("총점" + " \t" + korSum + " \t" + engSum + " \t" + mathSum);
		System.out.print("평균 \t");
		System.out.print(Math.round((double) korSum / stu.length * 10) / 10.0);
		System.out.print(" \t");
		System.out.print(Math.round((double) engSum / stu.length * 10) / 10.0);
		System.out.print(" \t");
		System.out.print(Math.round((double) mathSum / stu.length * 10) / 10.0);
	}
}
