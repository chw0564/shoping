package service;

import java.util.List;

import vo.ProductVO;
import entity.Product;
import exception.ProductException;

public interface IProductService {

	public List<ProductVO> findAllProductOfType();
	
	public void addNewProduct(Product product) throws ProductException;
	
	public void modifyProduct(Product product) throws ProductException;
	
	public void deleteProduct(Integer id) throws ProductException;
	
	public String changeProductStatus(Integer id);
	
	public Product findProductById(Integer id);
	
	public List<ProductVO> findOpenProductByExam(Integer proStatus,Integer proTypeStatus,Integer proTypeId);
	
}
