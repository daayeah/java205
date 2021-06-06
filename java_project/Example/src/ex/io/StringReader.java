package ex.io;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class StringReader {
	public static void main(String[] args) {
		try {
			BufferedReader in = new BufferedReader(new FileReader("String.txt"));
			// BufferedReader in = new BufferedReader(new FileReader("String.html"));

			// 임시 변수
			String str = null;

			while (true) {
				str = in.readLine();

				if (str == null) {
					break;
				}
				System.out.println(str);
			}
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
