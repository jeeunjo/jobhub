package com.jobhub.dao.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jobhub.dao.admin.AdminDAO;
import com.jobhub.dto.admin.Admin;
import com.jobhub.dto.admin.AdminProfile;
import com.jobhub.dto.admin.AdminSearchCondition;
import com.jobhub.dto.employee.Employee;
import com.jobhub.dto.employee.EmployeeProfile;
import com.jobhub.dto.employee.EmployeeSearchCondition;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public Admin findLoginAdmin(Admin admin) {
		System.out.println("AdimDao findLoginAdmin 메소드 호출");
		
		Admin loginAdmin = sqlSessionTemplate.selectOne("admin_mapper.findLoginAdmin", admin);
		return loginAdmin;
		
	}

	@Override
	public int saveAdmin(Admin admin) {
		//DB에 Admin 저장
		int result = sqlSessionTemplate.insert("admin_mapper.saveAdmin", admin);
		return result;
	}
	
	@Override
	public int saveAdminProfile(AdminProfile adminProfile) {
		//DB에 Admin 저장
		int result = sqlSessionTemplate.insert("admin_mapper.saveAdmin", adminProfile);
		return result;
	}

	@Override
	public List<Admin> findAdminList() {
		List<Admin> adminList = sqlSessionTemplate.selectList("admin_mapper.findAdminList");
		return adminList;
	}

	@Override
	public Admin findAdminByAdminId(String id) {
		Admin admin = sqlSessionTemplate.selectOne("admin_mapper.findAdminByAdminId", id);
		return admin;
	}

	@Override
	public List<Admin> findAdminListBySearchCondition(AdminSearchCondition adminSearchCondition) {
	    List<Admin> adminList = sqlSessionTemplate.selectList("admin_mapper.findAdminListBySearchCondition", adminSearchCondition);
	    return adminList;
	}

	
	//permissionCode로 조회
	@Override
	public List<Admin> findAdminListByPermissionCode(String permissionCode) {
		List<Admin> adminList = sqlSessionTemplate.selectList("admin_mapper.findAdminListByPermissionCode", permissionCode);
		return adminList;
	}
	
	@Override
	public int saveEmployeeProfile(EmployeeProfile employeeProfile) {
		int result = sqlSessionTemplate.insert("admin_mapper.saveEmployeeProfile", employeeProfile);
		return result;
	}

	@Override
	public List<EmployeeProfile> findEmployeeProfileByName(String name) {
	    List<EmployeeProfile> employeeProfileList = sqlSessionTemplate.selectList("admin_mapper.findEmployeeProfileByName", name);
	    return employeeProfileList;
	}

	@Override
	public List<Employee> findEmployeeList() {
		List<Employee> employeeList = sqlSessionTemplate.selectList("admin_mapper.findEmployeeList");
		return employeeList;
	}

	@Override
	public List<Employee> findEmployeeListByJobsId(String jobsId) {
		List<Employee> employeeList = sqlSessionTemplate.selectList("admin_mapper.findEmployeeListByJobsId", jobsId);
		return employeeList;
	}

	@Override
	public List<Employee> findEmployeeListBySearchCondition(EmployeeSearchCondition employeeSearchCondition) {
		List<Employee> employeeList = sqlSessionTemplate.selectList("admin_mapper.findEmployeeListBySearchCondition");
		return employeeList;
	}

	@Override
	public int saveJoinRequest(Employee employee) {
		int result = sqlSessionTemplate.insert("admin_mapper.saveJoinRequest", employee);
		return result;
	}

	@Override
	public Admin findAdminByEmployee(Employee employee) {
		Admin loginAdmin = sqlSessionTemplate.selectOne("admin_mapper.findAdminByEmployee", employee);
		return loginAdmin;
	}

	@Override
	public List<Employee> findEmployeeListByRequest(Employee employee) {
		List<Employee> employeeList = sqlSessionTemplate.selectList("admin_mapper.findEmployeeListByRequest", employee);
		return employeeList;
	}

	@Override
	public List<Employee> findAlreadyRequest(Employee employee) {
		List<Employee> adminRequestList = sqlSessionTemplate.selectList("admin_mapper.findAlreadyRequest", employee);
		return adminRequestList;
	}
	
	
	
}
