package com.cdac.employee.validator;
//import java.util.regex.Pattern;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
//import org.springframework.validation.Validator;
import org.springframework.validation.Validator;

import com.cdac.employee.bean.*;


@Component
public class EmployeeValidator implements Validator{
	
	public boolean supports(Class<?> clazz)
	{
		return Employee.class.equals(clazz);
	}

	
	public void validate(Object obj, Errors err)
	{

		ValidationUtils.rejectIfEmpty(err, "name", "emp.name.empty");
		ValidationUtils.rejectIfEmpty(err, "email", "emp.email.empty");
		ValidationUtils.rejectIfEmpty(err, "dob", "emp.dob.empty");
		ValidationUtils.rejectIfEmpty(err, "gender", "emp.gender.empty");
		ValidationUtils.rejectIfEmpty(err, "technology", "emp.technology.empty");
		ValidationUtils.rejectIfEmpty(err, "job_profile", "emp.job_profile.empty");
		
		Employee emp = (Employee) obj;
		Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
				Pattern.CASE_INSENSITIVE);
		if (!(pattern.matcher(emp.getEmail()).matches())) 
		{
			err.rejectValue("email", "emp.email.invalid");
		}
	}
}
