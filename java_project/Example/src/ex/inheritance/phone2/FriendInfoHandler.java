package ex.inheritance.phone2;

import java.util.Scanner;

public class FriendInfoHandler {
	Friend[] friends;
	int numOfFriend; // 배열 index 역할, 정보의 개수

	public FriendInfoHandler(int num) {
		this.friends = new Friend[num];
		this.numOfFriend = 0;
	}

	public void addFriend(int choice) {
		Scanner sc = new Scanner(System.in);

		System.out.print("이름 입력 : ");
		String name = sc.nextLine();

		System.out.print("전화번호 입력 : ");
		String phoneNum = sc.nextLine();

		System.out.print("주소 입력 : ");
		String address = sc.nextLine();

		if (choice == 1) { // 1:고교
			System.out.print("직업 입력 : ");
			String work = sc.nextLine();

			// // 인스턴스 생성
			// HighFriend hFriend = new HighFriend(name, phoneNum, address, work);

			addFriendInfo(new HighFriend(name, phoneNum, address, work)); // line 31 대체

			// // 배열에 요소 추가
			// friends[numOfFriend] = hFriend;
			// numOfFriend++;

		} else { // 2:대학
			System.out.print("전공 입력 : ");
			String major = sc.nextLine();

			// // 인스턴스 생성
			// UnivFriend uFriend = new UnivFriend(name, phoneNum, address, major);

			addFriendInfo(new UnivFriend(name, phoneNum, address, major)); // line 44 대체

			// // 배열에 요소 추가
			// friends[numOfFriend] = uFriend;
			// numOfFriend++;
		}
	}

	// Friend 클래스를 상속하는 타입의 인스턴스를 받아 배열에 저장
	public void addFriendInfo(Friend f) {
		friends[numOfFriend++] = f; // line 36-37, 49-50 대체
		System.out.println("\n정보가 저장되었습니다.\n");
	}

	public void showallInfo() {  
		System.out.println("친구의 전체 정보를 출력합니다.");
		System.out.println("------------------------------");

		if (numOfFriend > 0) {
			for (int i = 0; i < numOfFriend; i++) {
				friends[i].allInfo();
			}
		} else {
			System.out.println("입력된 정보가 없습니다.");
		}
	}

	public void showbasicInfo() {
		System.out.println("친구의 기본 정보를 출력합니다.");
		System.out.println("------------------------------");

		if (numOfFriend > 0) {
			for (int i = 0; i < numOfFriend; i++) {
				friends[i].basicInfo();
			}
		} else {
			System.out.println("입력된 정보가 없습니다.");
		}
	}
}
