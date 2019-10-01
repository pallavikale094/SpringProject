package com.cdac.employee.bean;

public class Employee {
	private int id;
      private String name;
      private String dob;
      private String email;
      private String gender;
      private String job_profile;
      private String technology[];
      
      
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJob_profile() {
		return job_profile;
	}
	public void setJob_profile(String job_profile) {
		this.job_profile = job_profile;
	}
	public String[] getTechnology() {
		return technology;
	}
	public void setTechnology(String[] technology) {
		this.technology = technology;
	}
	
	
	
      
}
