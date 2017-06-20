package cn.tr.coalgas.entity;

import java.util.Date;

/**
 * 
 * 员工实体类
 * 
 * @author taorun
 * @date 2017年4月13日 下午4:30:24
 *
 */

public class Staff {
	
    private Integer id;

    private String nickname;

    private String password;
    
    private String name;

    private Integer age;

    private String phone;

    private String email;

    private Integer salary;

    private String position;
    
    private String department;

    private String role;

    private Date registerDate;

    private String confirmPerson;

    private String introduction;
    
    /**
     * 额外属性
     */
    private String repeatPassword;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getConfirmPerson() {
        return confirmPerson;
    }

    public void setConfirmPerson(String confirmPerson) {
        this.confirmPerson = confirmPerson;
    }

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getRepeatPassword() {
		return repeatPassword;
	}

	public void setRepeatPassword(String repeatPassword) {
		this.repeatPassword = repeatPassword;
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", nickname=" + nickname + ", password=" + password + ", repeatPassword="
				+ repeatPassword + ", name=" + name + ", age=" + age + ", phone=" + phone + ", email=" + email
				+ ", salary=" + salary + ", position=" + position + ", role=" + role + ", registerDate=" + registerDate
				+ ", confirmPerson=" + confirmPerson + ", introduction=" + introduction + "]";
	}
    
}