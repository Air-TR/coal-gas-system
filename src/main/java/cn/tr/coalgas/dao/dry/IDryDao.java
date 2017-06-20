package cn.tr.coalgas.dao.dry;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Dry;

@Repository
public interface IDryDao {
	
    int deleteById(Integer id);

    int insert(Dry record);

    Dry selectById(Integer id);

    int updateById(Dry record);
    
    List<Dry> selectList(Dry dry);
    
}