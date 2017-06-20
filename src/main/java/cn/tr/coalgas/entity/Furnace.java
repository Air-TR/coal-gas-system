package cn.tr.coalgas.entity;

import java.util.Date;

/**
 * 
 * 煤炉实体类
 * 
 * @author taorun
 * @date 2017年4月16日 下午6:57:46
 *
 */

public class Furnace {
	
    private Integer id;

    private Double coalAmount;

    private Double gasAgent;

    private String carbonizationTime;

    private Double topTemperature;

    private Double bottomTemperature;

    private Double tarAmount;

    private Double topCoalGas;

    private Double bottomCoalGas;

    private Date date;

    private String confirmPerson;

    private String remark;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getCoalAmount() {
        return coalAmount;
    }

    public void setCoalAmount(Double coalAmount) {
        this.coalAmount = coalAmount;
    }

    public Double getGasAgent() {
        return gasAgent;
    }

    public void setGasAgent(Double gasAgent) {
        this.gasAgent = gasAgent;
    }

    public String getCarbonizationTime() {
		return carbonizationTime;
	}

	public void setCarbonizationTime(String carbonizationTime) {
		this.carbonizationTime = carbonizationTime;
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

    public Double getTarAmount() {
        return tarAmount;
    }

    public void setTarAmount(Double tarAmount) {
        this.tarAmount = tarAmount;
    }

    public Double getTopCoalGas() {
        return topCoalGas;
    }

    public void setTopCoalGas(Double topCoalGas) {
        this.topCoalGas = topCoalGas;
    }

    public Double getBottomCoalGas() {
        return bottomCoalGas;
    }

    public void setBottomCoalGas(Double bottomCoalGas) {
        this.bottomCoalGas = bottomCoalGas;
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
    
}