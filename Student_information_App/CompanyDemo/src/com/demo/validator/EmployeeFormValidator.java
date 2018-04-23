package com.demo.validator;

import com.demo.bean.EmployeeBean;

public class EmployeeFormValidator {

	public boolean validate(EmployeeBean emp){
		boolean isValid = true;
		if(null==emp.getAddress() || emp.getAddress().isEmpty()){
			isValid=false;
		}
		if(null==emp.getName() || emp.getName().isEmpty()){
			isValid=false;
		}
		if(null==emp.getEmail() || emp.getEmail().isEmpty()){
			isValid=false;
		}
		if(null==emp.getPhoneNo() || emp.getPhoneNo().isEmpty()){
			isValid=false;
		}
		
		return isValid;
		
	}
	
}
