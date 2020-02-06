package app.ex04.waiting;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class BoardWriteEx1 {
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "c:/dev/selenium/chromedriver.exe");
		
		WebDriver driver = new ChromeDriver();
		
		// 1. 명시적 대기(Explicityly Wait)
		// 특정 요소가 나타날 떄 까지 지정한 최대 시간만큼 대기하는 방식
		WebDriverWait wait = new WebDriverWait(driver, 10);
		// 특
		
		driver.get("http://192.168.10.78:8080/selenium/exam/login.html");
		
		WebElement id = driver.findElement(By.id("id"));
		WebElement pwd = driver.findElement(By.id("password"));
		
		id.sendKeys("test");
		pwd.sendKeys("test");
		
		
		JavascriptExecutor exe = (JavascriptExecutor)driver;
		exe.executeScript("fnLogin()");
		
		// 웹페이지 타이틀에 "훈련생도 평가"글자가 표시될 떄 까지 명시적 대기
		wait.until(ExpectedConditions.titleContains("훈련생도 평가"));
		
		// 자동화 테스트시 오류가 안남
		
		// 자바스크립트 코드를 실행하여 게시판 페이지로 이동
		exe.executeScript("javascript:location.href='currBoard.html'");
	
		wait.until(ExpectedConditions.titleContains("우리반 게시판"));
		
		exe.executeScript("fnWriteForm()");
		
		// "게시판 글쓰기 시작 " 버튼의 클릭 시 수행되는 함수 호출
		// title이라는 ID속성을 가진 요소가 클릭될 때 까지 명시적 대기
		 wait.until(ExpectedConditions.elementToBeClickable(By.id("title")));
		 
		 WebElement inputitle = driver.findElement(By.id("title"));
		 
		 inputitle.sendKeys("글제목 - 퇴근까지 두시간 남았다");
		 
		 // iframeMsg 
		 driver.switchTo().frame("iframeMsg");
		 
		 // textarea 요소 찾기
		 WebElement areaMsg = driver.findElement(By.id("areaMsg"));
		 
		 areaMsg.sendKeys("글내용 - 이제 한시간 40분정도 남았어요~");
		 
		 // 다시 자동화 도구 focus를 부모로 이동
		 driver.switchTo().parentFrame();
		 
		 exe.executeScript("fnRegister()");
		 
		 // alert 창으로 focus 이동 후 확인 클릭
		 driver.switchTo().alert().accept();
		 
		 driver.close();
		 
		 
	}
}
