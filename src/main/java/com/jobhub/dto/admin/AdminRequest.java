package com.jobhub.dto.admin;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class AdminRequest {
// 관리자 가입 요청
	
	@NotBlank(message = "이름을 정확하게 입력해주세요.")
	String name;
	
	@Size(min = 6, max = 6, message = "생년월일은 6자리 숫자로 입력해주세요.")
	String birthDay;
	
	@Size(min = 1, max = 1, message = "주민등록번호 7번째 자리 숫자를 입력해주세요.")
	String sexCode;
	
}
