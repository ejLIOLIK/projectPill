package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.ProductDto;

public interface ProductService {
	public List<ProductDto> getListProduct();
	public ProductDto readProduct(String productCode);
	public List<ProductDto> getListSamePill(String productCode);
	public void deleteProduct(String productCode);
	public void editProduct(ProductDto pdto);
}
