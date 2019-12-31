package com.kh.variable;

import java.util.Scanner;

public class F_Print {
	
	public void printMethod() {
	
		// A (줄바꿈)
		System.out.println("A");
		
		System.out.printf("%c\n",'A'); 
		// (err)%c의 형식이 char이기 때문에 ""값 넣을 수 없음 
						// 출력 형식, 변수 or 값
		// %c : 문자 하나를 나타내는 형식
		// \n (이스케이프 문자) : 줄바꿈(New Line 약자)
	
		// A B (줄바꿈)
		System.out.println("A B");
		System.out.printf("%c %c\n", 'A','B');
		//System.out.printf("%c", '');
		
		System.out.printf("%s\n", "A B");		
		// %s : 문자열을 나타내는 형식

		int iNum1 = 100;
		
		//100(줄바꿈)
		System.out.println(iNum1);
		
		System.out.printf("%d\n", iNum1);
		// %d : 10진수 정수 형식
		
		double dNum = 1.123456;
		
		// 1.123456(줄바꿈)
		System.out.println(dNum);
		
		System.out.printf("%.15f\n",dNum);
		
		// 1.12(줄바꿈) (단, dNum 사용)
		System.out.printf("%.2f\n", dNum);
		System.out.println((int)(dNum * 100) / 100.0);
		// %f : 10진수 실수 형식 
		// %.2f : 소수점 아래 2째 자리 까지 표현
		//			--> 소수점 아래 3째자리에서 반올림
		
		
		
		// 
		Scanner sc = new Scanner (System.in);
		
		// 10칸을 주고 정수를 입력받아 오른쪽 정렬하여 출력
		System.out.print("정수입력(10자리까지) : ");
		
		int input = sc.nextInt();
		
		System.out.printf("%10o\n", input);
		// %10d : 10칸의 정수형 공간, 오른쪽 정렬 출력
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
