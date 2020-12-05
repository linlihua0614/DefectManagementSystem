package com.lhlin.controller;

import com.lhlin.entity.User;
import com.lhlin.service.UserService;
import com.lhlin.util.Common;
import com.lhlin.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String userName,String passWord,Model model,HttpServletRequest request,HttpSession session){
        if(StringUtils.isEmpty(userName)
                || StringUtils.isEmpty(passWord)){
            request.setAttribute("loginFailCode","1");
            return "login";
        }
        User loginUser = userService.getUserByUserName(userName);
        if(loginUser==null
                ||StringUtils.isEmpty(loginUser.getUserName())
                ||StringUtils.isEmpty(loginUser.getPassWord())
                ||loginUser.getUseAble()==0){
            request.setAttribute("loginFailCode","2");
            return "login";
        }

        if(!passWord.equals(loginUser.getPassWord())){
            request.setAttribute("loginFailCode","3");
            return "login";
        }

        request.removeAttribute("loginFailCode");
        session.setAttribute(Common.USER_SESSION,loginUser);

        return "index";
    }
    @RequestMapping(value = "/logout")
    public void logout(HttpSession session,HttpServletResponse response){
        session.invalidate();
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.write("<script>window.parent.location.href='"+Common.LOGIN_URL+"';</script>");
    }

    @RequestMapping(value = "/resetPwd",method=RequestMethod.POST)
    public String resetPwd(String oldPwd,String newPwd,String newPwd1,HttpServletRequest request,HttpSession session){
        User loginUser = (User)session.getAttribute(Common.USER_SESSION);
        if(loginUser==null
                ||StringUtils.isEmpty(loginUser.getUserName())
                ||StringUtils.isEmpty(loginUser.getPassWord())){
            return "login";
        }
        if(!loginUser.getPassWord().equals(oldPwd)){
            request.setAttribute("resetFail",1);
            return "resetPwd";
        }
        if(!newPwd.equals(newPwd1)){
            request.setAttribute("resetFail",2);
            return "resetPwd";
        }

        loginUser.setPassWord(newPwd);
        userService.update(loginUser);

        session.invalidate();
        request.setAttribute("resetFail",0);
        return "resetPwd";
    }

    @RequestMapping(value="/list")
    public String list(String userName,Integer role,Integer useAble,HttpServletRequest request) {
        Map<String,Object> map = new HashMap<String,Object>();
        int pageNum = StringUtils.isEmpty(request.getParameter("pageNum"))?1:Integer.valueOf(request.getParameter("pageNum"));
        int pageSize = 10;
        map.put("userName", userName);
        map.put("role",role);
        map.put("useAble",useAble);
        map.put("pageNum",pageNum);
        map.put("pageSize",pageSize);
        Page<User> page = userService.getUsers(map);
        request.setAttribute("page", page);
        request.setAttribute("userName",userName);
        request.setAttribute("role",role);
        request.setAttribute("useAble",useAble);
        return "userList";
    }

    @RequestMapping(value="/add")
    public String add(@ModelAttribute User user,HttpServletRequest request) {
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
        if(user != null){
            user.setCreateUser(loginUser.getUserName());
            user.setCreateTime(new Date());
            user.setUpdateUser(loginUser.getUserName());
            userService.add(user);
        }
        return "redirect:list";
    }
    @RequestMapping(value="/initUpdate")
    public String initUpdate(String userName,HttpServletRequest request) {
        if(!StringUtils.isEmpty(userName)){
            User user = userService.getUserByUserName(userName);
            request.setAttribute("user",user);
        }
        return "userUpdate";
    }

    @RequestMapping(value="/update")
    public String update(User user,HttpServletRequest request) {
        if(user!=null){
            User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
            user.setUpdateUser(loginUser.getUserName());
            userService.update(user);
        }
        return "redirect:list";
    }


}
