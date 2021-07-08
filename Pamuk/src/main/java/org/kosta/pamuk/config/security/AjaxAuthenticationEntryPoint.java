package org.kosta.pamuk.config.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

public class AjaxAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint{
	public AjaxAuthenticationEntryPoint(String loginFormUrl) {
		super(loginFormUrl);
	}
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
		String ajaxHeader = ((HttpServletRequest)request).getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);
		if(isAjax) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Ajax Request UnAuthorized (Session Expired)");
			//Status code (401) indicating that the request requires HTTPauthentication.Value:
		} else {
			super.commence(request, response, authException);
		}
	}
}
