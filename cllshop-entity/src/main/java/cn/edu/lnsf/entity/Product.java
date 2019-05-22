package cn.edu.lnsf.entity;

import java.util.Date;

public class Product {
    private Integer id;

    private String description;

    private String name;

    private Long price;

    private String images;

    private Integer stock;

    private Integer smalltypeid;

    private Integer bigtypeid;

    private Integer storeid;

    private Date hot;

    private Date hottime;

    private Date createtime;

    private Date updatetime;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images == null ? null : images.trim();
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getSmalltypeid() {
        return smalltypeid;
    }

    public void setSmalltypeid(Integer smalltypeid) {
        this.smalltypeid = smalltypeid;
    }

    public Integer getBigtypeid() {
        return bigtypeid;
    }

    public void setBigtypeid(Integer bigtypeid) {
        this.bigtypeid = bigtypeid;
    }

    public Integer getStoreid() {
        return storeid;
    }

    public void setStoreid(Integer storeid) {
        this.storeid = storeid;
    }

    public Date getHot() {
        return hot;
    }

    public void setHot(Date hot) {
        this.hot = hot;
    }

    public Date getHottime() {
        return hottime;
    }

    public void setHottime(Date hottime) {
        this.hottime = hottime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}