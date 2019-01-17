package com.bjsxt.shopping.user;

public class PasswordNotCorrectException extends RuntimeException {

	public PasswordNotCorrectException(String message) {
		super(message);
	}
	
}
