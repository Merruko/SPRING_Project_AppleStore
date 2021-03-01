package com.apple.view.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.apple.biz.goods.GoodsService;
import com.apple.biz.goods.GoodsVO;

@Controller
@SessionAttributes("goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/insertGoods.do")
	public String insertGoods(GoodsVO vo) {
		goodsService.insertGoods(vo);
		return "getGoodsList.do";
	}
	
	@RequestMapping("/updateGoods.do")
	public String updateGoods(@ModelAttribute("goods") GoodsVO vo) {
		goodsService.updateGoods(vo);
		return "getGoodsList.do";
	}
	
	@RequestMapping("/deleteGoods.do")
	public String deleteGoods(GoodsVO vo) {
		goodsService.deleteGoods(vo);
		return "getGoodsList.do";
	}
	
	@RequestMapping("/getGoods.do")
	public String getGoods(GoodsVO vo, Model model) {
		model.addAttribute("goods", goodsService.getGoods(vo));
		return "getGoods.jsp";
	}
	
	@RequestMapping("/getGoodsList.do")
	public String getGoodsList(GoodsVO vo, Model model) {
		model.addAttribute("goodsList", goodsService.getGoodsList(vo));
		return "getGoodsList.jsp";
	}
	
}