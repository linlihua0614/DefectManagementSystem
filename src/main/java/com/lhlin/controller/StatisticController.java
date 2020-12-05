package com.lhlin.controller;

import com.alibaba.fastjson.JSONObject;
import com.lhlin.entity.*;
import com.lhlin.service.ProjectService;
import com.lhlin.service.StatisService;
import com.lhlin.service.UserService;
import com.lhlin.util.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Controller
@RequestMapping("/statis")
public class StatisticController {
    @Autowired
    private StatisService statisService;
    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/getSeriousnessInit")
    public String getSeriousnessInit(String projId,String handler,String startTime,String endTime,HttpServletRequest request){
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
        List<Project> projs = null;
        if(User.ROLE_ADMIN == loginUser.getRole()|| User.ROLE_ANALYSIS == loginUser.getRole()){
           projs = projectService.getAllAvailable();
        }else if(User.ROLE_CONFIRM == loginUser.getRole()){
            projs = projectService.getMyDeal(loginUser.getUserName());
        }
        request.setAttribute("projs",projs);
        request.setAttribute("projId",projId);
        request.setAttribute("handler",handler);
        request.setAttribute("startTime",startTime);
        request.setAttribute("endTime",endTime);
        return "statisticSeriousness";
    }

    @RequestMapping(value = "/getSeriousness" , method = RequestMethod.POST)
    public void getSeriousness(String projId,String handler,String startTime,String endTime,HttpServletRequest request,HttpServletResponse response){
        JSONObject json = new JSONObject();
        json.put("ret",0);
        json.put("fcyz_ed",0);
        json.put("fcyz_ing",0);
        json.put("bjyz_ed",0);
        json.put("bjyz_ing",0);
        json.put("yb_ed",0);
        json.put("yb_ing",0);
        json.put("qw_ed",0);
        json.put("qw_ing",0);

        //设置文件格式
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json;charset=utf-8");
        Seriousness seriousness = new Seriousness();
        seriousness.setProjId(projId);
        seriousness.setHandler(handler);
        seriousness.setStartTime(startTime);
        seriousness.setEndTime(endTime);
        List<Seriousness> seriousnesss =  statisService.getSeriousness(seriousness);
        //严重性：1：非常严重、2：比较严重、3：一般、4：轻微
        if(seriousness!=null){
            json.put("ret",1);
            for(Seriousness s:seriousnesss){
                if(Defect.SERIOUSNESS_FCYZ == s.getSeriousness()){
                    json.put("fcyz_ed",s.getSeriousnessEd());
                    json.put("fcyz_ing",s.getSeriousnessIng());
                }
                if(Defect.SERIOUSNESS_BJYZ == s.getSeriousness()){
                    json.put("bjyz_ed",s.getSeriousnessEd());
                    json.put("bjyz_ing",s.getSeriousnessIng());
                }
                if(Defect.SERIOUSNESS_YB == s.getSeriousness()){
                    json.put("yb_ed",s.getSeriousnessEd());
                    json.put("yb_ing",s.getSeriousnessIng());
                }
                if(Defect.SERIOUSNESS_QW == s.getSeriousness()){
                    json.put("qw_ed",s.getSeriousnessEd());
                    json.put("qw_ing",s.getSeriousnessIng());
                }
            }
        }

        try{
            OutputStream out = response.getOutputStream();
            out.write(json.toString().getBytes());
            out.close();
        }catch (IOException e){

        }
    }

    @RequestMapping(value = "/getPriorityInit")
    public String getPriorityInit(String projId,String handler,String startTime,String endTime,HttpServletRequest request){
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
        List<Project> projs = null;
        if(User.ROLE_ADMIN == loginUser.getRole()|| User.ROLE_ANALYSIS == loginUser.getRole()){
            projs = projectService.getAllAvailable();
        }else if(User.ROLE_CONFIRM == loginUser.getRole()){
            projs = projectService.getMyDeal(loginUser.getUserName());
        }
        request.setAttribute("projs",projs);
        request.setAttribute("projId",projId);
        request.setAttribute("handler",handler);
        request.setAttribute("startTime",startTime);
        request.setAttribute("endTime",endTime);
        return "statisticPriority";
    }


    @RequestMapping(value = "/getPriority" , method = RequestMethod.POST)
    public void getPriority(String projId,String handler,String startTime,String endTime,HttpServletRequest request,HttpServletResponse response){
        JSONObject json = new JSONObject();
        json.put("ret",0);
        json.put("lj_ed",0);
        json.put("lj_ing",0);
        json.put("gy_ed",0);
        json.put("gy_ing",0);
        json.put("zc_ed",0);
        json.put("zc_ing",0);
        json.put("dy_ed",0);
        json.put("dy_ing",0);

        //设置文件格式
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json;charset=utf-8");
        Priority priority = new Priority();
        priority.setProjId(projId);
        priority.setHandler(handler);
        priority.setStartTime(startTime);
        priority.setEndTime(endTime);
        List<Priority> priorities =  statisService.getPriority(priority);
        if(priorities!=null){
            json.put("ret",1);
            for(Priority s:priorities){
                if(Defect.PRIORITY_LJJE == s.getPriority()){
                    json.put("lj_ed",s.getPriorityEd());
                    json.put("lj_ing",s.getPriorityIng());
                }
                if(Defect.PRIORITY_GYXJ == s.getPriority()){
                    json.put("gy_ed",s.getPriorityEd());
                    json.put("gy_ing",s.getPriorityIng());
                }
                if(Defect.PRIORITY_ZCCL == s.getPriority()){
                    json.put("zc_ed",s.getPriorityEd());
                    json.put("zc_ing",s.getPriorityIng());
                }
                if(Defect.PRIORITY_DYXJ == s.getPriority()){
                    json.put("dy_ed",s.getPriorityEd());
                    json.put("dy_ing",s.getPriorityIng());
                }
            }
        }

        try{
            OutputStream out = response.getOutputStream();
            out.write(json.toString().getBytes());
            out.close();
        }catch (IOException e){

        }
    }

}
