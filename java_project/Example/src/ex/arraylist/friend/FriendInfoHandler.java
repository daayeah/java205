package ex.arraylist.friend;

import java.util.ArrayList;
import java.util.Scanner;

import ex.inheritance.friend2.Friend;

public class FriendInfoHandler {
	// 배열 -> 컬렉션
	// Friend[] friends;
	// int numOfFriend;
	ArrayList<Friend> friends;

	public FriendInfoHandler(int num) {
		// this.friends = new Friend[num];
		// this.numOfFriend = 0;
		friends = new ArrayList<Friend>(num);
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
			
			addFriendInfo(new HighFriend(name, phoneNum, address, work));
		} else { // 2:대학
			System.out.print("전공 입력 : ");
			String major = sc.nextLine();

			addFriendInfo(new UnivFriend(name, phoneNum, address, major));
		}
	}

	public void addFriendInfo(Friend f) {
		// 컬렉션 : List에 요소 추가
		// friends[numOfFriend++] = f;
		friends.add(f);
		System.out.println("\n정보가 저장되었습니다.\n");
	}

	public void showAllInfo() {
		System.out.println("친구의 전체 정보를 출력합니다.");
		System.out.println("------------------------------");

		// 요소의 저장 방식 : 배열 -> 컬렉션 => 반복문 수정
		if (friends.size() > 0) {
			for (int i = 0; i < friends.size(); i++) {
				friends.get(i).AllInfo();
			}
		} else {
			System.out.println("입력된 정보가 없습니다.");
		}
	}

	public void showBasicInfo() {
		System.out.println("친구의 기본 정보를 출력합니다.");
		System.out.println("------------------------------");

		// 요소의 저장 방식 : 배열 -> 컬렉션 => 반복문 수정
		if (!friends.isEmpty()) { // (friends.size() > 0)
			for (int i = 0; i < friends.size(); i++) {
				friends.get(i).BasicInfo();
			}
		} else {
			System.out.println("입력된 정보가 없습니다.");
		}
	}
}
