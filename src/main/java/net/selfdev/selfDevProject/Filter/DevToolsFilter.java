package net.selfdev.selfDevProject.Filter;

import java.io.IOException;

import org.springframework.stereotype.Component;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 20250731 csh 
 * Chrome DevTools 동작으로 인해 .well-known/appspecific/con.chrome.devtools.json 요청이 계속 들어와 Error Log가 남아
 * URI에 devtools가 포함될 경우 200 응답을 보내는 Filter 
 */
@Component	//Bean을 따로 등록하지 않고 사용할 수 있도록 함.
public class DevToolsFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String uri = req.getRequestURI();
		if (uri.contains("devtools")) {
			res.setStatus(HttpServletResponse.SC_OK);	// devtools 포함된 경우 200 응답.
			return;
		}
		
		chain.doFilter(request, response);	// 이외의 요청의 경우 정상적으로 처리함.
	}
}
