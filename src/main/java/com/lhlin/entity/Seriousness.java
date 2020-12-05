package com.lhlin.entity;

import java.util.Date;

/**
 * Created by Administrator on 2020/9/12 0012.
 */
public class Seriousness {
    private String projId;
    private String handler;
    private String startTime;
    private String endTime;
    private Integer seriousness;
    private Integer seriousnessEd;
    private Integer seriousnessIng;

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

    public Integer getSeriousness() {
        return seriousness;
    }

    public void setSeriousness(Integer seriousness) {
        this.seriousness = seriousness;
    }

    public Integer getSeriousnessEd() {
        return seriousnessEd;
    }

    public void setSeriousnessEd(Integer seriousnessEd) {
        this.seriousnessEd = seriousnessEd;
    }

    public Integer getSeriousnessIng() {
        return seriousnessIng;
    }

    public void setSeriousnessIng(Integer seriousnessIng) {
        this.seriousnessIng = seriousnessIng;
    }
}
