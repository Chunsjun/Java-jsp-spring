package java0622;

import java.util.Scanner;

public class Score {
	public static void main(String[] args) {

		Scanner s = new Scanner(System.in);
		System.out.print("Score : ");
		int score = s.nextInt();

		if (score >= 90) {
			System.out.println("A");
		} else if (score >= 80) {
			System.out.println("B");
		} else if (score >= 70) {
			System.out.println("C");
		} else {
			System.out.println("F");
		}
	}
}