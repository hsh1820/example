package com.kh.variable;

public class E_OverFlow {
	
		// 오버플로우 확인하기
		public void overflow() {
			
			// 오버플로우는 대입연산자 이외에 상황에서 발생 가능. == 산술연산시
			// 대입연산자 이외의 상황에서 오버플로우 발생 테스트
			byte bNum = 127; // byte의 최대값
			// byte bNum + 128; => byte + int -> 타입미스매치 오버플로우 X
			
			System.out.println("연산 전 : " + bNum );
			
			//bNum =  bNum + 1  ;  
			//( err ) Type mismatch: cannot convert from int to byte
			
			
			bNum = (byte)( bNum + 1 ) ;	
			
			System.out.println( "연산 후 : " + bNum );
			
			byte bNum2 = 127;
			int result = bNum2 + 1;// int + int
			
			System.out.println( "result : " + result );
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
}
