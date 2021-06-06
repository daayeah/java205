package ex.array;

import java.util.Arrays;

public class ex02 {
	public static void addOneDArr(int[] arr, int add) {
		for (int i = 0; i < arr.length; i++) {
			arr[i] += add;
		}
	}

	public static void addTwoDArr(int[][] arr, int add) {
		for (int i = 0; i < arr.length; i++) {
			addOneDArr(arr[i], add);
		}
	}

	public static void main(String[] args) {
		int[][] arr = { { 10, 15, 20, 25 }, { 30, 35, 40, 45 }, { 50, 55, 60, 65 } };

		System.out.println(Arrays.deepToString(arr));
		System.out.println();

		addTwoDArr(arr, 5);

		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j] + "  ");
			}
			System.out.println();
		}
	}
}
