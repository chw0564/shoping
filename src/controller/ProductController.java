package controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import constant.shopingConstant;
import entity.Product;
import exception.ProductException;
import service.IProductService;
import util.AjaxResult;
import vo.ProductVO;

@Controller
@RequestMapping("/ProductController")
public class ProductController {

	@Autowired
	private IProductService productService;
	
	@RequestMapping("/loadData")
	public ModelAndView loadData(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<ProductVO> list = productService.findAllProductOfType();
		map.put("plist", list);
		map.put("pstatus", shopingConstant.Product.PRODUCT_OPEN);
		map.put("ptstatus", shopingConstant.productType.PRODYCT_TYPE_OPEN);
		String productMsg = (String)session.getAttribute("productMsg");
		if(productMsg!=null&&!"".equals(productMsg)){
			map.put("productMsg", productMsg);
			session.removeAttribute("productMsg");
		}
		return new ModelAndView("back/product", map);
	}
	
	private void saveFile(CommonsMultipartFile file,String path,String imgUrl){
		if(!file.isEmpty()){
			try {
				//拿到输出流，同时重命名上传的文件
				FileOutputStream os = new FileOutputStream(path+"/"+imgUrl);
				//拿到上传文件的输入流
				FileInputStream in = (FileInputStream) file.getInputStream();
				//以写字节的方式写文件
				int b = 0;
				while((b=in.read()) != -1){
					os.write(b);
				}
				os.flush();
				os.close();
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/addProduct")
	public String addProduct(@RequestParam("file") CommonsMultipartFile file,Product product,HttpSession session){
		String path = session.getServletContext().getRealPath("productImg");
		String imgUrl = new Date().getTime() + file.getOriginalFilename();
		product.setImgurl(imgUrl);
		product.setProstatus(shopingConstant.Product.PRODUCT_CLOSE);
		
		try {
			productService.addNewProduct(product);
			saveFile(file, path, imgUrl);
			session.setAttribute("productMsg", "商品添加成功");
		} catch (ProductException e) {
			session.setAttribute("productMsg", e.getMessage());
		}
		
		return "redirect:/ProductController/loadData";
	}
	
	@RequestMapping("/modifyProduct")
	public String modifyProduct(@RequestParam("file") CommonsMultipartFile file,Product product,HttpSession session){
		String path = session.getServletContext().getRealPath("productImg");
		String imgUrl = new Date().getTime() + file.getOriginalFilename();
		product.setImgurl(imgUrl);
		
		try {
			productService.modifyProduct(product);
			saveFile(file, path, imgUrl);
			session.setAttribute("productMsg", "商品修改成功");
		} catch (ProductException e) {
			session.setAttribute("productMsg", e.getMessage());
		}
		
		return "redirect:/ProductController/loadData";
	}
	
	@RequestMapping("/pageToProductModify")
	public ModelAndView pageToProductModify(Integer id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Product product = productService.findProductById(id);
		map.put("product", product);
		return new ModelAndView("forward:/productModify", map);
	}
	
	@RequestMapping("/deleteProduct")
	@ResponseBody
	public AjaxResult deleteProduct(Integer id){
		AjaxResult ajaxResult = null;
		try {
			productService.deleteProduct(id);
			ajaxResult = new AjaxResult(true, "商品删除成功", null);
		} catch (ProductException e) {
			ajaxResult = new AjaxResult(false, e.getMessage(), null);
		}
		return ajaxResult;
	}
	
	@RequestMapping("/changeProductStatus")
	@ResponseBody
	public AjaxResult changeProductStatus(Integer id){
		String msg = productService.changeProductStatus(id);
		return new AjaxResult(true, msg, null);
	}
}
