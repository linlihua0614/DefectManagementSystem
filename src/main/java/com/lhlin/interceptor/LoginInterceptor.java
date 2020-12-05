package com.lhlin.interceptor;

import com.lhlin.entity.User;
import com.lhlin.util.Common;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2020/8/8 0008.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);

        if (loginUser != null) {
            return true;
        } else {
            ServletContext context = request.getSession().getServletContext();
//            response.sendRedirect(context.getContextPath() +LOGIN_URL);
            PrintWriter out = response.getWriter();
            out.write("<script>window.parent.location.href='"+Common.LOGIN_URL+"';</script>");
            return false;

        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
