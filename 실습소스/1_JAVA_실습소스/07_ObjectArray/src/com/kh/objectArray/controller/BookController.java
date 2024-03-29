package com.kh.objectArray.controller;

import java.util.Scanner;

import com.kh.objectArray.model.vo.Book;

public class BookController {
	public void method1() {
		// Book 객체 3개를 만들어
		// 각각의 값을 알맞게 초기화를 한 후
		// 책 제목을 입력 받아
		// 해당 책이 있으면 책 정보 출력
		// 없으면 "해당하는 책이 없습니다." 출력
		
		// 크기가 3인 Book 배열을 선언 및 할당
		Book[] books = new Book[3];
		Scanner sc = new Scanner(System.in);

		// Book 배열의 각 요소 초기화
		books[0] = new Book("자바의정석", "남궁성", "도우출판",30000);
		books[1] = new Book("C언어의 정석", "조미현", "KH출판", 60000);
		books[2] = new Book("왜저러지", "김지원", "KH출판", 15000);
				
		// Book 배열에 저장된 모든 책의 정보 출력
		//		System.out.println(books[0].inform());
		//		System.out.println(books[1].inform());
		//		System.out.println(books[2].inform());
		
		for(int i =0 ; i < books.length;i++) {
			// books 의 i 번째 인덱스 요소가 가지고 있는 
			// inform() 이라는 메소드를 이용하여
			// 해당 객체의 정보를 출력
			System.out.println(books[i].inform());
		}
		
		System.out.print("검색할 책 제목 : ");
		String title = sc.nextLine();
		
		boolean flag = true;
		//		입력받은 값 검색
		for(int i =0;i<books.length;i++) {
			// books의 i 번째 요소의 title 값이 
			// 입력받은 title과 같은 경우
			if(books[i].getTitle().equals(title)) {
				// books 의 i 번째 요소의 정보 출력
				System.out.println(books[i].inform());	
				flag = false;
				break;
			}
		}
		if (flag) {
			System.out.println("해당하는 책이 없습니다.");
		}
		
		
		
		
	}
}
