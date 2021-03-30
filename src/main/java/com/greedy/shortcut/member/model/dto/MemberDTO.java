package com.greedy.shortcut.member.model.dto;

public class MemberDTO {
	
	private int no;
	private String email;
	private String password;
	private String phone;
	private String name;
	
	public MemberDTO() {}

	public MemberDTO(int no, String email, String password, String phone, String name) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.name = name;
	}

	public int getNo() {
		return no;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getPhone() {
		return phone;
	}

	public String getName() {
		return name;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", email=" + email + ", password=" + password + ", phone=" + phone + ", name="
				+ name + "]";
	}

	
	
}
