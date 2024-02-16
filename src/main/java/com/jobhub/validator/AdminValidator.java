package com.jobhub.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jobhub.dto.admin.AdminRequestForm;

public class AdminValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return AdminRequestForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) { //들어온 객체, 오류메시지
		// TODO Auto-generated method stub
		AdminRequestForm employee = (AdminRequestForm)target;
		if(employee.getName().length() <2) { //2자리 수보다 작은 경우
			errors.rejectValue("name", "adminRequestName", "이름을 정확하게 입력해주세요.");
		}
		
		errors.rejectValue("birthDay", "adminRequestBirthDaySize", "생년월일은 6자리 숫자로 입력해주세요.");
		errors.rejectValue("sexCode", "adminRequestSexCode", "주민등록번호 7번째 자리 숫자를 입력해주세요.");
	}

	
	
}
