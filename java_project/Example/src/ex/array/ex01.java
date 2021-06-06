package ex.array;

import java.util.Arrays;
import java.util.Scanner;

public class ex01 {
	public static int miniValue(int[] arr) {
		int miniValue = arr[0];

		for (int i = 0; i < arr.length; i++) {
			if (arr[i] < miniValue) {
				miniValue = arr[i];
			}
		}
		return miniValue;
	}

	public static int maxValue(int[] arr) {
		int maxValue = arr[0];

		for (int e : arr) {
			if (e > maxValue) {
				maxValue = e;
			}
		}
		return maxValue;
	}

	public static void main(String[] args) {
		System.out.println("배열의 크기 입력(2이상의 정수)");
		System.out.print(" : ");
		Scanner sc = new Scanner(System.in);
		int arrlen = sc.nextInt();
		System.out.println();

		System.out.println("원하는 숫자 " + arrlen + "개 입력(정수)");
		int[] arr = new int[arrlen];

		for (int i = 0; i < arrlen; i++) {
			System.out.print(" : ");
			Scanner sc2 = new Scanner(System.in);
			int num = sc2.nextInt();
			arr[i] = num;
		}
		System.out.println();
		System.out.println("생성된 배열 : " + Arrays.toString(arr));
		System.out.println("최솟값 : " + miniValue(arr));
		System.out.println("최댓값 : " + maxValue(arr));
	}
}
