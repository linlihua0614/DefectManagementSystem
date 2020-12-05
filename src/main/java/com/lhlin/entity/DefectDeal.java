package com.lhlin.entity;

import java.util.Date;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public class DefectDeal {
    private Integer id;
    private String defectId;
    private String dealUser;
    private Date dealTime;
    private String oldState;
    private String newState;
    private String nextUser;
    private String remark;

    private String oldStateStr;
    private String newStateStr;
    private String roleStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDefectId() {
        return defectId;
    }

    public void setDefectId(String  defectId) {
        this.defectId = defectId;
    }

    public String getDealUser() {
        return dealUser;
    }

    public void setDealUser(String dealUser) {
        this.dealUser = dealUser;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }


    public String getOldState() {
        return oldState;
    }

    public void setOldState(String oldState) {
        this.oldState = oldState;
    }

    public String getNewState() {
        return newState;
    }

    public void setNewState(String newState) {
        this.newState = newState;
    }

    public String getNextUser() {
        return nextUser;
    }

    public void setNextUser(String nextUser) {
        this.nextUser = nextUser;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOldStateStr() {
        return oldStateStr;
    }

    public void setOldStateStr(String oldStateStr) {
        this.oldStateStr = oldStateStr;
    }

    public String getNewStateStr() {
        return newStateStr;
    }

    public void setNewStateStr(String newStateStr) {
        this.newStateStr = newStateStr;
    }



    public String getRoleStr() {
        return roleStr;
    }

    public void setRoleStr(String roleStr) {
        this.roleStr = roleStr;
    }
}
