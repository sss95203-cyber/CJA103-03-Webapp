package com.shop.model;

import java.util.List;
import java.util.Map;

public interface ProTypeDAO {
	public void insert(ProTypeVO proTypeVO);

	public void update(ProTypeVO proTypeVO);

	public void delete(Integer proTypeVO);

	public ProTypeVO findByPrimaryKey(Integer proTypeId);

	public List<ProTypeVO> getAll();

	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//	public List<ProTypeVO> getAll(Map<String, String[]> map);

	// 根據 ID 取得單一類別資料
//	public ProTypeVO getById(Integer proTypeId);

	// 分頁查詢
//	public List<ProTypeVO> getAll(int currentPage);

	// 取得總筆數 (用於計算分頁總數)
//	long getTotal();
}