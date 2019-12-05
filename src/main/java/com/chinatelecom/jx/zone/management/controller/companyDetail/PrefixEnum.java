package com.chinatelecom.jx.zone.management.controller.companyDetail;

/**
 * Created by cRAZY on 2019/6/20.
 */
public interface PrefixEnum {

    String BASE_PREFIX="Z_";
    //工商信息
    String COMPANY_BASE_INFO=BASE_PREFIX+"S_";                                              //企业工商数据查询->企业关键字精确获取详细信息(Basic)
    String COMPANY_INVESTMENT=BASE_PREFIX+"INFO_INVESTMENT_";                               //企业对外投资
    String COMPANY_DIMENSION=BASE_PREFIX+"INFO_DIMENSION_";                                 //工商信息纬度条目数
    //知识产权
    String COMPANY_KNOW_BRAND=BASE_PREFIX+"KNOW_BRAND_";                                    //全国商标查询
    String COMPANY_KNOW_COPYRIGHT=BASE_PREFIX+"KNOW_COPYRIGHT_";                            //著作权查询
    String COMPANY_KNOW_SOFTWARE=BASE_PREFIX+"KNOW_SOFTWARE_";                              //软件著作权查询
    String COMPANY_KNOW_CERTIFICATION=BASE_PREFIX+"KNOW_CERTIFICATION_";                    //企业证书查询
    String COMPANY_KNOW_WEB=BASE_PREFIX+"KNOW_WEB_";                                        //网站信息查询
    String COMPANY_KNOW_DIMENSION=BASE_PREFIX+"KNOW_DIMENSION_";                            //知识产权维度条目数
    //经营状况  Introduction
    String COMPANY_FINANCE_EXTRA_CONTACT=BASE_PREFIX+"FI_EXTRA_CONTACT_";                   //企业附加信息查询->查询公司联系信息
    String COMPANY_FINANCE_EXTRA_NEWS=BASE_PREFIX+"FI_EXTRA_NEWS_";                         //企业附加信息查询->查询企业新闻信息
    String COMPANY_FINANCE_EXTRA_RECRUIT=BASE_PREFIX+"FI_EXTRA_RECRUIT_";                   //企业附加信息查询->查询企业招聘信息
    String COMPANY_FINANCE_EXTRA_INTRODUCTION=BASE_PREFIX+"FI_EXTRA_INTRODUCTION_";         //企业附加信息查询->公司名查询简介信息
    String COMPANY_FINANCE_PRODUCT=BASE_PREFIX+"FI_PRODUCT_";                               //公司产品信息查询
    String COMPANY_FINANCE_OPERATING_FINANCING=BASE_PREFIX+"FI_OPERATING_FI_";              //经营状况查询->融资信息查询
    String COMPANY_FINANCE_OPERATING_TENDER=BASE_PREFIX+"FI_OPERATING_TENDER_";             //经营状况查询->获取投标信息
    String COMPANY_FINANCE_OPERATING_EXPORT=BASE_PREFIX+"FI_OPERATING_EXPORT_";             //经营状况查询->获取海关进出口列表&获取海关进出口详情
    String COMPANY_FINANCE_PUBLISH=BASE_PREFIX+"FI_PUBLISH_";                               //地块公示列表&地块公示详情
    String COMPANY_FINANCE_PURCHASE=BASE_PREFIX+"FI_PURCHASE_";                             //购地信息列表&购地信息详情
    String COMPANY_FINANCE_TRANSFER=BASE_PREFIX+"FI_TRANSFER_";                             //土地转让列表&土地转让详情
    String COMPANY_FINANCE_BOND=BASE_PREFIX+"FI_BOND_";                                     //债劵列表&债劵详情
    String COMPANY_FINANCE_LICENSE_GS=BASE_PREFIX+"FI_LICENSE_GS_";                         //行政许可->行政许可列表(工商局)
    String COMPANY_FINANCE_LICENSE_CN=BASE_PREFIX+"FI_LICENSE_CN_";                         //行政许可->行政许可列表(信用中国)&行政许可详情(信用中国)
    String COMPANY_FINANCE_DIMENSION=BASE_PREFIX+"FI_DIMENSION_";                           //经营状况维度条目数
    String COMPANY_FINANCE_CREDIT=BASE_PREFIX+"FI_CREDIT_";                                 //税务信用
    //经营风险
    String COMPANY_RISK_SALE=BASE_PREFIX+"RISK_SALE_";                                      //司法拍卖列表&司法拍卖详情
    String COMPANY_RISK_LAND=BASE_PREFIX+"RISK_LAND_";                                      //获取土地抵押列表&获取土地抵押详情
    String COMPANY_RISK_ENV=BASE_PREFIX+"RISK_ENV_";                                        //获取环保处罚列表&获取环保处罚详情
    String COMPANY_RISK_CHATTEL=BASE_PREFIX+"RISK_CHATTEL_";                                //获取动产抵押信息
    String COMPANY_RISK_VIOLATION=BASE_PREFIX+"RISK_VIOLATION_";                            //获取严重违法信息
    String COMPANY_RISK_OWE=BASE_PREFIX+"RISK_OWE_";                                        //欠税公告列表&欠税公告详情
    String COMPANY_RISK_CANCEL=BASE_PREFIX+"RISK_CANCEL_";                                  //获取简易注销信息
    String COMPANY_RISK_NOTICE=BASE_PREFIX+"RISK_NOTICE_";                                  //公示催告列表&公示催告详情
    String COMPANY_RISK_ILLEGAL=BASE_PREFIX+"RISK_ILLEGAL_";                                //税收违法列表&税收违法详情
    String COMPANY_RISK_STOCK=BASE_PREFIX+"RISK_STOCK_";                                    //股权出质列表
    String COMPANY_RISK_PENALTY_CN=BASE_PREFIX+"RISK_PENALTY_CN_";                          //行政处罚->行政处罚列表(信用中国)&行政处罚详情(信用中国)
    String COMPANY_RISK_PENALTY_GS=BASE_PREFIX+"RISK_PENALTY_GS_";                          //行政处罚->行政处罚列表(工商局)
    String COMPANY_RISK_DIMENSION=BASE_PREFIX+"RISK_DIMENSION_";                            //经营风险维度条目数
    //人员相关
    String COMPANY_PERSON_SENIOR=BASE_PREFIX+"PER_SENIOR_";                                 //获取董监高列表
    String COMPANY_PERSON_OWN_RISK=BASE_PREFIX+"PER_OWN_RISK_";                             //个人自身风险
    String COMPANY_PERSON_OWN_COUNT=BASE_PREFIX+"PER_OWN_COUNT_";                           //个人自身风险条目
    String COMPANY_PERSON_PRR_COUNT=BASE_PREFIX+"PER_PRR_COUNT_";                           //个人关联风险条目
    String COMPANY_PERSON_PRR_OPER=BASE_PREFIX+"PER_PRR_OPER_";                             //个人关联风险条目
    String COMPANY_PERSON_PRR_SX=BASE_PREFIX+"PER_PRR_SX_";                                 //个人关联风险-失信被执行
    String COMPANY_PERSON_PRR_ZX=BASE_PREFIX+"PER_PRR_ZX_";                                 //个人关联风险-被执行
    String COMPANY_PERSON_PRR_COURT=BASE_PREFIX+"PER_PRR_COURT_";                           //个人关联风险-开庭公告
    String COMPANY_PERSON_PRR_JUDGE=BASE_PREFIX+"PER_PRR_JUDGE_";                           //个人关联风险-裁判文书
    String COMPANY_PERSON_PRR_SALE=BASE_PREFIX+"PER_PRR_SALE_";                             //个人关联风险-司法拍卖
    String COMPANY_PERSON_PRR_EXC=BASE_PREFIX+"PER_PRR_EXC_";                               //个人关联风险-经营异常
    String COMPANY_PERSON_PRR_PLEDGE=BASE_PREFIX+"PER_PRR_PLEDGE_";                         //个人关联风险-股权出质
    String COMPANY_PERSON_PRR_CHATTEL=BASE_PREFIX+"PER_PRR_CHATTEL_";                       //个人关联风险-动产抵押
    String COMPANY_PERSON_PRR_FREEZE=BASE_PREFIX+"PER_PRR_FREEZE_";                         //个人关联风险-股权冻结
    String COMPANY_PERSON_PRR_PENALTY=BASE_PREFIX+"PER_PRR_PENALTY_";                       //个人关联风险-行政处罚
    String COMPANY_PERSON_PRR_CHANGE=BASE_PREFIX+"PER_PRR_CHANGE_";                         //个人关联风险-大股东变更
    String COMPANY_PERSON_HOLD=BASE_PREFIX+"PER_HOLD_";                                     //人控股企业
    String COMPANY_PERSON_HIS_OPER=BASE_PREFIX+"PER_HIS_OPER_";                             //个人历史担任法人公司
    String COMPANY_PERSON_HIS_INVEST=BASE_PREFIX+"PER_HIS_INVEST_";                         //个人历史对外投资公司
    String COMPANY_PERSON_HIS_JOB=BASE_PREFIX+"PER_HIS_JOB_";                               //个人历史在外任职公司
    String COMPANY_PERSON_HIS_ZX=BASE_PREFIX+"PER_HIS_ZX_";                                 //个人历史被执行人
    String COMPANY_PERSON_HIS_SX=BASE_PREFIX+"PER_HIS_SX_";                                 //个人历史失信被执行人
    //增值服务
    String COMPANY_SER_HOLD=BASE_PREFIX+"SER_HOLD_";                                        //获取控股公司信息
    String COMPANY_SER_HIS_GS=BASE_PREFIX+"SER_HIS_GS_";                                    //历史工商信息
    String COMPANY_SER_HIS_INVESTMENT=BASE_PREFIX+"SER_HIS_INVESTMENT_";                    //历史信息接口->历史对外投资
    String COMPANY_SER_HIS_HOLDER=BASE_PREFIX+"SER_HIS_HOLDER_";                            //历史信息接口->历史股东
    String COMPANY_SER_HIS_SX=BASE_PREFIX+"SER_HIS_SX_";                                    //历史信息接口->历史失信查询
    String COMPANY_SER_HIS_ZX=BASE_PREFIX+"SER_HIS_ZX_";                                    //历史信息接口->历史被执行
    String COMPANY_SER_HIS_COURT=BASE_PREFIX+"SER_HIS_COURT_";                              //历史信息接口->历史法院公告
    String COMPANY_SER_HIS_JUDGMENT=BASE_PREFIX+"SER_HIS_JUDGMENT_";                        //历史信息接口->历史裁判文书
    String COMPANY_SER_HIS_COURTING=BASE_PREFIX+"SER_HIS_COURTING_";                        //历史信息接口->历史开庭公告
    String COMPANY_SER_HIS_CHATTEL=BASE_PREFIX+"SER_HIS_CHATTEL_";                          //历史信息接口->历史动产抵押
    String COMPANY_SER_HIS_STOCK=BASE_PREFIX+"SER_HIS_STOCK_";                              //历史信息接口->历史股权出质
    String COMPANY_SER_HIS_CF=BASE_PREFIX+"SER_HIS_CF_";                                    //历史信息接口->历史行政处罚
    String COMPANY_SER_HIS_XK=BASE_PREFIX+"SER_HIS_XK_";                                    //历史信息接口->历史行政许可
    String COMPANY_SER_DIMENSION=BASE_PREFIX+"SER_DIMENSION_";                              //历史信息接口->历史信息维度条目数
    //法律诉讼
    String COMPANY_LEGAL_COURTING=BASE_PREFIX+"LEGAL_COURTING_";                            //查询开庭公告&开庭公告详情查询
    String COMPANY_LEGAL_JUDGMENT=BASE_PREFIX+"LEGAL_JUDGMENT_";                            //查询裁决文书
    String COMPANY_LEGAL_COURT=BASE_PREFIX+"LEGAL_COURT_";                                  //法院公告列表信息&法院公告详细信息
    String COMPANY_LEGAL_SX_SX=BASE_PREFIX+"LEGAL_SX_SX_";                                  //失信被执行人信息->失信信息&获取失信详细信息
    String COMPANY_LEGAL_SX_ZX=BASE_PREFIX+"LEGAL_SX_ZX_";                                  //失信被执行人信息->被执行信息&获取被执行人详细信息
    String COMPANY_LEGAL_JUDICIAL=BASE_PREFIX+"LEGAL_JUDICIAL_";                            //司法协助查询
    String COMPANY_LEGAL_DIMENSION=BASE_PREFIX+"LEGAL_DIMENSION_";                          //法律诉讼纬度条目数
}
