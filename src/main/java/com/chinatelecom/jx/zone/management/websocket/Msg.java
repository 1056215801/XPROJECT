package com.chinatelecom.jx.zone.management.websocket;

import java.util.Date;
/**
 * 消息体
 * @author Administrator
 *
 */
public class Msg {

	// 推送人ID
    private String fromUid;
 
    // 定点推送人ID
    private String toUid;
 
    // 定点推送单位ID
    private String toOrgId;
 
    // 消息体
    private String data;
 
    // 推送时间
    private Date createDate = new Date();
 
    // 消息状态
    private Integer flag;
    
    // 园区ID
    private String parkId;
    // 消息类型
    private String type;
    
    // 备注
    private String remark;
 
    public Msg() {
 
    }
 
    public Msg(String fromUid, String toUid, String toOrgId, String data, Date createDate, Integer flag, String type, String parkId) {
        this.fromUid = fromUid;
        this.toUid = toUid;
        this.toOrgId = toOrgId;
        this.data = data;
        this.createDate = createDate;
        this.flag = flag;
        this.parkId = parkId;
        this.type = type;
    }
 
    public String getFromUid() {
        return fromUid;
    }
 
    public void setFromUid(String fromUid) {
        this.fromUid = fromUid;
    }
 
    public String getToUid() {
        return toUid;
    }
 
    public void setToUid(String toUid) {
        this.toUid = toUid;
    }
 
    public String getToOrgId() {
        return toOrgId;
    }
 
    public void setToOrgId(String toOrgId) {
        this.toOrgId = toOrgId;
    }
 
    public String getData() {
        return data;
    }
 
    public void setData(String data) {
        this.data = data;
    }
 
    public Date getCreateDate() {
        return createDate;
    }
 
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
 
    public Integer getFlag() {
        return flag;
    }
 
    public void setFlag(Integer flag) {
        this.flag = flag;
    }
    
    public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
    public String toString() {
        return "Msg{" +
                "fromUid='" + fromUid + '\'' +
                ", toUid='" + toUid + '\'' +
                ", toOrgId='" + toOrgId + '\'' +
                ", data='" + data + '\'' +
                ", createDate=" + createDate +
                ", flag=" + flag +
                ", type=" + type +
                ", parkId=" + parkId +
                ", remark=" + remark +
                '}';
    }

	public String getParkId() {
		return parkId;
	}

	public void setParkId(String parkId) {
		this.parkId = parkId;
	}
	
	
	
}

