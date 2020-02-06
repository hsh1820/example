package app.ex04.waiting;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class BoardWriteEx2 {
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "c:/dev/selenium/chromedriver.exe");
		
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://iei.or.kr/login/login.kh");

		WebElement id = driver.findElement(By.id("id"));
		WebElement pwd = driver.findElement(By.id("password"));
				 
		id.sendKeys("hsh1820");
		pwd.sendKeys("dudghk12@");
		
		
		driver.manage().timeouts().implicitlyWait(15, TimeUnit.SECONDS);
		JavascriptExecutor exe = (JavascriptExecutor)driver;
		exe.executeScript("javascript:fnLogin()");
		
		
		List<WebElement> inputSearchs =  driver.findElements
				(By.xpath("//*[@id=\"right_nav_e\"]/ul[2]/li[1]"));
		
		inputSearchs.get(0).click();
		
		List<WebElement> d =  driver.findElements
				(By.xpath("//*[@id=\"content_right\"]/div[6]/a"));
		
		d.get(0).click();
		
		WebElement areaMsg = driver.findElement(By.id("title"));
		
		areaMsg.sendKeys("집가고싶다.");
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
		
		driver.switchTo().frame("tx_canvas_wysiwyg");
		
		WebElement areaCon = driver.findElement(By.className("tx-content-container"));
		areaCon.sendKeys("잠간만요ㅕ~");
		
		driver.switchTo().parentFrame();
		
		List<WebElement> e =  driver.findElements
				(By.xpath("//*[@id=\"tx_editor_form\"]/div/a[1]"));
		
		System.out.println("검색된 클래스 개수 : " + inputSearchs.size());
		
		System.out.println(e.get(0));
		
		e.get(0).click();
		
		driver.switchTo().alert().accept();
		
//		WebElement aTag = driver.findElement(By.tagName("#head_nav_dept > ul.head_dept08 > li:nth-child(5) > a"));
		
		//aTag.click();
		
	}
}
