package com.greedy.shortcut.member.model.dto;

public class MemberDTO {
	
	private Integer no;
	private String email;
	private String password;
	private String phone;
	private String name;
	private String email_approval_status;
	private String email_approval_key;
	
	public MemberDTO() {}

	public MemberDTO(Integer no, String email, String password, String phone, String name, String email_approval_status,
			String email_approval_key) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.name = name;
		this.email_approval_status = email_approval_status;
		this.email_approval_key = email_approval_key;
	}

	public Integer getNo() {
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

	public String getEmail_approval_status() {
		return email_approval_status;
	}

	public String getEmail_approval_key() {
		return email_approval_key;
	}

	public void setNo(Integer no) {
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

	public void setEmail_approval_status(String email_approval_status) {
		this.email_approval_status = email_approval_status;
	}

	public void setEmail_approval_key(String email_approval_key) {
		this.email_approval_key = email_approval_key;
	}

	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", email=" + email + ", password=" + password + ", phone=" + phone + ", name="
				+ name + ", email_approval_status=" + email_approval_status + ", email_approval_key="
				+ email_approval_key + "]";
	}

	
}
