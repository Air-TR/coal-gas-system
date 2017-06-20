package cn.tr.coalgas.entity;

/**
 * 
 * 产品实体类
 * 
 * @author taorun
 * @date 2017年5月26日 下午5:47:41
 *
 */

public class Product {
	
    private Integer id;

    private String name;

    private Double amount;
    
    private Double unitPrice;
    
    private Double totalPrice;
    
    private String level;
    
    private String heat;

    private String confirmPerson;

    private String remark;
    

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

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
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

	public String getHeat() {
		return heat;
	}

	public void setHeat(String heat) {
		this.heat = heat;
	}
    
}