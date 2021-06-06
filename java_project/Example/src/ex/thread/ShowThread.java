package ex.thread;

public class ShowThread extends Thread {
	String tName;

	ShowThread(String name) {
		this.tName = name;
	}

	@Override
	public void run() {
		for (int i = 0; i < 100; i++) {
			System.out.println("안녕하세요. " + tName + "입니다.");

			try {
				sleep(1000); // 1초간 일시정지 : * (1/1000)
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
