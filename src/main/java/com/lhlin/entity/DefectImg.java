package com.lhlin.entity;

import java.util.Date;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public class DefectImg {
   private Long  id;
    private String defectId;
    private byte[] img;
    private String fileName;
    private String extension;
    private String imgOrder;


    public DefectImg() {
    }

    public DefectImg(Long id,byte[] img,String fileName,String extension, String imgOrder) {
        this.id = id;
        this.defectId = defectId;
        this.img = img;
        this.imgOrder = imgOrder;
        this.fileName = fileName;
        this.extension = extension;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String  getDefectId() {
        return defectId;
    }

    public void setDefectId(String defectId) {
        this.defectId = defectId;
    }

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) {
        this.img = img;
    }

    public String getImgOrder() {
        return imgOrder;
    }

    public void setImgOrder(String imgOrder) {
        this.imgOrder = imgOrder;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }
}
