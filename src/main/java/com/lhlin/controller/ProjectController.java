package com.lhlin.controller;

import com.lhlin.entity.Project;
import com.lhlin.entity.User;
import com.lhlin.service.ProjectService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.PortUnreachableException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping(value="/list")
    public String list(String projName,Integer isEnd,HttpServletRequest request) {
        Map<String,Object> map = new HashMap<String,Object>();
        int pageNum = StringUtils.isEmpty(request.getParameter("pageNum"))?1:Integer.valueOf(request.getParameter("pageNum"));
        int pageSize = 10;
        map.put("projName", projName);
        map.put("isEnd",isEnd);
        map.put("pageNum",pageNum);
        map.put("pageSize",pageSize);
        Page<Project> page = projectService.getProjs(map);
        request.setAttribute("page", page);
        request.setAttribute("projName",projName);
        request.setAttribute("isEnd",isEnd);
        return "projectList";
    }

    @RequestMapping(value="/add")
    public String add(@ModelAttribute Project proj,HttpServletRequest request) {
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
        if(proj != null){
            proj.setCreateUser(loginUser.getUserName());
            proj.setCreateTime(new Date());
            proj.setUpdateUser(loginUser.getUserName());
            projectService.add(proj);
        }
        return "redirect:list";
    }
    @RequestMapping(value="/initUpdate")
    public String initUpdate(Integer id,HttpServletRequest request) {
        if(id!=null){
            Project proj = projectService.getProjById(id);
            request.setAttribute("proj",proj);
        }
        return "projectUpdate";
    }

    @RequestMapping(value="/update")
    public String update(Project proj,HttpServletRequest request) {
        if(proj!=null){
            User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
            proj.setUpdateUser(loginUser.getUserName());
            projectService.update(proj);
        }
        return "redirect:list";
    }


}
