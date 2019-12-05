package com.chinatelecom.jx.zone.management.weixin.template;


public class TempEntity {
	private String touser; //用户OpenID
	private String template_id; //消息模板ID
	private String url;  //查看详细地址 若为空，则在发送后，点击模板消息会进入一个空白页面（ios），或无法点击（android）。
	private String topcolor; //标题颜色
	private DataItem data;//数据
	public String getTouser() {
		return touser;
	}
	public void setTouser(String touser) {
		this.touser = touser;
	}
	public String getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTopcolor() {
		return topcolor;
	}
	public void setTopcolor(String topcolor) {
		this.topcolor = topcolor;
	}
	public DataItem getData() {
		return data;
	}
	public void setData(DataItem data) {
		this.data = data;
	}
}
