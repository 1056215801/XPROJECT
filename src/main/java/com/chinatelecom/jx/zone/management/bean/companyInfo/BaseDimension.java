package com.chinatelecom.jx.zone.management.bean.companyInfo;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by cRAZY on 2019/7/3.
 */
public enum BaseDimension {
    EXCEPTIONS
            (
                "经营异常",

                new TablePair[]{
                        new TablePair("X_DATA.Z_S_EXCEPTIONS","经营异常","ADD_DATE")
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_S_EXCEPTIONS"),
                        new FieldPair("ADD_REASON","列入经营异常原因","X_DATA.Z_S_EXCEPTIONS"),
                        new FieldPair("ADD_DATE","列入日期","X_DATA.Z_S_EXCEPTIONS"),
                        new FieldPair("ROMOVE_REASON","移除经营异常原因","X_DATA.Z_S_EXCEPTIONS"),
                        new FieldPair("REMOVE_DATE","移出日期","X_DATA.Z_S_EXCEPTIONS"),
                        new FieldPair("DECISION_OFFICE","做出决定机关","X_DATA.Z_S_EXCEPTIONS")
                },

                "RISK"

            ),
    LIQUIDATION
            (
                "清算信息",

                new TablePair[]{
                        new TablePair("X_DATA.Z_S_LIQUIDATION","清算信息",null)
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_S_LIQUIDATION"),
                        new FieldPair("LEADER","清算组负责人","X_DATA.Z_S_LIQUIDATION"),
                        new FieldPair("MEMBER","清算组成员","X_DATA.Z_S_LIQUIDATION")
                },

                "RISK"

            ),
    MORTGAGE
            (
                "抵押风险",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_CHATTEL_RESULT","动产抵押","REGISTER_DATE"),
                        new TablePair("X_DATA.Z_RISK_LAND_RESULT","土地抵押","ON_BOARD_START_TIME")
                },

                new FieldPair[]{
                        //动产抵押
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        new FieldPair("REGISTER_NO","登记编号","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        new FieldPair("REGISTER_DATE","登记时间","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        new FieldPair("PUBLIC_DATE","公示时间","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        new FieldPair("REGISTER_OFFICE","登记机关","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        new FieldPair("DEBT_SECURED_AMOUNT","被担保债权数额","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        new FieldPair("STATUS","状态","X_DATA.Z_RISK_CHATTEL_RESULT"),
                        //土地抵押
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_LAND_RESULT"),
                        new FieldPair("ADDRESS","土地坐落","X_DATA.Z_RISK_LAND_RESULT"),
                        new FieldPair("ON_BOARD_START_TIME","土地抵押起始时间","X_DATA.Z_RISK_LAND_RESULT"),
                        new FieldPair("ON_BOARD_END_TIME","土地抵押结束时间","X_DATA.Z_RISK_LAND_RESULT"),
                        new FieldPair("ADMINISTRATIVE_AREA","行政区","X_DATA.Z_RISK_LAND_RESULT"),
                        new FieldPair("ACREAGE","抵押面积","X_DATA.Z_RISK_LAND_RESULT"),
                        new FieldPair("MORTGAGE_PURPOSE","抵押土地用途","X_DATA.Z_RISK_LAND_RESULT")
                },

                "RISK"

            ),
    TAX
            (
                "税收风险",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_OWE_RESULT","欠税公告","PUBLISH_DATE"),
                        new TablePair("X_DATA.Z_RISK_ILLEGAL_RESULT","税收违法","PUBLISH_TIME")
                },

                new FieldPair[]{
                        //欠税公告
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_OWE_RESULT"),
                        new FieldPair("CATEGORY","欠税税种","X_DATA.Z_RISK_OWE_RESULT"),
                        new FieldPair("BALANCE","欠税余额","X_DATA.Z_RISK_OWE_RESULT"),
                        new FieldPair("NEW_BAL","当前新发生欠税","X_DATA.Z_RISK_OWE_RESULT"),
                        new FieldPair("ISSUED_BY","发布单位","X_DATA.Z_RISK_OWE_RESULT"),
                        new FieldPair("PUBLISH_DATE","发布日期","X_DATA.Z_RISK_OWE_RESULT"),
                        //税收违法
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_ILLEGAL_RESULT"),
                        new FieldPair("PUBLISH_TIME","发布时间","X_DATA.Z_RISK_ILLEGAL_RESULT"),
                        new FieldPair("TAX_GOV","所属税务机关","X_DATA.Z_RISK_ILLEGAL_RESULT"),
                        new FieldPair("CASE_NATURE","案件性质","X_DATA.Z_RISK_ILLEGAL_RESULT")
                },

                "RISK"

            ),
    SX
            (
                "失信风险",

                new TablePair[]{
                        new TablePair("X_DATA.Z_LEGAL_SX_SX_RESULT","失信被执行人","PUBLICDATE"),
                        new TablePair("X_DATA.Z_LEGAL_SX_ZX_RESULT","被执行人信息","LIANDATE")
                },

                new FieldPair[]{
                        //失信信息(失信被执行人)
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        new FieldPair("ANNO","案件编号","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        new FieldPair("EXECUTESTATUS","被执行人的履行情况","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        new FieldPair("YIWU","法律生效文书确定的义务","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        new FieldPair("EXECUTEGOV","执行法院","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        new FieldPair("EXECUTEUNITE","作出执行依据单位","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        new FieldPair("PUBLICDATE","发布时间","X_DATA.Z_LEGAL_SX_SX_RESULT"),
                        //被执行人信息
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_LEGAL_SX_ZX_RESULT"),
                        new FieldPair("ANNO","案号","X_DATA.Z_LEGAL_SX_ZX_RESULT"),
                        new FieldPair("EXECUTE_GOV","执行法院","X_DATA.Z_LEGAL_SX_ZX_RESULT"),
                        new FieldPair("LIANDATE","立案时间","X_DATA.Z_LEGAL_SX_ZX_RESULT"),
                        new FieldPair("BIAODI","执行标的","X_DATA.Z_LEGAL_SX_ZX_RESULT")

                },

                "RISK"

            ),
    PENALTY
            (
                "行政处罚",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_PENALTY_CN_RESULT","信用中国","DECIDE_DATE"),
                        new TablePair("X_DATA.Z_RISK_PENALTY_GS_RESULT","工商局","PENALTY_DATE")
                },

                new FieldPair[]{
                        //行政处罚:信用中国
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_PENALTY_CN_RESULT"),
                        new FieldPair("CASE_NO","案号","X_DATA.Z_RISK_PENALTY_CN_RESULT"),
                        new FieldPair("NAME","处罚名称","X_DATA.Z_RISK_PENALTY_CN_RESULT"),
                        new FieldPair("EXECUTE_GOV","处罚机关","X_DATA.Z_RISK_PENALTY_CN_RESULT"),
                        new FieldPair("DECIDE_DATE","决定时间","X_DATA.Z_RISK_PENALTY_CN_RESULT"),

                        //行政处罚:工商局
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_PENALTY_GS_RESULT"),
                        new FieldPair("DOC_NO","书文号","X_DATA.Z_RISK_PENALTY_GS_RESULT"),
                        new FieldPair("PENALTY_TYPE","违法行为类型","X_DATA.Z_RISK_PENALTY_GS_RESULT"),
                        new FieldPair("CONTENT","行政处罚内容","X_DATA.Z_RISK_PENALTY_GS_RESULT"),
                        new FieldPair("OFFICE_NAME","处罚决定机关","X_DATA.Z_RISK_PENALTY_GS_RESULT"),
                        new FieldPair("PENALTY_DATE","处罚决定时间","X_DATA.Z_RISK_PENALTY_GS_RESULT")

                },

                "RISK"

            ),
    ENV
            (
                "环保处罚",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_ENV_RESULT","环保处罚","PUNISH_DATE")
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("CASE_NO","决定书文号","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("ILLEGAL_TYPE","违法类型","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("PUNISH_REASON","处罚事由","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("PUNISH_BASIS","处罚依据","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("PUNISHMENT_RESULT","处罚结果","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("PUNISH_DATE","处罚日期","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("PUNISH_GOV","处罚单位","X_DATA.Z_RISK_ENV_RESULT"),
                        new FieldPair("IMPLEMENTATION","执行情况","X_DATA.Z_RISK_ENV_RESULT")
                },

                "RISK"

            ),
    VIOLATION
            (
                "严重违法",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_VIOLATION_RESULT","严重违法","ADD_DATE")
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_VIOLATION_RESULT"),
                        new FieldPair("ADD_REASON","列入严重违法原因","X_DATA.Z_RISK_VIOLATION_RESULT"),
                        new FieldPair("ADD_DATE","列入日期","X_DATA.Z_RISK_VIOLATION_RESULT"),
                        new FieldPair("ADD_OFFICE","列入决定机关","X_DATA.Z_RISK_VIOLATION_RESULT"),
                        new FieldPair("REMOVE_REASON","移出严重违法原因","X_DATA.Z_RISK_VIOLATION_RESULT"),
                        new FieldPair("REMOVE_DATE","移出日期","X_DATA.Z_RISK_VIOLATION_RESULT"),
                        new FieldPair("REMOVE_OFFICE","移出决定机关","X_DATA.Z_RISK_VIOLATION_RESULT")
                },

                "RISK"

            ),
    NOTICE
            (
                "公示催告",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_NOTICE_RESULT","公示催告","PUBLISH_DATE")
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_NOTICE_RESULT"),
                        new FieldPair("BILL_NO","票号","X_DATA.Z_RISK_NOTICE_RESULT"),
                        new FieldPair("BILL_TYPE","票据类型","X_DATA.Z_RISK_NOTICE_RESULT"),
                        new FieldPair("APPLY_COM_NAME/Name","申请人","X_DATA.Z_RISK_NOTICE_RESULT"),
                        new FieldPair("BILL_AMT","票面金额","X_DATA.Z_RISK_NOTICE_RESULT"),
                        new FieldPair("PUBLISH_DATE","公告日期","X_DATA.Z_RISK_NOTICE_RESULT")
                },

                "RISK"

            ),
    STOCK
            (
                "股权出质",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_STOCK_RESULT","股权出质","REG_DATE")
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_STOCK_RESULT"),
                        new FieldPair("REGIST_NO","登记编号","X_DATA.Z_RISK_STOCK_RESULT"),
                        new FieldPair("PLEDGEE_INFO/Name","质权人","X_DATA.Z_RISK_STOCK_RESULT"),
                        new FieldPair("PLEDGOR_INFO/Name","出质人","X_DATA.Z_RISK_STOCK_RESULT"),
                        new FieldPair("PLEDGED_AMOUNT","出质股权数","X_DATA.Z_RISK_STOCK_RESULT"),
                        new FieldPair("STATUS","状态","X_DATA.Z_RISK_STOCK_RESULT"),
                        new FieldPair("REG_DATE","批准日期","X_DATA.Z_RISK_STOCK_RESULT")
                },

                "RISK"

            ),
    CANCEL
            (
                "简易注销",

                new TablePair[]{
                        new TablePair("X_DATA.Z_RISK_CANCEL_RESULT","简易注销","PUBLIC_DATE"),
                        new TablePair("X_DATA.Z_RISK_CANCEL_DISSENT_LIST","简易注销异议",false,"DISSENT_DATE"),
                        new TablePair("X_DATA.Z_RISK_CANCEL_RESULT_LIST","简易注销结果",false,"PUBLIC_DATE")
                },

                new FieldPair[]{
                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_CANCEL_RESULT"),
                        new FieldPair("REGISTRATION","登记机关","X_DATA.Z_RISK_CANCEL_RESULT"),
                        new FieldPair("PUBLIC_DATE","公告期","X_DATA.Z_RISK_CANCEL_RESULT"),

                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_CANCEL_DISSENT_LIST"),
                        new FieldPair("DISSENT_PERSON","异议申请人","X_DATA.Z_RISK_CANCEL_DISSENT_LIST"),
                        new FieldPair("DISSENT_DATE","异议时间","X_DATA.Z_RISK_CANCEL_DISSENT_LIST"),
                        new FieldPair("DISSENT_CONTENT","异议内容","X_DATA.Z_RISK_CANCEL_DISSENT_LIST"),

                        new FieldPair("PRIMARY_ID","PRIMARY_ID","X_DATA.Z_RISK_CANCEL_RESULT_LIST"),
                        new FieldPair("RESULT_CONTENT","简易注销结果","X_DATA.Z_RISK_CANCEL_RESULT_LIST"),
                        new FieldPair("PUBLIC_DATE","公告申请日期","X_DATA.Z_RISK_CANCEL_RESULT_LIST")
                },

                "RISK",

                true

            ),
    BASE_INFO
            (
                "企业工商信息详情",

                new BaseDimension.TablePair[]{
                        new BaseDimension.TablePair("X_DATA.Z_S_RESULT","企业工商信息详情","CHECK_DATE"),
                        new BaseDimension.TablePair("X_DATA.Z_S_INDUSTRY","行业信息",null),
                        new BaseDimension.TablePair("X_DATA.Z_S_CONTACT_INFO","联系信息",null),
                        new BaseDimension.TablePair("X_DATA.Z_S_WEB_SITE","网站信息",null),
                        new BaseDimension.TablePair("X_DATA.Z_S_EMPLOYEES","主要人员",null),
                        new BaseDimension.TablePair("X_DATA.Z_FI_EXTRA_INTRODUCTION_RESULT","附加信息",null)
                },

                new BaseDimension.FieldPair[]{
                    new BaseDimension.FieldPair("NAME","企业名称","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("NO","工商注册号","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("CREDIT_CODE","统一社会信用代码","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("OPER_NAME","法定代表人","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("ORG_NO","组织机构代码","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("REGIST_CAPI","注册资本","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("ENT_TYPE","企业类型","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("STATUS","经营状态","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("START_DATE","成立日期","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("CHECK_DATE","核准日期","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("TERM_START","营业期限始","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("TEAM_END","营业期限至","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("BELONG_ORG","登记机关","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("ADDRESS","注册地址","X_DATA.Z_S_RESULT"),
                    new BaseDimension.FieldPair("SCOPE","经营范围","X_DATA.Z_S_RESULT"),

                    new BaseDimension.FieldPair("SUB_INDUSTRY","所属行业","X_DATA.Z_S_INDUSTRY"),

                    new BaseDimension.FieldPair("PHONE_NUMBER","电话","X_DATA.Z_S_CONTACT_INFO"),
                    new BaseDimension.FieldPair("EMAIL","邮箱","X_DATA.Z_S_CONTACT_INFO"),

                    new BaseDimension.FieldPair("URL","网址","X_DATA.Z_S_WEB_SITE"),

                    new BaseDimension.FieldPair("NAME","姓名","X_DATA.Z_S_EMPLOYEES"),
                    new BaseDimension.FieldPair("JOB","职务","X_DATA.Z_S_EMPLOYEES"),

                    //new RiskDimension.FieldPair("","关联企业数量",""),
                    new BaseDimension.FieldPair("CONTENT","公司简介","X_DATA.Z_FI_EXTRA_INTRODUCTION_RESULT")
                },

                "BASE"

            ),
    ASSOCIATION
            (
                "企业关联图谱",

                new TablePair[]{
                    new TablePair("X_DATA.Z_S_PARTNERS","企业关联图谱","SHOUD_DATE")
                },

                new FieldPair[]{
                    new FieldPair("STOCK_NAME","投资人","X_DATA.Z_S_PARTNERS"),
                    new FieldPair("STOCK_PERCENT","出资比例","X_DATA.Z_S_PARTNERS"),
                    new FieldPair("SHOUD_DATE","认缴出资时间","X_DATA.Z_S_PARTNERS"),
                    new FieldPair("SHOULD_CAPI","认缴出资额","X_DATA.Z_S_PARTNERS"),
                    new FieldPair("STOCK_TYPE","投资人类型","X_DATA.Z_S_PARTNERS")

                },

                "BASE"

            ),

    REPORT
            (
                "企业年报",

                new TablePair[]{
                    new TablePair("X_DATA.Z_INFO_REPORT_RESULT","年报年份","PUBLISH_DATE"),
                    new TablePair("X_DATA.Z_INFO_REPORT_ASSETS_DATA","企业资产状况信息","YEAR"),
                    new TablePair("X_DATA.Z_INFO_REPORT_PARTNER","年度报告","YEAR")
                },

                new FieldPair[]{
                    new FieldPair("PUBLISH_DATE","发布日期","X_DATA.Z_INFO_REPORT_RESULT"),
                    new FieldPair("YEAR","年份","X_DATA.Z_INFO_REPORT_RESULT"),

                    new FieldPair("TOTAL_ASSETS","资产总额","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("MAIN_BUSINESS_INCOME","营业总收入中主营业务收入","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("TOTAL_OWNERS_EQUITY","所有者权益合计","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("NET_PROFIT","净利润","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("GROSS_TRADING_INCOME","营业总收入","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("TOTAL_TAX_AMOUNT","纳税总额","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("TOTAL_PROFIT","利润总额","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("TOTAL_LIABILITIES","负债总额","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),
                    new FieldPair("YEAR","年份","X_DATA.Z_INFO_REPORT_ASSETS_DATA"),

                    new FieldPair("NAME","发起人","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("SHOULD_CAPI","认缴金额","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("SHOULD_DATE","认缴出资时间","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("SHOULD_TYPE","认缴方式","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("REAL_CAPI","实缴金额","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("REAL_DATE","实缴出资时间","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("REAL_TYPE","实缴方式","X_DATA.Z_INFO_REPORT_PARTNER"),
                    new FieldPair("YEAR","年份","X_DATA.Z_INFO_REPORT_PARTNER"),
                },

                "BASE"

            ),

    BRAND
            (
                    "商标",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_KNOW_BRAND_RESULT","商标","APP_DATE")
                    },

                    new FieldPair[]{
                            new FieldPair("IMAGE_URL","商标","X_DATA.Z_KNOW_BRAND_RESULT"),
                            new FieldPair("REG_NO","注册号","X_DATA.Z_KNOW_BRAND_RESULT"),
                            new FieldPair("FLOW_STATUS_DESC","状态","X_DATA.Z_KNOW_BRAND_RESULT"),
                            new FieldPair("APP_DATE","申请时间","X_DATA.Z_KNOW_BRAND_RESULT")
                    },

                    "EQUITY"
            ),

    PATENTS
            (
                    "专利",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_KNOW_PATENTS_RESULT","专利","PUBLICATION_DATE")
                    },

                    new FieldPair[]{
                            new FieldPair("TITLE","标题","X_DATA.Z_KNOW_PATENTS_RESULT"),
                            new FieldPair("KIND_CODE_DESC","专利类型","X_DATA.Z_KNOW_PATENTS_RESULT"),
                            new FieldPair("APPLICATION_NUMBER","申请号","X_DATA.Z_KNOW_PATENTS_RESULT"),
                            new FieldPair("LEGAL_STATUS_DESC","法律状态","X_DATA.Z_KNOW_PATENTS_RESULT"),
                            new FieldPair("APPLICATION_DATE","申请日期","X_DATA.Z_KNOW_PATENTS_RESULT"),
                            new FieldPair("PUBLICATION_DATE","授权公布日期","X_DATA.Z_KNOW_PATENTS_RESULT")
                    },

                    "EQUITY"
            ),

    CERTIFICATION
            (
                    "证书资质",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_KNOW_CERTIFICATION_RESULT","证书资质","START_DATE")
                    },

                    new FieldPair[]{
                            new FieldPair("NAME","名称","X_DATA.Z_KNOW_CERTIFICATION_RESULT"),
                            new FieldPair("TYPE","类型","X_DATA.Z_KNOW_CERTIFICATION_RESULT"),
                            new FieldPair("START_DATE","发证日期","X_DATA.Z_KNOW_CERTIFICATION_RESULT"),
                            new FieldPair("END_DATE","截止日期","X_DATA.Z_KNOW_CERTIFICATION_RESULT"),
                            new FieldPair("NO","证书编号","X_DATA.Z_KNOW_CERTIFICATION_RESULT")
                    },

                    "EQUITY"
            ),

    COPYRIGHT
            (
                    "作品著作",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_KNOW_COPYRIGHT_RESULT","作品著作","REGISTER_DATE")
                    },

                    new FieldPair[]{
                            new FieldPair("NAME","作品名称","X_DATA.Z_KNOW_COPYRIGHT_RESULT"),
                            new FieldPair("REGISTER_NO","登记号","X_DATA.Z_KNOW_COPYRIGHT_RESULT"),
                            new FieldPair("REGISTER_DATE","登记日期","X_DATA.Z_KNOW_COPYRIGHT_RESULT"),
                            new FieldPair("CATEGORY","类型","X_DATA.Z_KNOW_COPYRIGHT_RESULT"),
                            new FieldPair("PUBLISH_DATE","首次发表日期","X_DATA.Z_KNOW_COPYRIGHT_RESULT")
                    },

                    "EQUITY"
            ),

    SOFTWARE
            (
                    "软件著作",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_KNOW_SOFTWARE_RESULT","软件著作","REGISTER_APER_DATE")
                    },

                    new FieldPair[]{
                            new FieldPair("NAME","软件名称","X_DATA.Z_KNOW_SOFTWARE_RESULT"),
                            new FieldPair("REGISTER_NO","登记号","X_DATA.Z_KNOW_SOFTWARE_RESULT"),
                            new FieldPair("REGISTER_APER_DATE","登记批准日期","X_DATA.Z_KNOW_SOFTWARE_RESULT"),
                            new FieldPair("VERSION_NO","版本号","X_DATA.Z_KNOW_SOFTWARE_RESULT")
                    },

                    "EQUITY"
            ),

    WEB
            (
                    "网站域名  {统计类型} ",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_KNOW_WEB_RESULT","网站域名","SDATE")
                    },

                    new FieldPair[]{
                            new FieldPair("YU_MING","域名","X_DATA.Z_KNOW_WEB_RESULT"),
                            new FieldPair("BEI_AN","备案号","X_DATA.Z_KNOW_WEB_RESULT"),
                            new FieldPair("HOME_SITE","网站名称","X_DATA.Z_KNOW_WEB_RESULT"),
                            new FieldPair("SDATE","审核时间","X_DATA.Z_KNOW_WEB_RESULT")
                    },

                    "EQUITY"
            ),

    INVEST
            (
                    "投资企业",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_INFO_INVESTMENT_RESULT","投资企业","START_DATE")
                    },

                    new FieldPair[]{
                            new FieldPair("NAME","企业名称","X_DATA.Z_INFO_INVESTMENT_RESULT"),
                            new FieldPair("FUNDED_RATIO","出资比率","X_DATA.Z_INFO_INVESTMENT_RESULT"),
                            new FieldPair("REGIST_CAPI","注册资本","X_DATA.Z_INFO_INVESTMENT_RESULT")
                    },

                    "INVEST"
            ),

    HOLD
            (
                    "控股企业",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_SER_HOLD_RESULT","控股企业","START_DATE")
                    },

                    new FieldPair[]{
                    },

                    "INVEST"
            ),

    PARTNERS
            (
                    "股东信息",

                    new TablePair[]{
                            new TablePair("X_DATA.Z_S_PARTNERS","股东信息",null)
                    },

                    new FieldPair[]{
                            new FieldPair("STOCK_NAME","投资人","X_DATA.Z_S_PARTNERS"),
                            new FieldPair("STOCK_PERCENT","出资比率","X_DATA.Z_S_PARTNERS"),
                            new FieldPair("SHOULD_CAPI","实缴出资额","X_DATA.Z_S_PARTNERS")
                    },

                    "INVEST"
            )
    ;


    private String viewName;
    private TablePair[] tableList;
    private FieldPair[] fieldList;
    private String dimension;
    private Boolean reduce = false;

    BaseDimension(String viewName, TablePair[] tableName, FieldPair[] fieldList ,String dimension,boolean reduce) {
        this.viewName = viewName;
        this.tableList = tableName;
        this.fieldList = fieldList;
        this.dimension = dimension;
        this.reduce = reduce;
    }

    BaseDimension(String viewName, TablePair[] tableName, FieldPair[] fieldList, String dimension) {
        this.viewName = viewName;
        this.tableList = tableName;
        this.fieldList = fieldList;
        this.dimension = dimension;
    }

    public Boolean getReduce() {
        return reduce;
    }

    public String getViewName() {
        return viewName;
    }

    public TablePair[] getTableList() {
        return tableList;
    }

    public FieldPair[] getFieldList() {
        return fieldList;
    }

    public String getDimension() {
        return dimension;
    }

    public void setDimension(String dimension) {
        this.dimension = dimension;
    }

    public static BaseDimension findByViewName(String viewName){
       List<BaseDimension> already=Arrays.stream(BaseDimension.values())
                .filter(dimensionTypeEnum -> dimensionTypeEnum.viewName.equals(viewName))
                .collect(Collectors.toList());
       return already.size() == 0 ? null:already.get(0);
    }

    public static BaseDimension findByTableName(String tableName){
        return Arrays.stream(BaseDimension.values())
                .filter(dimensionTypeEnum -> Arrays.stream(dimensionTypeEnum.getTableList()).map(TablePair::getTableName).collect(Collectors.toList()).contains(tableName))
                .collect(Collectors.toList()).get(0);
    }

    public static String getFieldDescByFieldAndTable(String fieldName,String tableName){
        return Arrays.stream(findByTableName(tableName).getFieldList())
                .filter(fieldPair -> !fieldPair.getFieldName().contains("/")?
                        fieldPair.getFieldName().equals(fieldName) && fieldPair.getTable().equals(tableName):
                        fieldName.equals(fieldPair.getFieldName().split("/")[0]) && fieldPair.getTable().equals(tableName))
                .collect(Collectors.toList())
                .get(0).getFieldDesc();
    }

    public static String getTableDescByTableName(String tableName){
        return Arrays.stream(findByTableName(tableName).getTableList())
                .filter(tablePair -> tablePair.getTableName().equals(tableName) )
                .collect(Collectors.toList())
                .get(0).getTableDesc();
    }

    public static class TablePair {
        private String tableName;
        private String tableDesc;
        private boolean isCount = true;
        private String dateField;

        public boolean isCount() {
            return isCount;
        }

        public String getTableName() {
            return tableName;
        }

        public String getTableDesc() {
            return tableDesc;
        }

        TablePair(String tableName, String tableDesc,boolean isCount,String dateField) {
            this.tableName = tableName;
            this.tableDesc = tableDesc;
            this.isCount = isCount;
            this.dateField = dateField;
        }

        TablePair(String tableName, String tableDesc,String dateField) {
            this.tableName = tableName;
            this.tableDesc = tableDesc;
            this.dateField = dateField;
        }

        public String getDateField() {
            return dateField;
        }
    }

    public static class FieldPair {
        FieldPair(String fieldName, String fieldDesc, String table){
            this.fieldName = fieldName;
            this.fieldDesc = fieldDesc;
            this.table = table;
        }

        private String fieldName;
        private String fieldDesc;
        private String table;


        public String getTable() {
            return table;
        }

        public String getFieldName() {
            return fieldName;
        }

        public String getFieldDesc() {
            return fieldDesc;
        }
    }
}
