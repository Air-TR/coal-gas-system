package cn.tr.coalgas.entity;

/**
 * 
 * 仓库实体类
 * 
 * @author taorun
 * @date 2017年5月26日 下午5:45:35
 *
 */

public class Depot {
	
    private Integer id;

    private String name;

    private String place;

    private Double heat;

    private Double volatiles;

    private Double water;

    private Double sulphur;

    private Double carbon;

    private Double ash;

    private Double totalAmount;
    
    private Double unitPrice;

    private String confirmPerson;

    private String remark;
    
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

    public Double getHeat() {
        return heat;
    }

    public void setHeat(Double heat) {
        this.heat = heat;
    }

    public Double getVolatiles() {
        return volatiles;
    }

    public void setVolatiles(Double volatiles) {
        this.volatiles = volatiles;
    }

    public Double getWater() {
        return water;
    }

    public void setWater(Double water) {
        this.water = water;
    }

    public Double getSulphur() {
        return sulphur;
    }

    public void setSulphur(Double sulphur) {
        this.sulphur = sulphur;
    }

    public Double getCarbon() {
        return carbon;
    }

    public void setCarbon(Double carbon) {
        this.carbon = carbon;
    }

    public Double getAsh() {
        return ash;
    }

    public void setAsh(Double ash) {
        this.ash = ash;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
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

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
    
}