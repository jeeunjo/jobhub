package com.jobhub.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobhub.dto.admin.AdminRequest;
import com.jobhub.service.admin.AdminService;
import com.jobhub.validator.AdminValidator;

@Controller
@RequestMapping("/admin")
public class AdminApprovalController {

	@Autowired
	AdminService adminService;
	
	
	// 관리자 승인 요청 페이지
	@GetMapping("/joinApproval")
	public String joinApproval() {
		return "admin/joinApproval";
	}
	
	@PostMapping("/joinApproval")
    public String processJoinApproval(@Valid @ModelAttribute AdminRequest adminRequest, Model model, BindingResult br) {
		
		//서버에서 검증
		//유효한가
		//AdminValidator.validate(employee,br);
		
		if(br.hasErrors()) {//br 안에 에러 항목이 있는지
			List<ObjectError> errorList = br.getAllErrors();
			for(ObjectError er : errorList) {
				 model.addAttribute("error", er.getDefaultMessage());
			}
			
			return "admin/joinApproval";
		}
		
		
		
		
        // 1) 이미 가입된 관리자인지 확인
        if (adminService.isExistingAdmin(adminRequest)) {
            model.addAttribute("error", "이미 생성된 계정이 있습니다.");
        } else {
            // 2) 가입된 관리자가 아니라면 직원 정보와 입력한 정보 확인
            if (adminService.isMatchingEmployeeInfo(adminRequest)) {
                if (adminService.isAlreadyRequest(adminRequest)) {
                    model.addAttribute("error", "이미 요청 완료되었습니다.");
                } else {
                    adminService.saveJoinRequest(adminRequest);
                    model.addAttribute("success", "가입 요청 완료되었습니다. 계정 생성 후 사내 메일로 안내될 예정입니다.");
                }
            } else {
                model.addAttribute("error", "Jobhub 관리자 사이트는 Jobhub 직원만 이용이 가능합니다.");
            }
        }
        return "admin/joinApproval";
    }	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		AdminValidator validator = new AdminValidator();
		binder.setValidator(validator);
	}
}
