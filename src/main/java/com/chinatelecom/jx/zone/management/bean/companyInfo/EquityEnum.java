package com.chinatelecom.jx.zone.management.bean.companyInfo;

import java.util.Arrays;
import java.util.stream.Collectors;

/**
 * Created by cRAZY on 2019-7-30.
 */
public enum  EquityEnum {
    BRAND(BaseDimension.BRAND,5),
    PATENTS(BaseDimension.PATENTS,"KIND_CODE_DESC",new ScoreMap[]{new ScoreMap("发明公布",10),new ScoreMap("发明授权",10),new ScoreMap("实用新型",15),new ScoreMap("外观设计",5)}),
    CERTIFICATION(BaseDimension.CERTIFICATION,15),
    COPYRIGHT(BaseDimension.COPYRIGHT,5),
    SOFTWARE(BaseDimension.SOFTWARE,5),
    WEB(BaseDimension.WEB,5);

    private BaseDimension equity;
    private Object score;
    private ScoreMap[] scoreMaps;

    EquityEnum(BaseDimension equity, Object score) {
        this.equity = equity;
        this.score = score;
    }

    EquityEnum(BaseDimension equity, Object score,ScoreMap[] scoreMaps) {
        this.equity = equity;
        this.score = score;
        this.scoreMaps = scoreMaps;
    }

    public ScoreMap[] getScoreMaps() {
        return scoreMaps;
    }

    public BaseDimension getEquity() {
        return equity;
    }

    public Object getScore() {
        return score;
    }

    public static Object getScoreByViewName(String viewName){
       return Arrays.stream(EquityEnum.values()).filter(equityEnum -> equityEnum.getEquity().getViewName().equals(viewName)).collect(Collectors.toList()).get(0).getScore();
    }

    public static Integer getScoreByViewNameAndValue(String viewName,String value){
        return Arrays.stream(Arrays.stream(EquityEnum.values()).
                filter(equityEnum -> equityEnum.getEquity().getViewName().equals(viewName)).
                collect(Collectors.toList()).get(0).scoreMaps).
                filter(scoreMap -> scoreMap.value.equals(value)).
                map(scoreMap -> scoreMap.score).
                collect(Collectors.toList()).get(0);
    }

    static class ScoreMap{
        private String value;
        private Integer score;

        ScoreMap(String value, Integer score) {
            this.value = value;
            this.score = score;
        }


    }
}
