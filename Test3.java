package java0622;

public class Test3 {
	public static void main(String[] args) {
		int account = 12350;
		int count = 0;

		System.out.println("���� ī�忡 " + account + "�� �ֽ��ϴ�.");

		for (; account >= 800;) {
			if (account >= 800) {
				account -= 800;
				count += 1;
			}
		}

		System.out.println("������ " + count + "�� �����ϴ�.");
		System.out.println("�ܾ��� " + account + "�� ���ҽ��ϴ�.");
	}
}