package cn.tr.coalgas.entity;

import java.util.Date;

/**
 * 
 * 入库实体类
 * 
 * @author taorun
 * @date 2017年5月26日 下午5:46:52
 *
 */

public class InBound {
	
    private Integer id;
    
    private Integer depotId;

    private Integer truckId;

    private Double amount;

    private Double unitPrice;

    private Double totalPrice;

    private String comfirmPerson;
    
    private Date inBoundDate;

    private String remark;
    
    /**
     * 额外属性
     */
    private String dateTtime;
    
    private String option1;
    
    private String option2;
    
    private String searchText;
    
    private String name; // 原料名称
    
    private String place; // 原料产地
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTruckId() {
        return truckId;
    }

    public void setTruckId(Integer truckId) {
        this.truckId = truckId;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getComfirmPerson() {
        return comfirmPerson;
    }

    public void setComfirmPerson(String comfirmPerson) {
        this.comfirmPerson = comfirmPerson;
    }

    public Date getInBoundDate() {
		return inBoundDate;
	}

	public void setInBoundDate(Date inBoundDate) {
		this.inBoundDate = inBoundDate;
	}

	public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

	public String getDateTtime() {
		return dateTtime;
	}

	public void setDateTtime(String dateTtime) {
		this.dateTtime = dateTtime;
	}

	public Integer getDepotId() {
		return depotId;
	}

	public void setDepotId(Integer depotId) {
		this.depotId = depotId;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

}