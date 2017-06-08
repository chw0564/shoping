package service;

import java.util.List;

import entity.ProductType;
import exception.ProductTypeException;

public interface IProductTypeService {
	
	public List<ProductType> findAll();
	
	public void addProductType(ProductType productType) throws ProductTypeException;
	
	public String changeProductTypeStatus(Integer id);
	
	public void deleteProductType(Integer id) throws ProductTypeException;

	public ProductType loadProductTypeById(Integer id);

	public void modfiyProductType(ProductType productType) throws ProductTypeException;
	
	public List<ProductType> findAllOpen();

}
