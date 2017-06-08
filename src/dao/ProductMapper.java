package dao;

import entity.Product;
import entity.ProductExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.ProductVO;

public interface ProductMapper {
    
    int countByExample(ProductExample example);

    
    int deleteByExample(ProductExample example);

    
    int deleteByPrimaryKey(Integer id);

    
    int insert(Product record);

    
    int insertSelective(Product record);

    
    List<Product> selectByExample(ProductExample example);

    
    Product selectByPrimaryKey(Integer id);

    
    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    
    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    
    int updateByPrimaryKeySelective(Product record);

    
    int updateByPrimaryKey(Product record);
    
    List<ProductVO> selectProductAndType();
    
    List<ProductVO> selectByStatus(@Param("proStatus")Integer proStatus,@Param("proTypeStatus")Integer proTypeStatus,@Param("proTypeId")Integer proTypeId);
}