package edu.cornell.api;

import edu.cornell.api.domain.Product;
import edu.cornell.api.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HackathonApplication {

    private ProductService productService;

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

	@RequestMapping("/")
    public String home() {
        return "Hello Docker World!!!!!";
    }

    @RequestMapping("/{id}")
    public String productId(@PathVariable("id") Integer id) {
        Product product = productService.getProductById((id));
        return product.getDescription();

    }

	public static void main(String[] args) {
		SpringApplication.run(HackathonApplication.class, args);
	}
}
