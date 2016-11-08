package java0622;

public class Movie {
	public static void main(String[] args) {
		String a = "중식";

		if (a == "한식") {
			System.out.println("국밥 고고싱?");
		} else if (a == "중식") {
			System.out.println("짜장면 고고싱?");
		} else if (a == "양식") {
			System.out.println("스테이크 고고싱?");
		} else if (a == "일식") {
			System.out.println("초밥 고고싱?");
		} else
			System.out.println("그냥 굶어!");
	}
}