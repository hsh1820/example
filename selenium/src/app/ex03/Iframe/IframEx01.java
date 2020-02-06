package app.ex03.Iframe;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class IframEx01 {
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "c:/dev/selenium/chromedriver.exe");
		
		WebDriver driver = new ChromeDriver();
		
		driver.get("http://192.168.10.78:8080/selenium/exam/iframeTest.html");
		// iframe : 화면안에 또다른 html 화면을 넣는것 
		// 주로 동영상을 넣거나 화면안에서 다른 화면과 구분 짓기 위해 사용
		// 한페이지에서 보이긴 하지만 서로 다른 문서
		// selenium으로 UI 테스트시 iframe 안쪽으로 접근하기 위해서는 
		// 처리가 필요함
		
		// ** 자동화 도구의 focus를 iframe으로 변경
		driver.switchTo().frame("subIframe");
		
		WebElement inputid = driver.findElement(By.id("id"));
		WebElement inputpwd = driver.findElement(By.id("password"));
		
		inputid.sendKeys("test");
		inputpwd.sendKeys("test");
		
		// 로그인 버튼 클릭
		// 태그 선택자 이용
		
		//WebElement loginBtn = driver.findElement(By.tagName("button"));
		//loginBtn.click();
		
		// 로그인 버튼 크릭(자바 스크립트 함수 이용
		// JaaScriptEnecutor 인터페이스
		// - 셀레니움에서 자바스크립트 코드를 실행할 수 있게 해주는 역할
		// - 자바스크립터뿐만아니라 제이쿠리도 사용 가능
		
		JavascriptExecutor exe = (JavascriptExecutor)driver;
		exe.executeScript("fnLogin()");
		
		
	}
}
