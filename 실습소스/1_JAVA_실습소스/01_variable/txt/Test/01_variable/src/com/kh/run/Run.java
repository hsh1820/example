package com.kh.run;

import com.kh.variable.D_Cast;

public class Run {
	
	public static void main(String[] args) { //아무 기능 없어야함, 호출 only
		
		// 다른 클래스에 작성되어있는 메서드 실행(호출)
		
		//		A_Variable var = new A_Variable(); //클래스 생성
		//		
		//		// 메서드 호출
		//		var.noVariable(); 			
		//		var.usingVariable(); 
		//		var.declareVariable();

		//		B_KeyboardInput ki = new B_KeyboardInput();
		
		//		ki.inputScanner1(); 
		//		ki.inputScanner2();
		
		//import 자동 추가 ( 이클립스 기능 )
		// -> ctrl + shift + o ( 영어 o )
		//		C_Constant cs = new C_Constant();
		//		
		//		cs.finalKeyword();
		
		D_Cast cast = new D_Cast();
		cast.rule1();
	}
}
