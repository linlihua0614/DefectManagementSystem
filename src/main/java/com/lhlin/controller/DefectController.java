package com.lhlin.controller;

import com.alibaba.fastjson.JSONObject;
import com.lhlin.entity.*;
import com.lhlin.service.DefectService;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Controller
@RequestMapping("/defect")
public class DefectController {
    @Autowired
    private DefectService defectService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private UserService userService;

    /**
     * 缺陷列表展示
     * @param projName
     * @param type
     * @param state
     * @param seriousness
     * @param priority
     * @param recurrenceRate
     * @param tester
     * @param handler
     * @param request
     * @return
     */
    @RequestMapping(value="/list")
    public String list(String projName,String type,String state,String seriousness,String priority,String recurrenceRate,String tester,String handler,String startTime,String endTime,HttpServletRequest request) {
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
        Map<String,Object> map = new HashMap<String,Object>();
        int pageNum = StringUtils.isEmpty(request.getParameter("pageNum"))?1:Integer.valueOf(request.getParameter("pageNum"));
        int pageSize = 10;
        map.put("projName", projName);
        map.put("type", type);
        map.put("state",state);
        map.put("seriousness",seriousness);
        map.put("priority",priority);
        map.put("recurrenceRate",recurrenceRate);
        map.put("tester",tester);
        map.put("handler",handler);
        map.put("pageNum",pageNum);
        map.put("pageSize",pageSize);
        map.put("role",loginUser.getRole());
        map.put("loginUser",loginUser.getUserName());
        map.put("startTime",startTime);
        map.put("endTime",endTime);
        Page<Defect> page = defectService.getDefects(map);
        request.setAttribute("page", page);
        request.setAttribute("projName",projName);
        request.setAttribute("type",type);
        request.setAttribute("state",state);
        request.setAttribute("seriousness",seriousness);
        request.setAttribute("priority",priority);
        request.setAttribute("recurrenceRate",recurrenceRate);
        request.setAttribute("tester",tester);
        request.setAttribute("handler",handler);
        request.setAttribute("loginUserName",loginUser.getUserName());
        request.setAttribute("startTime",startTime);
        request.setAttribute("endTime",endTime);
        return "defectList";
    }

    /**
     * 缺陷初始化添加
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/initAdd")
    public String initAdd(HttpServletRequest request,HttpSession session){
        List<Project> projs = projectService.getAllAvailable();
        request.setAttribute("projs",projs);
        removeSessionImg(session);
        return "defectAdd";
    }

    /**
     * 缺陷添加
     * @param defect
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/add")
    public String add(@ModelAttribute Defect defect,HttpServletRequest request,HttpSession session) {
        User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
        if(defect != null){
            defect.setId(UUID.randomUUID().toString().replaceAll("-",""));
            defect.setTester(loginUser.getUserName());
            defect.setCreateTime(new Date());

            DefectDeal defectDeal = new DefectDeal();
            defectDeal.setDefectId(defect.getId());
            defectDeal.setDealUser(loginUser.getUserName());
            defectDeal.setDealTime(new Date());

            if(Defect.STATE_OPEN.equals(defect.getNewState())){
                defect.setHandler(defect.getNextUser());
                defect.setState(Defect.STATE_OPEN);

                defectDeal.setOldState(Defect.STATE_NEW);
                defectDeal.setNewState(Defect.STATE_OPEN);
                defectDeal.setNextUser(defect.getNextUser());

            }else if(Defect.STATE_NEW.equals(defect.getNewState())){
                defect.setHandler(loginUser.getUserName());
                defect.setState(Defect.STATE_NEW);

                defectDeal.setNewState(Defect.STATE_NEW);
                defectDeal.setNextUser(loginUser.getUserName());
            }

            defectService.add(defect);
            defectService.addDefectDeal(defectDeal);
            saveSessionImg(defect.getId(),session);

        }
        removeSessionImg(session);
        return "redirect:list";
    }

    /**
     * 缺陷初始化修改
     * @param id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/initUpdate")
    public String initUpdate(String id,HttpServletRequest request,HttpSession session) {
        if(!StringUtils.isEmpty(id)){
            List<Project> projs = projectService.getAllAvailable();
            request.setAttribute("projs",projs);

            Defect defect = defectService.getDefectById(id);
            request.setAttribute("defect",defect);
            removeSessionImg(session);
            setSessionImg(defect.getId(),session);
        }

        return "defectUpdate";
    }


    /**
     * 缺陷修改
     * @param defect
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/update")
    public String update(@ModelAttribute Defect defect,HttpServletRequest request,HttpSession session) {
        if(defect!=null){
            User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);

            if(Defect.STATE_OPEN.equals(defect.getNewState())){
                defect.setHandler(defect.getNextUser());
                defect.setState(Defect.STATE_OPEN);

                DefectDeal defectDeal = new DefectDeal();
                defectDeal.setDefectId(defect.getId());
                defectDeal.setDealUser(loginUser.getUserName());
                defectDeal.setDealTime(new Date());
                defectDeal.setOldState(Defect.STATE_NEW);
                defectDeal.setNewState(Defect.STATE_OPEN);
                defectDeal.setNextUser(defect.getNextUser());
                defectService.addDefectDeal(defectDeal);
            }
            defectService.update(defect);
            defectService.delAllDefectImgByDefectId(defect.getId());
            saveSessionImg(defect.getId(),session);
        }
        removeSessionImg(session);
        return "redirect:list";
    }

    /**
     * 缺陷删除
     * @param id
     * @return
     */
    @RequestMapping(value="/delete")
    public String delete(String id){
        defectService.delete(id);
        defectService.deleteDefectDealByDefectId(id);
        defectService.delAllDefectImgByDefectId(id);
        return "redirect:list";
    }


    /**
     * 缺陷初始化处理
     * @param id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/initDeal")
    public String initDeal(String id,HttpServletRequest request,HttpSession session) {
        if(!StringUtils.isEmpty(id)){
            User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
            Defect defect = defectService.getDefectById(id);
            request.setAttribute("defect",defect);
            request.setAttribute("role",loginUser.getRole());
            removeSessionImg(session);
            List<DefectImg> defectImgs =  defectService.getDefectImg(defect.getId());
            if(defectImgs!=null){
                for(DefectImg img:defectImgs){
                    session.setAttribute(Defect.SESSION_IMG+img.getImgOrder(),img);
                }
            }

            List<DefectDeal> defectDeals = defectService.getDefectDeals(id);
            request.setAttribute("defectDeals",defectDeals);
        }

        return "defectDeal";
    }

    /**
     * 缺陷处理
     * @param defectDeal
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/deal")
    public String deal(@ModelAttribute DefectDeal defectDeal,HttpServletRequest request,HttpSession session) {
        if (defectDeal!=null
                && !StringUtils.isEmpty(defectDeal.getDefectId())
                && !StringUtils.isEmpty(defectDeal.getNewState())) {

            User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
            Defect defect = defectService.getDefectById(defectDeal.getDefectId());
            String oldState = defect.getState();
            //缺陷状态：new：新建、open：打开、assigned：已指派、fixed：已修复、rejectd:拒绝、deferred:延期、reopen：从新打开、closed：关闭

            if(Defect.STATE_ASSIGNED.equals(defectDeal.getNewState())
                    ||Defect.STATE_REOPEN.equals(defectDeal.getNewState())){
                defect.setHandler(defectDeal.getNextUser());
            }else{
                defect.setHandler(defect.getTester());
                defectDeal.setNextUser(defect.getTester());
            }

            defect.setState(defectDeal.getNewState());
            defectService.updateDeal(defect);

            defectDeal.setDealUser(loginUser.getUserName());
            defectDeal.setDealTime(new Date());
            defectService.addDefectDeal(defectDeal);
        }
        return "redirect:list";
    }

    /**
     * 缺陷查看
     * @param id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/initView")
    public String initView(String id,HttpServletRequest request,HttpSession session) {
        if(!StringUtils.isEmpty(id)){
            User loginUser = (User) request.getSession().getAttribute(Common.USER_SESSION);
            Defect defect = defectService.getDefectById(id);
            request.setAttribute("defect",defect);
            removeSessionImg(session);
            List<DefectImg> defectImgs =  defectService.getDefectImg(defect.getId());
            if(defectImgs!=null){
                for(DefectImg img:defectImgs){
                    session.setAttribute(Defect.SESSION_IMG+img.getImgOrder(),img);
                }
            }

            List<DefectDeal> defectDeals = defectService.getDefectDeals(id);
            request.setAttribute("defectDeals",defectDeals);
        }

        return "defectView";
    }

    /**
     * 图片上传
     * @param response
     * @param request
     * @param httpSession
     * @throws IOException
     */
    @RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
    public void imgUpload(HttpServletResponse response, HttpServletRequest request, HttpSession httpSession) throws IOException {
         //获取图片
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        String upfileId = request.getParameter("upfileId");
        String imgId = request.getParameter("imgId");
        //根据前台name名称得到上传的文件
        MultipartFile img = multipartRequest.getFile(upfileId);

        //定义一个数组，用于保存可上传的文件类型
        List fileTypes = new ArrayList();
        fileTypes.add("jpg");
        fileTypes.add("jpeg");
        fileTypes.add("bmp");
        fileTypes.add("png");
        fileTypes.add("gif");
        String fileName = img.getOriginalFilename();
        Long id=null;
        String ret = "";
        if(!(fileName==null ||"".equals(fileName))){
            String extensionName = fileName.substring(fileName.lastIndexOf(".")+1);
            if(fileTypes.contains(extensionName)){//扩展名合法
                try{
                    id = System.currentTimeMillis();
                    byte[] content=img.getBytes();
                    String extension="image/"+extensionName;
                    DefectImg defectImg = new DefectImg(id,content,fileName,extension,imgId);
                    httpSession.setAttribute(Defect.SESSION_IMG+imgId,defectImg);
                }catch (IOException e){
                    e.printStackTrace();
                }
                ret = id.toString();
            }
        }
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        out = response.getWriter();
        out.write(ret);
    }


    /**
     * 图片预览
     * @param response
     * @param request
     */
    @RequestMapping(value = "/imgGetFromSession" , method = RequestMethod.GET)
    public void imgGetFromSession(HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
        String imgId = request.getParameter("imgId");
        DefectImg defectImg = (DefectImg)httpSession.getAttribute(Defect.SESSION_IMG+imgId);
        //设置文件格式
        try{
            response.setCharacterEncoding("utf-8");
            OutputStream out = response.getOutputStream();
            if(defectImg!=null){
                response.setContentType(defectImg.getExtension());
                out.write(defectImg.getImg());
                out.close();
            }else{
                response.setContentType("image/jpg");
                String upimgPath = request.getServletContext().getRealPath("/img/upimg.jpg");
                FileInputStream fin=new FileInputStream(new File(upimgPath));
                int i;
                while((i=fin.read())!=-1)
                {
                    out.write(i);
                    out.flush();
                }
                fin.close();
                out.close();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    /**
     * 图片预览
     * @param response
     * @param request
     */
    @RequestMapping(value = "/imgGetFromDB" , method = RequestMethod.GET)
    public void imgGetFromDB(HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
        String defectId = request.getParameter("defectId");
        String imgId = request.getParameter("imgId");
        List<DefectImg> defectImgs =  defectService.getDefectImg(defectId);
        DefectImg defectImg = null;
        if(defectImgs!=null){
            for(DefectImg img:defectImgs){
                if(img.getImgOrder().equals(imgId)){
                    defectImg = img;
                    break;
                }
            }
        }
        //设置文件格式
        try{
            response.setCharacterEncoding("utf-8");
            OutputStream out = response.getOutputStream();
            if(defectImg!=null){
                response.setContentType(defectImg.getExtension());
                out.write(defectImg.getImg());
                out.close();
            }else{
                response.setContentType("image/jpg");
                String upimgPath = request.getServletContext().getRealPath("/img/upimg.jpg");
                FileInputStream fin=new FileInputStream(new File(upimgPath));
                int i;
                while((i=fin.read())!=-1)
                {
                    out.write(i);
                    out.flush();
                }
                fin.close();
                out.close();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    /**
     * 图片删除
     * @param request
     * @param response
     * @param httpSession
     */
    @RequestMapping(value = "/imgDel" , method = RequestMethod.GET)
    public void imgDel(HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
        String imgId = request.getParameter("imgId");
        httpSession.removeAttribute(Defect.SESSION_IMG + imgId);
        try{
            OutputStream out = response.getOutputStream();
            out.write(1);
            out.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    /**
     * 图片下载
     * @param request
     * @param response
     * @param session
     * @throws Exception
     */
    @RequestMapping(value = "/imgDown",method = RequestMethod.GET)
    public void imgDown(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
        String defectId = request.getParameter("defectId");
        String imgId = request.getParameter("imgId");
        List<DefectImg> defectImgs =  defectService.getDefectImg(defectId);
        DefectImg defectImg = null;
        if(defectImgs!=null){
            for(DefectImg img:defectImgs){
                if(img.getImgOrder().equals(imgId)){
                    defectImg = img;
                    break;
                }
            }
        }
        if(defectImg!=null){
            //设置文件格式
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(defectImg.getFileName().getBytes("gb2312"), "iso8859-1"));
            response.setContentType(defectImg.getExtension());
            try{
                OutputStream out = response.getOutputStream();
                out.write(defectImg.getImg());
                out.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }else{
            //设置文件格式
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition", "attachment;fileName=upimg.jpg");
            response.setContentType("image/jpg");
            try{
                OutputStream out = response.getOutputStream();
                String upimgPath = request.getServletContext().getRealPath("/img/upimg.jpg");
                FileInputStream fin=new FileInputStream(new File(upimgPath));
                int i;
                while((i=fin.read())!=-1)
                {
                    out.write(i);
                    out.flush();
                }
                fin.close();
                out.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }

    /**
     * 判断下一步操作人是否符合要求
     * @param request
     * @param response
     */
    @RequestMapping(value = "/checkNextUser" , method = RequestMethod.GET)
    public void checkNextUser(HttpServletRequest request,HttpServletResponse response){
        String ret = "0";
        String userName = request.getParameter("userName");
        String nextState = request.getParameter("nextState");

        if(!StringUtils.isEmpty(userName) && !StringUtils.isEmpty(nextState)){
            User u = userService.getUserByUserName(userName);
            if(u!=null){
                //下一步操作为打开，指定下一步处理人角色只能是缺陷确认人员
                if(Defect.STATE_OPEN.equals(nextState) && u.getRole()==User.ROLE_CONFIRM){
                    ret  = "1";
                }
                //下一步操作为指派，指定下一步处理人角色只能是缺陷解决人员
               if(Defect.STATE_ASSIGNED.equals(nextState) && u.getRole()==User.ROLE_RESOLVE){
                    ret = "1";
                }
                //下一步操作为重新打开，指定下一步处理人角色可以为缺陷确认人员，也可以为缺陷解决人员
                if(Defect.STATE_REOPEN.equals(nextState) && (u.getRole()==User.ROLE_CONFIRM || u.getRole()==User.ROLE_RESOLVE)){
                    ret = "1";
                }
            }
        }
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            OutputStream out = response.getOutputStream();
            out.write(ret.getBytes());
            out.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public void setSessionImg(String defectId,HttpSession session){
        List<DefectImg> defectImgs =  defectService.getDefectImg(defectId);
        if(defectImgs!=null){
            for(DefectImg img:defectImgs){
                session.setAttribute(Defect.SESSION_IMG+img.getImgOrder(),img);
            }
        }
    }

    public void saveSessionImg(String defectId,HttpSession session){
        int i=1;
        DefectImg defectImg = null;
        while (i<=6){
            defectImg = (DefectImg)session.getAttribute(Defect.SESSION_IMG+"img"+i);
            if(defectImg!=null){
                defectImg.setDefectId(defectId);
                defectService.addDefectImg(defectImg);
            }
            i++;
        }
    }

    public void removeSessionImg(HttpSession session){
        session.removeAttribute(Defect.SESSION_IMG+"img1");
        session.removeAttribute(Defect.SESSION_IMG+"img2");
        session.removeAttribute(Defect.SESSION_IMG+"img3");
        session.removeAttribute(Defect.SESSION_IMG+"img4");
        session.removeAttribute(Defect.SESSION_IMG+"img5");
        session.removeAttribute(Defect.SESSION_IMG+"img6");
    }

}
