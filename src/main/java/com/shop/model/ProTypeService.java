package com.shop.model;

import java.util.List;

public class ProTypeService {

	private ProTypeDAO dao;

	public ProTypeService() {
		dao = new ProTypeDAOImpl();
	}
	// 新增類別
	public ProTypeVO addProType(String proTypeName) {

		ProTypeVO proTypeVO = new ProTypeVO();

		proTypeVO.setProTypeName(proTypeName);
		dao.insert(proTypeVO);

		return proTypeVO;
	}

	// 修改類別
	public ProTypeVO updateProType(Integer proTypeId, String proTypeName) {

		ProTypeVO proTypeVO = new ProTypeVO();

		proTypeVO.setProTypeId(proTypeId);
		proTypeVO.setProTypeName(proTypeName);
		dao.update(proTypeVO);

		return proTypeVO;
	}

	// 刪除類別
	public void deleteProType(Integer proTypeId) {
		dao.delete(proTypeId);
	}

	// 取得單一類別
	public ProTypeVO getOneProType(Integer proTypeId) {
		return dao.findByPrimaryKey(proTypeId);
	}

	// 取得全部類別
	public List<ProTypeVO> getAll() {
		return dao.getAll();
	}
}
