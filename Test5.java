package java0622;

public class Test5 {
	public static void main(String[] args) {

		int data = 2200;
		int count = 0;
		int date = 0;

		for (; data >= 100;) {
			data = data - 100;
			count += 1;
			date += 1;

			if (count == 10) {
				System.out.println("저희 데이터를 사용해 주셔서 감사합니다!!\n(+500)");

				count = 0;
				data += 500;
			}

			System.out.println(date + "일차 " + data + " data");
		}
	}
}
