package com.DTOs.admin;

public class AdminCreateDTO {
	String usersname;
	String password;
	String reEnter;
	String firstName;
	String lastName;
	int typeID;
	
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
	public int getTypeID() {
		return typeID;
	}
	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
}
