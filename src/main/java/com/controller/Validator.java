package com.controller;

import com.model.MySql;

public class Validator {
public boolean isValid(String email,String password) {
	MySql md=new MySql();
	String datapass=md.login(email);
	if(password.equals(datapass)) {
		return true;
	}
	else {
		return false;
	}
	
}
}
