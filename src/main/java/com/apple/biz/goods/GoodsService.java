package com.apple.biz.goods;

import java.util.List;

public interface GoodsService {
	
	void insertGoods(GoodsVO vo);
	
	void updateGoods(GoodsVO vo);

	void deleteGoods(GoodsVO vo);

	GoodsVO getGoods(GoodsVO vo);

	List<GoodsVO> getGoodsList(GoodsVO vo);
	
}