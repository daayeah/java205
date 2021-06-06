package ex.io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class ByteBufferedFileCopy {
	public static void main(String[] args) {
		try {
			// 필터 스트림 생성 -> 기본 스트림 필요
			InputStream in = new FileInputStream("origin.pdf");
			OutputStream out = new FileOutputStream("copy3.pdf");
			// 필터 스트림
			BufferedInputStream fin = new BufferedInputStream(in);
			BufferedOutputStream fout = new BufferedOutputStream(out);

			int copyByte = 0;
			int bData = -1;

			while (true) { // 필터 스트림 사용
				bData = fin.read();

				if (bData == -1) {
					break;
				}
				fout.write(bData);
				copyByte++;
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
