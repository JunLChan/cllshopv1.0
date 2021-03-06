package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.ProductMapper;
import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.ProductExample;
import cn.edu.lnsf.service.ProductsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductsService {

    final int DELETE_STATUS = 0;
    final int NORMAL_STATUS = 1;

    @Autowired
    ProductMapper productMapper;

    public List<Product> getAllProducts() {
        return productMapper.selAll();
    }

    public List<Product> getProductsByCondition(Product product) {
        return null;
    }

    public int addProduct(Product product) {
        if(productMapper.insertSelective(product)!=0){
            return 1;
        }
        return 0;
    }

    public int updateProduct(Product product) {
        ProductExample example = new ProductExample();
        example.createCriteria().andIdEqualTo(product.getId());
        return productMapper.updateByExampleSelective(product,example);
    }

    public int delProduct(int productId) {
        ProductExample example = new ProductExample();
        example.createCriteria().andIdEqualTo(productId);
        Product product = new Product();
        product.setStatus(DELETE_STATUS);
        productMapper.updateByExampleSelective(product,example);
        return 0;
    }

    public PageBean getPageData(int curPage) {
        PageBean pageBean = new PageBean();
        PageHelper.startPage(curPage,pageBean.getPageSize());
        List<Product> list = getAllProducts();
        //取分页信息
        PageInfo<Product> pageInfo = new PageInfo<Product>(list);
        long total = pageInfo.getTotal();
        pageBean.setData(list);
        pageBean.setTotalCount((int)total);
        pageBean.setCurPage(curPage);
        return pageBean;
    }

    public boolean batchDel(List<Integer> ids){
        ProductExample example = new ProductExample();
        example.createCriteria().andIdIn(ids);
        Product product = new Product();
        product.setStatus(DELETE_STATUS);
        int i = productMapper.updateByExampleSelective(product, example);
        if(i!=0){
            return true;
        }
        return false;
    }
}
