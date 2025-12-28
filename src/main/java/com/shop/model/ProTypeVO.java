package com.shop.model;

import java.io.Serializable;

public class ProTypeVO implements Serializable {
    
    private Integer proTypeId;    // 商品類別編號 (PK, NOT NULL)
    private String proTypeName;   // 商品類別名稱 (VARCHAR 20, NOT NULL)

    // 無參數建構子 
    public ProTypeVO() {
    }

    // Getter & Setter
    public Integer getProTypeId() {
        return proTypeId;
    }

    public void setProTypeId(Integer proTypeId) {
        this.proTypeId = proTypeId;
    }

    public String getProTypeName() {
        return proTypeName;
    }

    public void setProTypeName(String proTypeName) {
        this.proTypeName = proTypeName;
    }
}