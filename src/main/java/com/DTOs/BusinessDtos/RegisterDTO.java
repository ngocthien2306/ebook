package com.DTOs.BusinessDtos;

public class RegisterDTO {
	String usersname;
	String password;
	String reEnter;
	String code;
	String email;
	String errorMessage;
	String role;

	public String getUsersname() {
		return usersname;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getUsername() {
		return usersname;
	}

	public void setUsername(String usersname) {
		this.usersname = usersname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getReEnter() {
		return reEnter;
	}

	public void setReEnter(String reEnter) {
		this.reEnter = reEnter;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
