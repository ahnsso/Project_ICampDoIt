package com.exam.login;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SignUpTO {
	private String name;
	private String id;
	private String pwd;
	private String birth;
	private String email;
	private String hint;
	private String answer;
	private String gen;
}
