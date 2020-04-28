package com.estelle.mapper;

import com.estelle.bean.KkRegionD;
import com.estelle.bean.KkRegionDExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KkRegionDMapper {
    int countByExample(KkRegionDExample example);

    int deleteByExample(KkRegionDExample example);

    int insert(KkRegionD record);

    int insertSelective(KkRegionD record);

    List<KkRegionD> selectByExample(KkRegionDExample example);

    int updateByExampleSelective(@Param("record") KkRegionD record, @Param("example") KkRegionDExample example);

    int updateByExample(@Param("record") KkRegionD record, @Param("example") KkRegionDExample example);
    
    List<KkRegionD> selectById(@Param("id")String id);
}