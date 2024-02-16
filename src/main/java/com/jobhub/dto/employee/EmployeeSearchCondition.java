package com.jobhub.dto.employee;

import lombok.Data;

@Data
public class EmployeeSearchCondition {
	
	String employeeId;
	String imagePath;
	String jobsId;
	String name;
	String phone;			
	String tel;
	String birth;
	String gender;
	String address;
	String hireDate;
	String email;
	
	//관리자 가입요청
	String birthDay;
    String sexCode;
    String searchKeyword;

}
