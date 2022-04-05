package com.shopping.mall.themall.model;

import java.util.Date;

public class Address {

    private Integer id;

    private Date addtime;

    private Boolean deletestatus;

    private Integer userid;

    private String detailaddress;

    private String procityarea;

    private String postcodecode;

    private String phone;

    private String consigneename;

    private Boolean morenstatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Boolean getDeletestatus() {
        return deletestatus;
    }

    public void setDeletestatus(Boolean deletestatus) {
        this.deletestatus = deletestatus;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getDetailaddress() {
        return detailaddress;
    }

    public void setDetailaddress(String detailaddress) {
        this.detailaddress = detailaddress == null ? null : detailaddress.trim();
    }

    public String getProcityarea() {
        return procityarea;
    }

    public void setProcityarea(String procityarea) {
        this.procityarea = procityarea == null ? null : procityarea.trim();
    }

    public String getPostcodecode() {
        return postcodecode;
    }

    public void setPostcodecode(String postcodecode) {
        this.postcodecode = postcodecode == null ? null : postcodecode.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getConsigneename() {
        return consigneename;
    }

    public void setConsigneename(String consigneename) {
        this.consigneename = consigneename == null ? null : consigneename.trim();
    }

    public Boolean getMorenstatus() {
        return morenstatus;
    }

    public void setMorenstatus(Boolean morenstatus) {
        this.morenstatus = morenstatus;
    }
}