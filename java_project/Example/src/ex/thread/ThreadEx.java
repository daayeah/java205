package ex.thread;

import javax.swing.JOptionPane;

public class ThreadEx {
	public static boolean chk = false;

	public static void main(String[] args) {
		CountDownThread ct = new CountDownThread();
		InputThread it = new InputThread();

		ct.start();
		it.start();
	}
}

class InputThread extends Thread {
	public void run() {
		String name = JOptionPane.showInputDialog("이름을 입력해주세요.");
		ThreadEx.chk = true; // line 19가 실행되어야 선언 -> 위치 변동 시 실행 불가

		System.out.println("안녕하세요. " + name + "님");
	}
}

class CountDownThread extends Thread {
	@Override
	public void run() {
		for (int i = 10; i > 0; i--) {
			if (ThreadEx.chk) {
				return;
			}
			System.out.println(i);

			try {
				sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("입력 시간이 지나 프로그램을 종료합니다.");
		System.exit(0);
	}
}
