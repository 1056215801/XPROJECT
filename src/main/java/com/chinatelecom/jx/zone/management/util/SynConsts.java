package com.chinatelecom.jx.zone.management.util;

/**
 * 同步获取数据地址常量
 * @author Administrator
 *
 */
public class SynConsts {
    
/**直连接口地址*/
     
    /**园区企业信息_正式环境*/
    public final static String getParkEntCompanyAll_Url = "/json/compinfo/companyinfo/getCompanyInfoList";
    /**园区公告信息_正式环境*/
    public final static String getParkNoticeAll_Url = "/json/publicinfo/notice/getPageNoticeList";
    /**园区投诉建议信息_正式环境*/
    public final static String getParkComplainAll_Url = "/json/ts/tssuggest/viewListForPortal";
    /**园区招聘信息_正式环境*/
    public final static String getParkJobInfoAll_Url = "/json/zp/zpjobinfo/jobInfoListForMobile";
    /**园区产业信息_正式环境*/ 
    public final static String getParkIndustryInfoAll_Url = "/json/company/companyinfo/industryinfo/getIndustryInfoList";
    /**园区要素共享信息_正式环境*/ 
    public final static String getParkElementInfoAll_Url = "/json/elements/elementssharing/viewListForMobile";
    
   
    
    /**
     * 中危宝物流接口地址
     */
    
    /**获取本地存储货源信息*/
    public final static String zwb_localGoodsInfo_url = "/json/zwb/goodsInfo/detail";  
    /**本地存储货源信息*/
    public final static String zwb_localAddGoodsInfo_url = "/json/zwb/goodsInfo/save";
    /**本地修改货源信息*/
    public final static String zwb_localModGoodsInfo_url = "/json/zwb/goodsInfo/modify";
	  
    /**获取token*/
	public final static String zwb_getToken_Url = "/api/jx/user_getToken";
	/**发布货源*/
	public final static String zwb_publishGoods_Url = "/api/jx/demand_publishGoods";
	/**编辑货源*/
	public final static String zwb_modGoods_Url = "/api/jx/demand_modGoods";
	/**我的货源*/
	public final static String zwb_findGoods_Url = "/api/jx/demand_findGoods";
	/**货源详情*/
	public final static String zwb_goodsDetail_Url = "/api/jx/demand_findGoodsDetailById";
	/**删除货源*/
	public final static String zwb_delGoods_Url = "/api/jx/demand_delGoods";
	/**查找车源*/
	public final static String zwb_findCarSource_Url = "/api/jx/carSource_findCarSource";
	/**收藏车源*/
	public final static String zwb_collectCarSource_Url = "/api/jx/carSource_collectCarSource";
	/**取消收藏车源*/
	public final static String zwb_cancelCollectionCarSource_Url = "/api/jx/carSource_cancelCollectCarSource";
    
    /**
     * 企业产品展示平台接口地址
     */
    
    /**已上架产品列表*/
    public final static String productUpList_Url = "interface/productUpList" ;
    /**已下架产品列表*/
    public final static String productDownList_Url = "interface/productDownList" ;
    /**我发布的产品列表*/
    public final static String productMyList_Url = "interface/productMyList" ;
    /**企业审核待办产品列表*/
    public final static String productAuditList_Url = "interface/productAuditList" ;
    /**审核不通过产品列表*/
    public final static String productNotPassedList_Url = "interface/productNotPassedList" ;
    /**已审核上架产品列表*/
    public final static String productAuditedList_Url = "interface/productAuditedList" ;
    /**园区待办审核产品列表*/
    public final static String productUnAuditedList_Url = "interface/productUnAuditedList" ;
    /**代理发布产品列表*/
    public final static String productAgentList_Url = "interface/productAgentList" ;
    /**产品详情*/
    public final static String productView_Url = "interface/productView" ;
    /**产品详情（非正式产品）*/
    public final static String productViewForTemp_Url = "interface/productViewForTemp" ;
    /**保存（新增商品的保存，已上架的产品编辑的保存，审核中的商品保存 ）*/
    public final static String productSave_Url = "interface/productSave" ;
    /**上架产品*/
    public final static String productGoUp_Url = "interface/productGoUp" ;
    /**下架产品*/
    public final static String productGoDown_Url = "interface/productGoDown" ;
    /**删除产品*/
    public final static String productGoDelete_Url = "interface/productGoDelete" ;
    /**保存审核信息*/
    public final static String productSaveAudit_Url = "interface/productSaveAudit" ;
    /**保存 (审核中的商品，审核不通过的商品，由企业管理员再次编辑，然后保存提交审核)*/
    public final static String productSubmitToAudit_Url = "interface/productSubmitToAudit" ;
    /**单位（吨，个等）列表*/
    public final static String unitList_Url = "interface/unitList" ;
    /**查看审核信息*/
    public final static String productShow_Url = "interface/productShow" ;
    /**搜索产品*/
    public final static String productSearch_Url = "interface/productSearch" ;
    /**搜索产品*/
    public final static String productMainData_Url = "interface/productMainData" ;
    
    /**供求保存 (审核中的商品，审核不通过的商品，由企业管理员再次编辑，然后保存提交审核)*/
    public final static String supplyDemandSave = "interface/supplyDemandSave" ;
    /**搜索供求*/
    public final static String supplyDemandSearch_Url = "interface/supplyDemandSearch" ;
    /**推荐供求*/
    public final static String supplyDemandRecommend_Url = "interface/supplyDemandRecommend" ;
    /**已上架供求*/
    public final static String supplyDemandUpList_Url = "interface/supplyDemandUpList" ;
    /**已下架供求*/
    public final static String supplyDemandDownList_Url = "interface/supplyDemandDownList" ;
    /**我发布的供求*/
    public final static String supplyDemandMyList_Url = "interface/supplyDemandMyList" ;
    /**企业用户查看审核中列表供求*/
    public final static String supplyDemandAuditList_Url = "interface/supplyDemandAuditList" ;
    /**审核不通过供求列表*/
    public final static String supplyDemandNotPassedList_Url = "interface/supplyDemandNotPassedList" ;
    /**审核不通过供求详情*/
    public final static String supplyDemandViewTemp_Url = "interface/supplyDemandViewTemp" ;
    /**审核通过供求列表*/
    public final static String supplyDemandAuditedList_Url = "interface/supplyDemandAuditedList" ;
    /**待审供求列表*/
    public final static String supplyDemandUnAuditedList_Url = "interface/supplyDemandUnAuditedList" ;
    /**代理发布列表*/
    public final static String supplyDemandAgentList_Url = "interface/supplyDemandAgentList" ;
    /**查看供求*/
    public final static String supplyDemanView_Url = "interface/supplyDemanView" ;
    /**获取审核信息*/
    public final static String supplyDemandShow_Url = "interface/supplyDemandShow" ;
    /**上架*/
    public final static String supplyDemandGoUp_Url = "interface/supplyDemandGoUp" ;
    /**下架*/
    public final static String supplyDemandGoDown_Url = "interface/supplyDemandGoDown" ;
    /**删除*/
    public final static String supplyDemandGoDelete_Url = "interface/supplyDemandGoDelete" ;
    /**保存审核信息（非代理商品）*/
    public final static String supplyDemandSaveAudit_Url = "interface/supplyDemandSaveAudit" ;
    /**保存 (审核中的商品，审核不通过的商品，由企业管理员再次编辑，然后保存提交审核)*/
    public final static String supplyDemandSubmitToAudit_Url = "interface/supplyDemandSubmitToAudit" ;
 
    
    /**企业信息*/
    public final static String companyInfoView_Url = "interface/companyInfoView" ;
    /**我的收藏夹*/
    public final static String myCollect_Url = "interface/myCollect" ;
    /**企业列表*/
    public final static String companyList_Url = "interface/companyList" ;
    /**企业搜索*/
    public final static String companySearch_Url = "interface/companySearch" ;
    /**推荐企业*/
    public final static String companyRecomand_Url = "interface/popCompany" ;
    /**供需统计*/
    public final static String supplyDemandCount_Url = "interface/supplyDemandCount" ;
    /**热门企业*/
    public final static String popCompany_Url = "interface/popCompany" ;
    /**热门商品*/
    public final static String popProduct_Url = "interface/popProduct" ;
    /**添加至收藏夹*/
    public final static String addToCollect_Url = "interface/addToCollect" ;
    /**从收藏夹删除*/
    public final static String delFromCollect_Url = "interface/DelFromCollect" ;
    /**附件下载*/
    public final static String ajaxGetAtts_Url = "interface/ajaxGetAtts" ;
    
  
}
