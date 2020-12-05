package com.lhlin.entity;

import java.util.Date;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public class User {
    private String userName;
    private String passWord;
    private Integer role;
    private Integer useAble;
    private String createUser;
    private Date createTime;
    private String updateUser;
    private Date updateTime;

    private String roleStr;
    private String useAbleStr;

    public static int ROLE_ADMIN = 0;//系统管理员
    public static int ROLE_RESOLVE = 1;//缺陷解决人员
    public static int ROLE_TEST = 2;//缺陷发现人员
    public static int ROLE_CONFIRM = 3;//缺陷确认人员
    public static int ROLE_ANALYSIS = 9;//数据分析角色

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getUseAble() {
        return useAble;
    }

    public void setUseAble(Integer useAble) {
        this.useAble = useAble;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRoleStr() {
        return roleStr;
    }

    public void setRoleStr(String roleStr) {
        this.roleStr = roleStr;
    }

    public String getUseAbleStr() {
        return useAbleStr;
    }

    public void setUseAbleStr(String useAbleStr) {
        this.useAbleStr = useAbleStr;
    }
}
