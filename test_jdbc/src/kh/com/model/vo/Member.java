package kh.com.model.vo;

import java.sql.Date;

public class Member {
	private String memberID;
	private String memberPwd; 
	private String memberName;
	private char Gender;
	private String Email;
	private String Phone;
	private String Address;
	private int Age;
	private Date EnrollDate;
	
	public Member() {
		
	}

	public Member(String memberID, String memberPwd, String memberName, char Gender, String email, String phone,
			String address, int age, Date enrollDate) {
		this(memberID, memberPwd, memberName, Gender, email, phone, address,age);
		this.EnrollDate = enrollDate;
	}

	public Member(String memberId2, String memberPwd2, String memberName2, char gender2, String email2, String phone2,
			String address2, int age2) {
		// TODO Auto-generated constructor stub
		this.memberID = memberId2;
		this.memberPwd = memberPwd2;
		this.memberName = memberName2;
		this.Gender = gender2;
		this.Email = email2;
		this.Phone = phone2;
		this.Address = address2;
		this.Age = age2;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public char getGender() {
		return Gender;
	}

	public void setGender(char gender) {
		Gender = gender;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public int getAge() {
		return Age;
	}

	public void setAge(int age) {
		Age = age;
	}

	public Date getEnrollDate() {
		return EnrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		EnrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberID=" + memberID + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", Gender="
				+ Gender + ", Email=" + Email + ", Phone=" + Phone + ", Address=" + Address + ", Age=" + Age
				+ ", EnrollDate=" + EnrollDate + "]";
	}
	
}
