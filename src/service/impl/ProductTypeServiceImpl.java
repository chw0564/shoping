package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import constant.shopingConstant;
import dao.ProductMapper;
import dao.ProductTypeMapper;
import entity.Product;
import entity.ProductExample;
import entity.ProductType;
import entity.ProductTypeExample;
import exception.ProductTypeException;
import service.IProductTypeService;

@Service("productTypeService")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ProductTypeServiceImpl implements IProductTypeService{

	@Autowired
	private ProductTypeMapper productTypeMapper;
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<ProductType> findAll() {
		List<ProductType> list = productTypeMapper.selectByExample(null);
		return list;
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public ProductType loadProductTypeById(Integer id) {
		ProductType pt = productTypeMapper.selectByPrimaryKey(id);
		return pt;
	}


	@Override
	public void addProductType(ProductType productType) throws ProductTypeException{
		ProductTypeExample productTypeExample = new ProductTypeExample();
		productTypeExample.createCriteria()
						  .andProducttypenameEqualTo(productType.getProducttypename());
		List<ProductType> list = productTypeMapper.selectByExample(productTypeExample);
		if(list!=null && !list.isEmpty()){
			throw new ProductTypeException("商品类型已存在");
		}
		productTypeMapper.insertSelective(productType);
		
	}
	
	@Override
	public void modfiyProductType(ProductType productType) throws ProductTypeException{
		ProductTypeExample productTypeExample = new ProductTypeExample();
		productTypeExample.createCriteria()
						  .andProducttypenameEqualTo(productType.getProducttypename());
		List<ProductType> list = productTypeMapper.selectByExample(productTypeExample);
		if(list!=null && !list.isEmpty()&& list.get(0).getId()!=productType.getId()){
			throw new ProductTypeException("商品类型已存在");
		}
		productTypeMapper.updateByPrimaryKeySelective(productType);
		
	}

	@Override
	public String changeProductTypeStatus(Integer id) {
		ProductType pt = productTypeMapper.selectByPrimaryKey(id);
		String ptmsg = null;
		if(pt.getProducttypestatus()==shopingConstant.productType.PRODYCT_TYPE_CLOSE){
			pt.setProducttypestatus(shopingConstant.productType.PRODYCT_TYPE_OPEN);
			ptmsg = "启用商品类型成功";
		}else{
			pt.setProducttypestatus(shopingConstant.productType.PRODYCT_TYPE_CLOSE);
			ptmsg = "禁用商品类型成功";
		}
		productTypeMapper.updateByPrimaryKeySelective(pt);
		return ptmsg;
	}

	@Override
	public void deleteProductType(Integer id) throws ProductTypeException {
		ProductExample example = new ProductExample();
		example.createCriteria().andTypeidEqualTo(id);
		List<Product> list = productMapper.selectByExample(example);
		if(list!=null&&!list.isEmpty()){
			throw new ProductTypeException("产品类型以被使用，不能删除");
		}
		productTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<ProductType> findAllOpen() {
		ProductTypeExample example = new ProductTypeExample();
		example.createCriteria()
			   .andProducttypestatusEqualTo(shopingConstant.productType.PRODYCT_TYPE_OPEN);
		List<ProductType> list = productTypeMapper.selectByExample(example);
		return list;
	}
	
}
