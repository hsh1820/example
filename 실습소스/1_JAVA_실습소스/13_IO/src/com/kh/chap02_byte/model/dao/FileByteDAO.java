package com.kh.chap02_byte.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileByteDAO {
	//DAO (date access object)
	// -> DBMS에 접속하여 실제 데이터를 전송하거나
	// 	결과 값을 전달 받는데 사용되는 클래스
	// --> 데이터 input / output 시 사용하는 클래스
	
	// 바이트 기반 스트림 
	// : 1byte 단위로 데이터를 입력/출력하는 스트림
	
	// FileInputStream : 바이트 기반 파일 입력 스트림
	// -> 프로그램 외부 파일을 바이트 단위로 읽어들일 경우 사용
	public void fileOpen() {
		
		FileInputStream fis = null;
		// FileInputStream 객체 생성시
		// 바로 파일과 직접 연결이 됨.
		// 외부에 있는 데이터를 읽어올 수 있는 형태가 됨
		// 만약 파일이 없다면 FileNotFoundException 발생
		try {
			fis = new FileInputStream("a_byte.txt");
			// 현재 프로그램에 
			// 외부 에 있는 a_byte.txt 파일의 데이터를 읽어올
			// FileInputStream 객체 생성(연결만 되어있는 상태)
		
			// InputStream.read()
			// 파일의 데이터를 1바이트 읽어와서 반환
			// 만약 더이상 읽어올 데이터가 없으면 -1 반환
			// 데이터단위의 바이트 크기는 음수가 없음
			// 1byte = 0~255
			
			
//			System.out.println((char)fis.read());
//			System.out.println((char)fis.read());
//			System.out.println((char)fis.read());
//			System.out.println((char)fis.read());
//			System.out.println((char)fis.read());
			// byte 로 읽어와서 int로 반환
			// read() 메소드의 반환형은 int로 
			// 실제 저장된 값과 다르게 표시됨 
			// --> char 형태로 형변환 해주면 해결됨
			
			//while 문을 이용하여 
			// read() 반환 값이 -1인 경우 까지 게속 읽어오기
			// --> file의 모든 내용을 읽어올 수 있음

			// read()로 읽어온 값을 임시 저장할 변수 value 선언
			int value = 0;
			
			while((value=fis.read()) != -1) {
				System.out.print((char)value);
			}
			// 한글이 깨지는 이유
			// - 한글은 2byte(유니코드)로 
			// 2byte가 한 번에 해석되어야 한글로 인식됨 
			// - 바이트 기반 스트림은 1바이트 단위로 입출력을 하기 때문에
			// 	 2byte 한글 데이터에 손상이 발생됨.
			
		}catch(FileNotFoundException e) {
			System.out.println("파일이 존재하지않음");
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			// 사용한 스트림 자원 반환
			try {
				if(fis != null) {
					// fis 객체가 없는 경우에는 nullpointexception 발생
					fis.close();
					}
				}catch(IOException e) {
					e.printStackTrace();
			}
		}
		
	}
	// 프로그램 --> 파일(출력)
	public void fileSave() {
		FileOutputStream fos = null;
		
		try {
			fos = new FileOutputStream("a_byte2.txt", true);
			// 내보낼 파일 위치 지정
			// 파일이 존재하지 않는 경우 자동으로 생성
			
			// 파일이 존재하는 경우 기존파일을 덮어씀

			// * 덮어쓰지 않고 이어쓰기 하는 방법
			// -> FileOutputStream 객체 생성 시
			// 		매개변수 마지막에 true를 추가
			
			// FileOutputStream.write()
			// 프로그램에서 1바이트씩 외부로 출력
			// -> IOExcetpion 발생시킬 가능성이 있음
			
			
			fos.write(97);
			// 정수로 값을 출력해도 
			// 해당 번호와 일치하는 아스키코드(1바이트)표의 문자가 출력됨
			// 유니코드는 2바이트 단위이며 아스키코드 확장판
			fos.write('백');
			
			// 줄바꿈 문자 출력
			fos.write('\n');
			
			// Hellow World!! 한 번에 출력하기
			// 바이트 배열은 사용하지 않음
			String str = "Hellow world!";
			
			for(int i=0; i<str.length() ;i++ ) {
				fos.write(str.charAt(i));
			}
			
		}catch(FileNotFoundException e) {
			System.out.println("파일이 존재하지 않음");
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fos != null) {
					fos.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}
}
