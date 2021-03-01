package com.apple.biz.goods.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apple.biz.goods.GoodsService;
import com.apple.biz.goods.GoodsVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public void insertGoods(GoodsVO vo) {
		goodsDAO.insertGoods(vo);
	}
	
	public void updateGoods(GoodsVO vo) {
		goodsDAO.updateGoods(vo);
	}

	public void deleteGoods(GoodsVO vo) {
		goodsDAO.deleteGoods(vo);
	}

	public GoodsVO getGoods(GoodsVO vo) {
		return goodsDAO.getGoods(vo);
	}
	
	public List<GoodsVO> getGoodsList(GoodsVO vo) {
		return goodsDAO.getGoodsList(vo);
	}
	
}