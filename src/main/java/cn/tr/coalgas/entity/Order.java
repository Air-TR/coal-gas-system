package cn.tr.coalgas.entity;

import java.util.Date;

/**
 * 
 * 订单实体类
 * 
 * @author taorun
 * @date 2017年5月26日 下午5:47:18
 *
 */

public class Order {
	
    private Integer id;

    private String productName;

    private Double amount;

    private Double unitPrice;

    private Double totalPrice;

    private String address;

    private String purchaser;

    private String confirmPerson;

    private Date date;
    
    private int status;

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

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPurchaser() {
        return purchaser;
    }

    public void setPurchaser(String purchaser) {
        this.purchaser = purchaser;
    }

    public String getConfirmPerson() {
        return confirmPerson;
    }

    public void setConfirmPerson(String confirmPerson) {
        this.confirmPerson = confirmPerson;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", productName=" + productName + ", amount=" + amount + ", unitPrice=" + unitPrice
				+ ", totalPrice=" + totalPrice + ", address=" + address + ", purchaser=" + purchaser
				+ ", confirmPerson=" + confirmPerson + ", date=" + date + ", status=" + status + ", remark=" + remark
				+ ", option1=" + option1 + ", option2=" + option2 + ", searchText=" + searchText + "]";
	}
    
}