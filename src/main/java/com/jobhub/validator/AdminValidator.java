package com.jobhub.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jobhub.dto.admin.AdminRequest;

public class AdminValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return AdminRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) { //들어온 객체, 오류메시지
		// TODO Auto-generated method stub
		AdminRequest adminRequest = (AdminRequest)target;
		if(adminRequest.getName().length() <2) { //2자리 수보다 작은 경우
			errors.rejectValue("name", "adminRequestName", "이름을 정확하게 입력해주세요.");
		}
		
		if (adminRequest.getBirthDay().length() != 6) {
            errors.rejectValue("birthDay", "adminRequest.birthDay.length", "생년월일은 6자리 숫자로 입력해주세요.");
        }
		
		if (!adminRequest.getSexCode().matches("[1-4]")) {
            errors.rejectValue("sexCode", "adminRequest.sexCode.pattern", "주민등록번호 7번째 자리 숫자를 입력해주세요.");
        }
	}

	
	
}
