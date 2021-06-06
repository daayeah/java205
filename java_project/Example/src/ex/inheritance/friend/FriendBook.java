package ex.inheritance.friend;

import java.util.Scanner;

public class FriendBook {
	public static void main(String[] args) {
		FriendInfoHandler handler = new FriendInfoHandler(100);

		while (true) {
			System.out.println("******** 메뉴 ********");
			System.out.println("1. 고교 친구 정보 입력");
			System.out.println("2. 대학 친구 정보 입력");
			System.out.println("3. 전체 정보 출력");
			System.out.println("4. 기본 정보 출력");
			System.out.println("5. 프로그램 종료");
			System.out.println("**********************");

			System.out.print("메뉴를 선택하세요 : ");
			Scanner sc = new Scanner(System.in);
			int choice = sc.nextInt();
			System.out.println();

			switch (choice) {
				case 1:
				case 2:
					handler.addFriend(choice);
					break;
				case 3:
					handler.showAllInfo();
					break;
				case 4:
					handler.BasicInfo();
					break;
				case 5:
					System.out.println("프로그램을 종료합니다.");
					return;
			}
		}
	}
}
