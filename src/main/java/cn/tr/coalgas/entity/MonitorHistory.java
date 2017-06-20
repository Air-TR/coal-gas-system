package cn.tr.coalgas.entity;

import java.util.Date;

/**
 * 
 * 监控历史实体类
 * 
 * @author taorun
 * @date 2017年5月26日 下午5:47:07
 *
 */

public class MonitorHistory {
	
    private Integer id;

    private Integer furnaceId;

    private Double topTemperature;

    private Double bottomTemperature;

    private String remark;

    private Date date;
    
    /**
     * 额外属性
     */
    private String option1;
    
    private String option2;
    
    private String searchText;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFurnaceId() {
        return furnaceId;
    }

    public void setFurnaceId(Integer furnaceId) {
        this.furnaceId = furnaceId;
    }

    public Double getTopTemperature() {
        return topTemperature;
    }

    public void setTopTemperature(Double topTemperature) {
        this.topTemperature = topTemperature;
    }

    public Double getBottomTemperature() {
        return bottomTemperature;
    }

    public void setBottomTemperature(Double bottomTemperature) {
        this.bottomTemperature = bottomTemperature;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
    
}