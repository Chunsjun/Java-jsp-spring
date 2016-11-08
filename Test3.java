package java0622;

public class Test3 {
	public static void main(String[] args) {
		int account = 12350;
		int count = 0;

		System.out.println("현재 카드에 " + account + "원 있습니다.");

		for (; account >= 800;) {
			if (account >= 800) {
				account -= 800;
				count += 1;
			}
		}

		System.out.println("버스를 " + count + "번 탔습니다.");
		System.out.println("잔액이 " + account + "원 남았습니다.");
	}
}