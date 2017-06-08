package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import constant.shopingConstant;
import dao.OnlineOrderMapper;
import dao.ProductMapper;
import entity.OnlineOrder;
import entity.OnlineOrderExample;
import entity.Product;
import entity.ProductExample;
import exception.ProductException;
import service.IProductService;
import vo.ProductVO;

@Service("productService")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ProductServiceImpl implements IProductService{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private OnlineOrderMapper onlineOrderMapper;

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<ProductVO> findAllProductOfType() {
		List<ProductVO> list = productMapper.selectProductAndType();
		return list;
	}

	@Override
	public void addNewProduct(Product product) throws ProductException {
		ProductExample example = new ProductExample();
		example.createCriteria().andPronameEqualTo(product.getProname());
		List<Product> list = productMapper.selectByExample(example);
		if(list!=null&&!list.isEmpty()){
			throw new ProductException("商品添加失败，该商品已经存在");
		}
		productMapper.insertSelective(product);
		
	}

	@Override
	public void deleteProduct(Integer id) throws ProductException {
		OnlineOrderExample example = new OnlineOrderExample();
		example.createCriteria().andProductidEqualTo(id);
		List<OnlineOrder> list = onlineOrderMapper.selectByExample(example);
		if(list!=null&&!list.isEmpty()){
			throw new ProductException("该商品存在用户订单，不能删除");
		}
		
		productMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public String changeProductStatus(Integer id) {
		Product product = productMapper.selectByPrimaryKey(id);
		String msg = null;
		if(product.getProstatus()==shopingConstant.Product.PRODUCT_CLOSE){
			product.setProstatus(shopingConstant.Product.PRODUCT_OPEN);
			msg = "商品启销成功";
		}else if(product.getProstatus()==shopingConstant.Product.PRODUCT_OPEN){
			product.setProstatus(shopingConstant.Product.PRODUCT_CLOSE);
			msg = "商品停销|补货成功";
		}
		productMapper.updateByPrimaryKeySelective(product);
		return msg;
		
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Product findProductById(Integer id) {
		Product product = productMapper.selectByPrimaryKey(id);
		return product;
	}

	@Override
	public void modifyProduct(Product product) throws ProductException {
		ProductExample example = new ProductExample();
		example.createCriteria().andPronameEqualTo(product.getProname());
		List<Product> list = productMapper.selectByExample(example);
		if(list!=null&&!list.isEmpty()){
			throw new ProductException("商品修改失败，该商品名称已经存在");
		}
		productMapper.updateByPrimaryKeySelective(product);
		
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<ProductVO> findOpenProductByExam(Integer proStatus,
			Integer proTypeStatus, Integer proTypeId) {
		List<ProductVO> list = productMapper.selectByStatus(proStatus, proTypeStatus, proTypeId);
		return list;
	}
}
