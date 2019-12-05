package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** 时间节点表
****/
public class ProjectDeclareNodeBean {
	
	 /***
	 * 编号
	 */
	private java.math.BigDecimal nodeId;
	 
	 /***
	 * 关联编号
	 */
	private java.math.BigDecimal declareId;
	 
	 /***
	 * 节点名称
	 */
	private java.lang.String nodeName;
	 
	 /***
	 * 截止时间
	 */
	private java.util.Date endTime;
	 
	 /***
	 * 剩余时间，单位分钟，-1标识已经过期。
	 */
	private java.lang.Integer remainDay;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	
	/***
	 * 节点序号
	 */
	private java.lang.Integer nodeNum;
	/***
	 * 截止时间字符串
	 */
	private java.lang.String endTimeStr;
	 
	protected String orderByClause;

	public ProjectDeclareNodeBean(){
	}

	public ProjectDeclareNodeBean(
		java.math.BigDecimal nodeId
	){
		this.nodeId = nodeId;
	}

	 
	public java.lang.String getEndTimeStr() {
		return endTimeStr;
	}

	public void setEndTimeStr(java.lang.String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}

	public void setNodeId(java.math.BigDecimal value) {
		this.nodeId = value;
	}
	/***
	 * 编号
	 */
	public java.math.BigDecimal getNodeId() {
		return this.nodeId;
	}
	 
	public void setDeclareId(java.math.BigDecimal value) {
		this.declareId = value;
	}
	/***
	 * 关联编号
	 */
	public java.math.BigDecimal getDeclareId() {
		return this.declareId;
	}
	 
	public void setNodeName(java.lang.String value) {
		this.nodeName = value;
	}
	/***
	 * 节点名称
	 */
	public java.lang.String getNodeName() {
		return this.nodeName;
	}
	 
	public void setEndTime(java.util.Date value) {
		this.endTime = value;
	}
	/***
	 * 截止时间
	 */
	public java.util.Date getEndTime() {
		return this.endTime;
	}
	 
	public void setRemainDay(java.lang.Integer value) {
		this.remainDay = value;
	}
	/***
	 * 剩余时间，单位分钟，-1标识已经过期。
	 */
	public java.lang.Integer getRemainDay() {
		return this.remainDay;
	}
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 备注
	 */
	public java.lang.String getRemark() {
		return this.remark;
	}
	
	
	
	public java.lang.Integer getNodeNum() {
		return nodeNum;
	}

	public void setNodeNum(java.lang.Integer nodeNum) {
		this.nodeNum = nodeNum;
	}

	/***
	*  排序
	*/
	public String getOrderByClause() {
		return orderByClause;
	}
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}
	
}

