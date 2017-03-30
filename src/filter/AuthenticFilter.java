package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@WebFilter
public class AuthenticFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		String auth = (String)session.getAttribute("auth");
		System.out.println(auth);
		try{
			if(auth.equals("yes")){
				chain.doFilter(req, resp);
			} else {
				HttpServletResponse response = (HttpServletResponse) resp;
				response.sendRedirect("/error/auth");
			}
		} catch(Exception e){
			e.printStackTrace();
			HttpServletResponse response = (HttpServletResponse) resp;
			response.sendRedirect("/error/auth");
		}


	}
}
