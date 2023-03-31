package com.liolik.project.dto;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class EmployeeDto implements UserDetails {
	
	private String ECODE;
	private String ENAME;
	private String ERANK;
	private String ETEAM;
	private String PW; // 직원 로그인 기능 추가용 
	private String PRIKEY;
	private boolean enabled;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(this.ERANK));
		return auth;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return PW;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return ECODE;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return enabled;
	}
}
