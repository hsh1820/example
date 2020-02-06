package app.ex02.google;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Exam02_CssSelector {
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver",
				"C:/dev/selenium/chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.google.com");
		
		// 4. 검색창 찾기(XPath 이용)
		// XPath란?
		// XML 문서의 특정 요소나 속성에 접근하기 위한 경로
		// <>
		List<WebElement> inputSearchs =  driver.findElements
				(By.xpath("//*[@id=\"tsf\"]/div[2]/div[1]/div[1]/div/div[2]/input"));
		
		// 검색된 요소의 개수 확인
		System.out.println("검색된 클래스 개수 : " + inputSearchs.size());
		
		
		// 요소가 1개만 있는 경우  (1)
		//WebElement inputSearch = driver.findElement(By.className("glFyf"));
		
		// List에 저장된 요소중 첫 번째 요소 접근 (2) 
		// + 6. 검색어 입력
		inputSearchs.get(0).sendKeys("종각역 점심");
		
		// 7. submit()을 이용해 검색어 제출
		inputSearchs.get(0).submit();
		
		
	}
}
