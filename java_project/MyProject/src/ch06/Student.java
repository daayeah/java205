package ch06;

public class Student {
	private String name;
	private int korsum = 0;
	private int engsum = 0;
	private int mathsum = 0;
	private double koravr = 0;
	private double engavr = 0;
	private double mathavr = 0;
	
	private int[] korScore = {80, 65, 89, 70, 99, 45, 88, 50, 98, 87};
	private int[] engScore = {77, 68, 79, 95, 100, 85, 80, 50, 79, 45};
	private int[] mathScore = {40, 90, 88, 75, 95, 66, 70, 90, 100, 97};

	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return this.name;
	}

	void totalScore() {
		for(int i = 0; i < korScore.length; i++) {
			korsum += korScore[i];	
		}
		for(int j = 0; j < engScore.length; j++) {
			engsum += engScore[j];
		}
		for(int k = 0; k < mathScore.length; k++) {
			mathsum += mathScore[k];
		}
	}

	public void setTotalKor(int korsum) {
		this.korsum = korsum;
	}
	public int getTotalKor() {
		return this.korsum;
	}

	public void setTotalEng(int engsum) {
		this.engsum = engsum;
	}
	public int getTotalEng() {
		return this.engsum;
	}

	public void setTotalMath(int mathsum) {
		this.mathsum = mathsum;
	}
	public int getTotalMath() {
		return this.mathsum;
	}
	
	void avrScore() {
		koravr = korsum / 10.0;
		engavr = engsum / 10.0;
		mathavr = mathsum / 10.0;
	}
	
	public void setAvrKor(double koravr) {
		this.koravr = koravr;
	}
	public double getAvrKor() {
		return this.koravr;
	}
	
	public void setAvrEng(double engavr) {
		this.engavr = engavr;
	}
	public double getAvrEng() {
		return this.engavr;
	}
	
	public void setAvrMath(double mathavr) {
		this.mathavr = mathavr;
	}
	public double getAvrMath() {
		return this.mathavr;
	}
	

	public static void main(String[] args) {
		Student stu = new Student();
		stu.totalScore();
		stu.avrScore();
		System.out.println("<국어>");
		System.out.println("총점 : " + stu.getTotalKor());
		System.out.println("평균 : " + stu.getAvrKor());

		System.out.println("\n<영어>");
		System.out.println("총점 : " + stu.getTotalEng());
		System.out.println("평균 : " + stu.getAvrEng());
		
		System.out.println("\n<수학>");
		System.out.println("총점 : " + stu.getTotalMath());
		System.out.println("평균 : " + stu.getAvrMath());
	}
}
