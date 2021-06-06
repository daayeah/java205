package ex.io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class BufferFileCopy {
	public static void main(String[] args) {
		try {
			InputStream in = new FileInputStream("origin.pdf");
			OutputStream out = new FileOutputStream("copy2.pdf");

			int copyByte = 0;
			byte[] buf = new byte[1024]; // 1kb 사이즈의 배열
			// 읽어온 데이터 배열의 개수
			int readLen = 0;

			while (true) {
				readLen = in.read(buf);

				if (readLen == -1) {
					break;
				}
				out.write(buf, 0, readLen);
				copyByte += readLen;
			}
			in.close();
			out.close();

			System.out.println("복사 완료. 복사된 바이트 사이즈 : " + copyByte + "byte");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
