package com.chinatelecom.jx.zone.management.bean.projectActivity;

import java.math.BigDecimal;
import java.util.Date;

public class TestBean {
    private BigDecimal id;

    private String name;

    private Short sex;

    private Date birthday;

    private String description;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal bigDecimal) {
        this.id = bigDecimal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Short getSex() {
        return sex;
    }

    public void setSex(Short sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}