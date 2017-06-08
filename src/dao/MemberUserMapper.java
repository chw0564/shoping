package dao;

import entity.MemberUser;
import entity.MemberUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MemberUserMapper {
    
    int countByExample(MemberUserExample example);

    
    int deleteByExample(MemberUserExample example);

    
    int deleteByPrimaryKey(Integer id);

    
    int insert(MemberUser record);

    
    int insertSelective(MemberUser record);

    
    List<MemberUser> selectByExample(MemberUserExample example);

    
    MemberUser selectByPrimaryKey(Integer id);

    
    int updateByExampleSelective(@Param("record") MemberUser record, @Param("example") MemberUserExample example);

    
    int updateByExample(@Param("record") MemberUser record, @Param("example") MemberUserExample example);

    
    int updateByPrimaryKeySelective(MemberUser record);

    
    int updateByPrimaryKey(MemberUser record);
}