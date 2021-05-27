package ex_Array;

public class ex03 {	public static int[][] shiftArr(int[][] arr){
		for(int i = arr.length - 1; i > 0; i--) {
			int[] temp = arr[i];
			arr[i] = arr[i - 1];
			arr[i - 1] = temp;
		}
		return arr;
	}

	public static void main(String[] args) {
		int[][] arr = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

		for(int[] e : arr) {
			for(int f : e) {
				System.out.print(f + "  ");
			}
			System.out.println();
		}
		
		shiftArr(arr);

		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j] + "  ");
			}
			System.out.println();
		}
	}
}
