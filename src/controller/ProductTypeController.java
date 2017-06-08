package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import constant.shopingConstant;
import entity.ProductType;
import exception.ProductTypeException;
import service.IProductTypeService;
import util.AjaxResult;

@Controller
@RequestMapping("/ProductTypeController")
public class ProductTypeController {
	
	@Autowired
	private IProductTypeService productTypeService; 
	
	@RequestMapping("/loadData")
	public ModelAndView loadData(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductType> list = productTypeService.findAll();
		map.put("ptlist", list);
		map.put("ptclose", shopingConstant.productType.PRODYCT_TYPE_CLOSE);
		return new ModelAndView("back/productType",map);
	}
	
	@ResponseBody
	@RequestMapping("/loadAjaxData")
	public AjaxResult loadAjaxData(){
		List<ProductType> list = productTypeService.findAll();
		return new AjaxResult(true, shopingConstant.productType.PRODYCT_TYPE_CLOSE+"", list);
	}
	
	@RequestMapping("/productTypeAdd")
	@ResponseBody
	public AjaxResult productTypeAdd(ProductType productType){
		productType.setProducttypestatus(shopingConstant.productType.PRODYCT_TYPE_CLOSE);
		AjaxResult ajaxResult = new AjaxResult();
		try {
			productTypeService.addProductType(productType);
			ajaxResult.setFlag(true);
			ajaxResult.setMsg("产品添加成功");
		} catch (ProductTypeException e) {
			e.printStackTrace();
			ajaxResult.setFlag(false);
			ajaxResult.setMsg("产品添加失败");
		}
		
		return ajaxResult;
	}
	
	@RequestMapping("/changeProductTypeStatus")
	@ResponseBody
	public AjaxResult changeProductTypeStatus(Integer id){
		String ptmsg = productTypeService.changeProductTypeStatus(id);
		return new AjaxResult(true, ptmsg, null);
	}
	
	@RequestMapping("/deleteProductType")
	@ResponseBody
	public AjaxResult deleteProductType(Integer id){
		AjaxResult ajaxResult = null;
		try {
			productTypeService.deleteProductType(id);
			ajaxResult = new AjaxResult(true, "删除产品成功", null);
		} catch (ProductTypeException e) {
			ajaxResult = new AjaxResult(false, e.getMessage(), null);
		}
		return ajaxResult;
	}
	
	@RequestMapping("/loadPtById")
	@ResponseBody
	public AjaxResult loadProductTypeById(Integer id){
		ProductType pt = productTypeService.loadProductTypeById(id);
		return new AjaxResult(true, "加载成功", pt);
	}
	
	@RequestMapping("/modifyProductType")
	@ResponseBody
	public AjaxResult modifyProductType(ProductType productType){
		AjaxResult ajaxResult = null;
		try {
			productTypeService.modfiyProductType(productType);
			ajaxResult = new AjaxResult(true, "产品修改成功", null);
		} catch (ProductTypeException e) {
			ajaxResult = new AjaxResult(true, e.getMessage(), null);
		}
		return ajaxResult;
	}
	
}
