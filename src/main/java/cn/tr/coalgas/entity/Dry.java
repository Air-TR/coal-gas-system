package cn.tr.coalgas.entity;

import java.util.Date;

/**
 * 
 * 干燥实体类
 * 
 * @author taorun
 * @date 2017年5月26日 下午5:46:32
 *
 */

public class Dry {
	
    private Integer id;

    private Integer coalDepotId;

    private Double formerAmount;

    private Double laterAmount;
    
    private Double dryPercent;

    private String dryTime;

    private Date date;

    private String confirmPerson;

    private String remark;
    
    /**
     * 额外属性
     */
    private String option1;
    
    private String option2;
    
    private String searchText;
    

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

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCoalDepotId() {
        return coalDepotId;
    }

    public void setCoalDepotId(Integer coalDepotId) {
        this.coalDepotId = coalDepotId;
    }

    public Double getFormerAmount() {
        return formerAmount;
    }

    public void setFormerAmount(Double formerAmount) {
        this.formerAmount = formerAmount;
    }

    public Double getLaterAmount() {
        return laterAmount;
    }

    public void setLaterAmount(Double laterAmount) {
        this.laterAmount = laterAmount;
    }

    public String getDryTime() {
        return dryTime;
    }

    public void setDryTime(String dryTime) {
        this.dryTime = dryTime;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getConfirmPerson() {
        return confirmPerson;
    }

    public void setConfirmPerson(String confirmPerson) {
        this.confirmPerson = confirmPerson;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

	public Double getDryPercent() {
		return dryPercent;
	}

	public void setDryPercent(Double dryPercent) {
		this.dryPercent = dryPercent;
	}

	@Override
	public String toString() {
		return "Dry [id=" + id + ", coalDepotId=" + coalDepotId + ", formerAmount=" + formerAmount + ", laterAmount="
				+ laterAmount + ", dryPercent=" + dryPercent + ", dryTime=" + dryTime + ", date=" + date
				+ ", confirmPerson=" + confirmPerson + ", remark=" + remark + ", option1=" + option1 + ", option2="
				+ option2 + ", searchText=" + searchText + "]";
	}
	
}