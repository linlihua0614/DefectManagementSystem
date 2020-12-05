package com.lhlin.entity;

/**
 * Created by Administrator on 2020/9/12 0012.
 */
public class Priority {
    private String projId;
    private String handler;
    private String startTime;
    private String endTime;
    private Integer priority;
    private Integer priorityEd;
    private Integer priorityIng;

    public String getProjId() {
        return projId;
    }

    public void setProjId(String projId) {
        this.projId = projId;
    }

    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getPriorityEd() {
        return priorityEd;
    }

    public void setPriorityEd(Integer priorityEd) {
        this.priorityEd = priorityEd;
    }

    public Integer getPriorityIng() {
        return priorityIng;
    }

    public void setPriorityIng(Integer priorityIng) {
        this.priorityIng = priorityIng;
    }
}
