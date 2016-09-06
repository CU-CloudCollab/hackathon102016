package edu.cornell.api.bootstrap;

import edu.cornell.api.domain.Product;
import edu.cornell.api.repositories.ProductRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class ProductLoader implements ApplicationListener<ContextRefreshedEvent> {

    private ProductRepository productRepository;

    private Logger log = Logger.getLogger(ProductLoader.class);

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

        Product shirt = new Product();
        shirt.setDescription("There are two kinds of people in the world: those who can extrapolate from incomplete data");
        shirt.setPrice(new BigDecimal("19.99"));
        shirt.setImageUrl("http://www.thinkgeek.com/images/products/additional/large/15cc_incomplete_data_dd.jpg");
        shirt.setProductId("15cc");
        productRepository.save(shirt);

        log.info("Saved Shirt - id: " + shirt.getId());

        Product mug = new Product();
        mug.setDescription("Harry Potter Cauldron Mug");
        mug.setImageUrl("http://www.thinkgeek.com/images/products/zoom/jigl_harry_potter_cauldron_mug.jpg");
        mug.setProductId("jigl");
        mug.setPrice(new BigDecimal("12.99"));
        productRepository.save(mug);

        log.info("Saved Mug - id:" + mug.getId());
    }
}
