package com.lhlin.entity;

import java.util.Date;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public class Defect {
    private String id;
    private Integer projId;
    private Integer atProjState;
    private String module;
    private String tester;
    private String handler;
    private Integer type;
    private Integer seriousness;
    private Integer priority;
    private Integer recurrenceRate;
    private String state;
    private String step;
    private String actualResult;
    private String expectResult;
    private String remark;
    private Date createTime;

    private String projName;
    private String atProjStateStr;
    private String typeStr;
    private String seriousnessStr;
    private String priorityStr;
    private String recurrenceRateStr;
    private String stateStr;
    private String nextUser;
    private String newState;

    public static int ATPROJSTATE_XQ = 2;//需求
    public static int ATPROJSTATE_SJ = 3;//设计
    public static int ATPROJSTATE_KF = 4;//开发
    public static int ATPROJSTATE_CS = 5;//测试
    public static int ATPROJSTATE_SS = 6;//实施
    public static int ATPROJSTATE_WH = 7;//维护

    public static int TYPE_QX = 1;//缺陷
    public static int TYPE_YH = 2;//优化
    public static int TYPE_JY = 3;//建议
    public static int TYPE_XQ = 4;//需求

    public static int SERIOUSNESS_FCYZ = 1;//非常严重
    public static int SERIOUSNESS_BJYZ = 2;//比较严重
    public static int SERIOUSNESS_YB = 3;//一般
    public static int SERIOUSNESS_QW = 4;//轻微

    public static int PRIORITY_LJJE = 1;//立即解决
    public static int PRIORITY_GYXJ = 2;//高优先级
    public static int PRIORITY_ZCCL = 3;//正常处理
    public static int PRIORITY_DYXJ = 4;//低优先级

    public static String STATE_NEW = "new";
    public static String STATE_OPEN = "open";
    public static String STATE_ASSIGNED = "assigned";
    public static String STATE_FIXED = "fixed";
    public static String STATE_REJECTD = "rejectd";
    public static String STATE_DEFERRED = "deferred";
    public static String STATE_REOPEN = "reopen";
    public static String STATE_CLOSED = "closed";

    public static String SESSION_IMG = "SESSION_IMG_";


    public String  getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getProjId() {
        return projId;
    }

    public void setProjId(Integer projId) {
        this.projId = projId;
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public Integer getAtProjState() {
        return atProjState;
    }

    public void setAtProjState(Integer atProjState) {
        this.atProjState = atProjState;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getTester() {
        return tester;
    }

    public void setTester(String tester) {
        this.tester = tester;
    }


    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSeriousness() {
        return seriousness;
    }

    public void setSeriousness(Integer seriousness) {
        this.seriousness = seriousness;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getRecurrenceRate() {
        return recurrenceRate;
    }

    public void setRecurrenceRate(Integer recurrenceRate) {
        this.recurrenceRate = recurrenceRate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public String getActualResult() {
        return actualResult;
    }

    public void setActualResult(String actualResult) {
        this.actualResult = actualResult;
    }

    public String getExpectResult() {
        return expectResult;
    }

    public void setExpectResult(String expectResult) {
        this.expectResult = expectResult;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getAtProjStateStr() {
        return atProjStateStr;
    }

    public void setAtProjStateStr(String atProjStateStr) {
        this.atProjStateStr = atProjStateStr;
    }

    public String getTypeStr() {
        return typeStr;
    }

    public void setTypeStr(String typeStr) {
        this.typeStr = typeStr;
    }

    public String getSeriousnessStr() {
        return seriousnessStr;
    }

    public void setSeriousnessStr(String seriousnessStr) {
        this.seriousnessStr = seriousnessStr;
    }

    public String getPriorityStr() {
        return priorityStr;
    }

    public void setPriorityStr(String priorityStr) {
        this.priorityStr = priorityStr;
    }

    public String getRecurrenceRateStr() {
        return recurrenceRateStr;
    }

    public void setRecurrenceRateStr(String recurrenceRateStr) {
        this.recurrenceRateStr = recurrenceRateStr;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public String getNextUser() {
        return nextUser;
    }

    public void setNextUser(String nextUser) {
        this.nextUser = nextUser;
    }

    public String getNewState() {
        return newState;
    }

    public void setNewState(String newState) {
        this.newState = newState;
    }

    public static boolean isDefectState(String state){
        if(Defect.STATE_NEW.equals(state)
                || Defect.STATE_OPEN.equals(state)
                || Defect.STATE_ASSIGNED.equals(state)
                || Defect.STATE_FIXED.equals(state)
                || Defect.STATE_REJECTD.equals(state)
                || Defect.STATE_DEFERRED.equals(state)
                || Defect.STATE_REOPEN.equals(state)
                || Defect.STATE_CLOSED.equals(state)){
            return true;

        }
        return false;
    }
}
