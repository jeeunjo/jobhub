package com.jobhub.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobhub.dto.admin.Admin;
import com.jobhub.dto.employee.Employee;
import com.jobhub.dto.employee.EmployeeSearchCondition;
import com.jobhub.service.admin.AdminService;

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
	 public String processJoinApproval(@ModelAttribute Employee employee, Model model) {
        // 가입된 관리자인지 확인
        if (adminService.isExistingAdmin(employee)) {
            model.addAttribute("error", "이미 생성된 계정이 있습니다.");
        } else {
        	
        	if(adminService.isAlreadyRequest(employee)) {
        		model.addAttribute("error", "이미 요청 완료되었습니다.");
        	} else {
        		// 직원 정보와 입력 정보 일치 여부 확인
        		if (adminService.isMatchingEmployeeInfo(employee)) {
        			// 가입 요청 처리
        			adminService.saveJoinRequest(employee);
        			model.addAttribute("success", "가입 요청 완료되었습니다. 계정 생성 후 사내 메일로 안내될 예정입니다.");
        		} else {
        			model.addAttribute("error", "Jobhub 관리자 사이트는 Jobhub 직원만 이용이 가능합니다.");
        		}
        	}
        }
        return "admin/joinApproval";
    }	
}
