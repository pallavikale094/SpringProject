package com.cdac.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.employee.bean.Employee;
import com.cdac.employee.dao.IEmployeeDao;

@Service
public class EmployeeServiceImpl implements IEmployeeService{

	@Autowired
	private IEmployeeDao employeeDao;
	@Override
	public int save(Employee e) {
		// TODO Auto-generated method stub
		return employeeDao.save(e);
				
	}
	@Override
	public List<Employee> getEmployees() {
		// TODO Auto-generated method stub
		return employeeDao.getEmployees();
	}
	@Override
	public int update(Employee employee) {
		// TODO Auto-generated method stub
		return employeeDao.update(employee);
	}
	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return employeeDao.delete(id);
	}
	@Override
	public Employee getEmployeeById(int id) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeeById(id);
	}
	@Override
	public String uploadFile() {
		// TODO Auto-generated method stub
		return employeeDao.uploadFile();
	}
	public List<Employee> getFile()
	{
		return employeeDao.getFile();
	}

}
