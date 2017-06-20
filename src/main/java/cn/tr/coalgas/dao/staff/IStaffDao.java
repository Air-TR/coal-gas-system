package cn.tr.coalgas.dao.staff;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Staff;

/**
 * 
 * 员工数据层接口
 * 
 * @author taorun
 * @date 2017年4月13日 下午4:38:27
 *
 */

@Repository
public interface IStaffDao {
	
    int deleteById(Integer id);

    int insert(Staff staff);
    
    Staff selectById(Integer id);

    Staff selectByEmailOrPhone(Staff staff);
    
    Staff selectByEmail(String email);
    
    Staff selectByPhone(String phone);

    void updateById(Staff staff);

	void updatePasswordById(Staff staff);
	
	List<Staff> selectList();
    
}
