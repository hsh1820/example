package view;

import java.util.ArrayList;
import java.util.Scanner;

import controller.EmpController;
import model.vo.EMP;

public class EmpView {
	
	// View ��ü���� �������� ���� Scanner ��ü ����
	private Scanner sc = new Scanner(System.in);
	
	// ���� �޴�
	public void mainMenu() {
		
		// Ŭ���̾�Ʈ ��û�� DAO�� �˸��� �޼ҵ�� �����ϰ�
		// DB ó�� ����� ��ȯ�޴� ������ �� controller ��ü ����
		EmpController controller = new EmpController();
		
		int select = 0; // �޴� ������ ���� ����
		
		do {
			System.out.println("========================================");
			System.out.println("[Main Menu]");
			System.out.println("1. 한글");
			System.out.println("2. ������� ��� ���� ��ȸ");
			System.out.println("3. ���ο� ��� ���� �߰�");
			System.out.println("4. ������� ��� ���� ����");
			System.out.println("5. ������� ��� ���� ����");
			System.out.println("0. ���α׷� ����");
			System.out.println("========================================");
			
			System.out.print("�޴� ���� >> ");
			select = sc.nextInt();
			sc.nextLine(); // ��ĳ�� ���ۿ� �����ִ� ���๮�� ���� 
			
			
			switch(select) {
			case 1 : controller.selectAll();break;
			case 2 : controller.selectEmp();break;
			case 3 : break;
			case 4 : break;
			case 5 : break;
			case 0 : System.out.println("���α׷��� �����մϴ�."); break;
			default : System.out.println("�߸� �Է��ϼ̽��ϴ�. �ٽ� �Է��� �ּ���.");
			}
			System.out.println();
		}while(select != 0) ;
	}
	//------------------------------------------------------------------------------------
	// sub menu
	
	// 1_15. ��ü ��� ���� ��¿� View
	public void selectAll(ArrayList<EMP> empList) {
		System.out.println("��� \t �̸� \t ��å \t ���ӻ�� \t "
	+ "����� \t �޿� \t Ŀ�̼� \t �μ���ȣ ");
		
		// ���� for������ empList ���
		for( EMP emp : empList) {
			System.out.print(emp+"\n");
		}
	}
	// 1_18. Error �޼��� ��¿� View
	public void displayError(String msg) {
		System.out.println("���� ��û ���� : " + msg);
		
	}
	
	// 2_3. ��� �Է¿� View(2,4,5 �޴��� �ʿ���)
	// ��� �Է��� �ݺ��Ǵ� ��������
	// ������ �޼ҵ�� �߻�ȭ �Ͽ� ��� -> �ڵ���� ����, ���뼺 ����
	public int selectEmpNo() {
		System.out.print("����� �Է��ϼ��� : ");
		int empNo = sc.nextInt();
		sc.nextLine();
		
		return empNo;
	}
	
	//2_16. ��� �� ���� ������ ����ϴ� View
	public void selectEMP(EMP emp) {
		System.out.println("��� : "+ emp.getEmpNo());
		System.out.println("�̸� : "+ emp.geteName());
		System.out.println("��å : "+ emp.getJob());
		System.out.println("���ӻ�� : "+ emp.getMgr());
		System.out.println("����� : "+ emp.getHireDate());
		System.out.println("�޿� : "+ emp.getSal());
		System.out.println("Ŀ�̼� : "+ emp.getComm());
		System.out.println("�μ���ȣ : "+ emp.getDepNo());
		
		
		
	}
	
	
	
}

