package com.chinatelecom.jx.zone.management.bean.weixinConfig;

/***
 *** 微信菜单
****/
public class WeixinConfigMenuBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal menuId;
	 
	 /***
	 * 上级菜单
	 */
	private java.math.BigDecimal parentMenuId;
	 
	 /***
	 * 菜单名称
	 */
	private java.lang.String menuName;
	 
	 /***
	 * 保存值
	 */
	private java.lang.String saveValue;
	 
	 /***
	 * 菜单级别
	 */
	private java.lang.Short menuLevel;
	 
	 /***
	 * 排序号
	 */
	private java.lang.Short orderNum;
	 
	 /***
	 * 菜单类型
	 */
	private java.lang.String menuType;
	 
	 /***
	 * 功能菜单小图标
	 */
	private java.lang.String menuIcon;
	 
	 /***
	 * 页面模板类型 url:超链接 essay：单个文章 essayList：文章列表 infoList：信息列表 newsList：新闻公告,diyPage:定制页面；navPage：导航页面
	 */
	private java.lang.String tplType;
	 
	 /***
	 * 菜单描述
	 */
	private java.lang.String description;
	 
	 /***
	 * 排序类型
	 */
	private java.lang.String sortType;
	 
	protected String orderByClause;

	public WeixinConfigMenuBean(){
	}

	public WeixinConfigMenuBean(
		java.math.BigDecimal menuId
	){
		this.menuId = menuId;
	}

	 
	public void setMenuId(java.math.BigDecimal value) {
		this.menuId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getMenuId() {
		return this.menuId;
	}
	 
	public void setParentMenuId(java.math.BigDecimal value) {
		this.parentMenuId = value;
	}
	/***
	 * 上级菜单
	 */
	public java.math.BigDecimal getParentMenuId() {
		return this.parentMenuId;
	}
	 
	public void setMenuName(java.lang.String value) {
		this.menuName = value;
	}
	/***
	 * 菜单名称
	 */
	public java.lang.String getMenuName() {
		return this.menuName;
	}
	 
	public void setSaveValue(java.lang.String value) {
		this.saveValue = value;
	}
	/***
	 * 保存值
	 */
	public java.lang.String getSaveValue() {
		return this.saveValue;
	}
	 
	public void setMenuLevel(java.lang.Short value) {
		this.menuLevel = value;
	}
	/***
	 * 菜单级别
	 */
	public java.lang.Short getMenuLevel() {
		return this.menuLevel;
	}
	 
	public void setOrderNum(java.lang.Short value) {
		this.orderNum = value;
	}
	/***
	 * 排序号
	 */
	public java.lang.Short getOrderNum() {
		return this.orderNum;
	}
	 
	public void setMenuType(java.lang.String value) {
		this.menuType = value;
	}
	/***
	 * 菜单类型
	 */
	public java.lang.String getMenuType() {
		return this.menuType;
	}
	 
	public void setMenuIcon(java.lang.String value) {
		this.menuIcon = value;
	}
	/***
	 * 功能菜单小图标
	 */
	public java.lang.String getMenuIcon() {
		return this.menuIcon;
	}
	 
	public void setTplType(java.lang.String value) {
		this.tplType = value;
	}
	/***
	 * 页面模板类型 url:超链接 essay：单个文章 essayList：文章列表 infoList：信息列表 newsList：新闻公告,diyPage:定制页面；navPage：导航页面
	 */
	public java.lang.String getTplType() {
		return this.tplType;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 菜单描述
	 */
	public java.lang.String getDescription() {
		return this.description;
	}
	 
	public void setSortType(java.lang.String value) {
		this.sortType = value;
	}
	/***
	 * 排序类型
	 */
	public java.lang.String getSortType() {
		return this.sortType;
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

