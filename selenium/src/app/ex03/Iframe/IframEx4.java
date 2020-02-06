package app.ex03.Iframe;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class IframEx4 {
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "c:/dev/selenium/chromedriver.exe");
		
		WebDriver driver = new ChromeDriver();
		
		driver.get("http://192.168.10.78:8080/selenium/exam/iframeTest2.html");
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
		
		JavascriptExecutor exe = (JavascriptExecutor)driver;
		exe.executeScript("fnLogin()");
		
		// ************************************************
		// alert(경고창)이 실행 되었을 때 
		// alert창의 확인 버튼 클릭하기
		driver.switchTo().alert().accept();
		
		
		
		// 자동화 도구의 focus를 부모 프레임으로 다시 변경
		driver.switchTo().parentFrame();
		
		// 태그 선택자를 잉요하여 p태그 요소를 찾음
		WebElement pTag = driver.findElement(By.tagName("p"));
		// p태그가 여러개면 xpath로 찾기
		
		// 찾은 p태그의 내용을 읽어오기
		System.out.println(pTag.getText());
		
	}
}
