package edu.cornell.api.services;

import edu.cornell.api.domain.Product;

public interface ProductService {
    Iterable<Product> listAllProducts();
    Product getProductById(Integer id);
    Product saveProduct(Product product);
}
