package com.jobhub.dto.admin;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class AdminRequestForm {
	
	@NotNull
	String name;
	
	@Size(min = 6, max = 6)
	String birthDay;
	
	@NotNull
	@Size(max=1)
	String sexCode;
	
//	String employeeId;
//	String imagePath;
//	String jobsId;
//	String phone;			
//	String tel;
//	String birth;
//	String address;
//	String hireDate;
//	String email;
//	String jobsName;
	
}
